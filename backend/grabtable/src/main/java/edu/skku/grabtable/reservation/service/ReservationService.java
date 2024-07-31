package edu.skku.grabtable.reservation.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.skku.grabtable.cart.domain.Cart;
import edu.skku.grabtable.cart.domain.response.CartResponse;
import edu.skku.grabtable.cart.repository.CartRepository;
import edu.skku.grabtable.common.exception.BadRequestException;
import edu.skku.grabtable.common.exception.ExceptionCode;
import edu.skku.grabtable.order.domain.Order;
import edu.skku.grabtable.order.domain.SharedOrder;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.order.domain.response.SharedOrderResponse;
import edu.skku.grabtable.order.repository.OrderRepository;
import edu.skku.grabtable.reservation.domain.InvitedReservationHistory;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.domain.ReservationHistory;
import edu.skku.grabtable.reservation.domain.event.ReservationFinishEvent;
import edu.skku.grabtable.reservation.domain.event.ReservationUpdateEvent;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.domain.response.UserCartsInfoResponse;
import edu.skku.grabtable.reservation.repository.ReservationHistoryRepository;
import edu.skku.grabtable.reservation.repository.ReservationRepository;
import edu.skku.grabtable.sse.repository.SseEmitterInMemoryRepository;
import edu.skku.grabtable.store.domain.Store;
import edu.skku.grabtable.store.repository.StoreRepository;
import edu.skku.grabtable.user.domain.User;
import edu.skku.grabtable.user.repository.UserRepository;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class ReservationService {

    private final ReservationRepository reservationRepository;
    private final StoreRepository storeRepository;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final CartRepository cartRepository;
    private final ReservationHistoryRepository reservationHistoryRepository;
    private final SseEmitterInMemoryRepository sseEmitterRepository;

    private final RedisTemplate<String, Object> redisTemplate;
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RedisMessageListenerContainer redisMessageListenerContainer;

    public void createNewReservation(User user, Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_STORE_ID));

        if (reservationRepository.existsByHostId(user.getId())) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        Reservation reservation = new Reservation(user, store);
        reservationRepository.save(reservation);
    }

    public void joinExistingReservation(User user, String inviteCode) {
        Reservation reservation = reservationRepository.findByInviteCode(inviteCode)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));

        if (reservationRepository.existsByHostId(user.getId())) {
            throw new BadRequestException(ExceptionCode.ALREADY_HOSTING_USER);
        }

        if (user.getInvitedReservation() != null) {
            throw new BadRequestException(ExceptionCode.ALREADY_INVITED_USER);
        }

        user.joinReservation(reservation);
        userRepository.save(user);
    }

    public ReservationDetailResponse findOngoingReservationByUser(User user) {
        Reservation reservation = reservationRepository.findOngoingReservationByUser(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        List<OrderResponse> orders = orderRepository.findByReservation(reservation)
                .stream()
                .map(order -> new OrderResponse(
                        order.getId(),
                        order.getUser().getId(),
                        order.getCarts().stream().map(CartResponse::of).toList(),
                        order.getTotalPrice(),
                        order.getStatus().toString()))
                .toList();

        UserCartsInfoResponse hostInfo = UserCartsInfoResponse.of(
                reservation.getHost().getId(),
                reservation.getHost().getUsername(),
                reservation.getHost().getProfileImageUrl(),
                cartRepository.findHostCurrentCartsByReservationId(reservation.getId())
                        .stream().map(CartResponse::of).toList()
        );

        SharedOrderResponse sharedOrderResponse = SharedOrderResponse.of(
                reservation.getSharedOrder().getId(),
                reservation.getSharedOrder().getCarts()
                        .stream().map(CartResponse::of).toList(),
                reservation.getSharedOrder().getOrders()
                        .stream().map(OrderResponse::of).toList(),
                reservation.getSharedOrder().calculateTotalAmount(),
                reservation.getSharedOrder().calculateLeftAmount()
        );

        List<UserCartsInfoResponse> inviteesInfo = userRepository.findAllByInvitedReservation(reservation)
                .stream().map(invitee -> UserCartsInfoResponse.of(
                        invitee.getId(),
                        invitee.getUsername(),
                        invitee.getProfileImageUrl(),
                        invitee.getCarts().stream().map(CartResponse::of).toList()
                )).toList();

        return ReservationDetailResponse.of(
                reservation.getId(),
                reservation.getStore().getId(),
                hostInfo,
                inviteesInfo,
                reservation.getInviteCode(),
                sharedOrderResponse,
                orders);
    }

    public void cancel(User user) {
        if (user.getInvitedReservation() != null) {
            leaveFromReservation(user);
            return;
        }
        destroyReservation(user);
    }

    public void leaveFromReservation(User invitee) {
        invitee.clearReservation();
        cartRepository.findByUserId(invitee.getId())
                .forEach(Cart::disconnectUser);
    }

    public void destroyReservation(User host) {
        Reservation reservation = reservationRepository.findByHost(host)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        reservationRepository.delete(reservation);

        List<User> invitees = userRepository.findByInvitedReservation(reservation);
        for (User invitee : invitees) {
            invitee.clearReservation();
            cartRepository.findByUserId(invitee.getId())
                    .forEach(Cart::disconnectUser);
        }
    }

    public void confirmCurrentReservation(User user) {
        Reservation reservation = reservationRepository.findByHostFetchJoin(user)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NO_RESERVATION_USER));

        //공유 주문과 개인 주문의 합이 하나도 없을 경우 확정 불가
        validateMoreThanOneOrderExists(reservation);

        //공유 주문 완료되었는지 검사
        validateSharedOrderIsFullyPaid(reservation);

        //예약을 확정 처리
        reservation.confirm();

        List<InvitedReservationHistory> invitedReservationHistories = new ArrayList<>();
        userRepository.resetReservationByReservation(reservation);
        List<User> invitees = reservation.getInvitees();
        for (User invitee : invitees) {
            invitedReservationHistories.add(InvitedReservationHistory.from(invitee));
            cartRepository.findByUserId(invitee.getId())
                    .forEach(Cart::disconnectUser);
        }

        orderRepository.resetReservationByReservation(reservation);
        ReservationHistory reservationHistory = ReservationHistory.of(reservation, invitedReservationHistories);
        reservationHistoryRepository.save(reservationHistory);
        reservationRepository.delete(reservation);
    }

    private void validateMoreThanOneOrderExists(Reservation reservation) {
        if (reservation.getSharedOrder().getOrders().isEmpty() &&
                !orderRepository.existsByReservation(reservation)) {
            throw new BadRequestException(ExceptionCode.NO_ORDER_FOUND_IN_RESERVATION);
        }
    }

    private void validateSharedOrderIsFullyPaid(Reservation reservation) {
        SharedOrder sharedOrder = reservation.getSharedOrder();
        if (sharedOrder.calculateLeftAmount() > 0) {
            throw new BadRequestException(ExceptionCode.UNPAID_AMOUNT_EXIST);
        }
    }

    public List<OrderResponse> findAllOrdersByReservationId(Long reservationId) {
        Reservation reservation = reservationRepository.findById(reservationId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_RESERVATION_ID));
        return orderRepository.findByReservation(reservation)
                .stream()
                .map(order -> new OrderResponse(
                        order.getId(),
                        order.getUser().getId(),
                        order.getCarts().stream().map(CartResponse::of).toList(),
                        order.getTotalPrice(),
                        order.getStatus().toString()))
                .toList();
    }

    /* Server-sent Event 처리 */

    public void sendUpdateEvent(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_USER_ID));
        ReservationDetailResponse detail = findOngoingReservationByUser(user);
        ReservationUpdateEvent reservationUpdateEvent = new ReservationUpdateEvent(detail);
        redisTemplate.convertAndSend(getChannelName(detail.getId()), reservationUpdateEvent);
    }

    public void sendFinishEvent(Long userId) {
        Reservation reservation = reservationRepository.findLastRecentlyConfirmedReservationByUserId(userId)
                .orElseThrow(() -> new BadRequestException(ExceptionCode.NOT_FOUND_LAST_RECENT_CONFIRMED_RESERVATION));
        ReservationFinishEvent reservationFinishEvent = new ReservationFinishEvent(reservation.getId());
        redisTemplate.convertAndSend(getChannelName(reservation.getId()), reservationFinishEvent);
    }

    public SseEmitter createEmitter(User user) {
        Long userId = user.getId();
        ReservationDetailResponse detail = findOngoingReservationByUser(user);
        ReservationUpdateEvent reservationUpdateEvent = new ReservationUpdateEvent(detail);
        sseEmitterRepository.save(userId);
        SseEmitter emitter = sseEmitterRepository.findById(userId).orElseThrow();

        try {
            emitter.send(SseEmitter.event()
                    .id(userId.toString())
                    .name("reservationUpdate")
                    .data(reservationUpdateEvent));
        } catch (IOException e) {
            log.error("SSE 연결 초기화 오류 발생, userId={}", userId);
            throw new RuntimeException(e);
        }

        MessageListener messageListener = (message, pattern) -> sendToClient(emitter, userId, message);

        redisMessageListenerContainer
                .addMessageListener(
                        messageListener,
                        ChannelTopic.of(getChannelName(detail.getId()))
                );

        setEmitterCallbacks(userId, emitter, messageListener);

        return emitter;
    }

    private String getChannelName(Long reservationId) {
        return "Reservation-" + reservationId;
    }

    private void setEmitterCallbacks(Long userId, SseEmitter emitter, MessageListener messageListener) {
        emitter.onCompletion(() -> {
            sseEmitterRepository.deleteById(userId);
            redisMessageListenerContainer.removeMessageListener(messageListener);
        });
        emitter.onTimeout(() -> {
            sseEmitterRepository.deleteById(userId);
            redisMessageListenerContainer.removeMessageListener(messageListener);
        });
        emitter.onError((e) -> {
            sseEmitterRepository.deleteById(userId);
            redisMessageListenerContainer.removeMessageListener(messageListener);
        });
    }

    private void sendToClient(SseEmitter emitter, Long userId, Message data) {
        try {
            ReservationUpdateEvent reservationUpdateEvent = objectMapper.readValue(data.getBody(),
                    ReservationUpdateEvent.class);
            emitter.send(SseEmitter.event()
                    .id(userId.toString())
                    .name("reservationUpdate")
                    .data(reservationUpdateEvent));
        } catch (IllegalArgumentException ignored) {
        } catch (IOException e) {
            sseEmitterRepository.deleteById(userId);
        }

        try {
            ReservationFinishEvent reservationFinishEvent = objectMapper.readValue(data.getBody(),
                    ReservationFinishEvent.class);
            emitter.send(SseEmitter.event()
                    .id(userId.toString())
                    .name("reservationFinish")
                    .data(reservationFinishEvent, MediaType.APPLICATION_JSON));
        } catch (IllegalArgumentException ignored) {
        } catch (IOException e) {
            sseEmitterRepository.deleteById(userId);
        }
    }


}
