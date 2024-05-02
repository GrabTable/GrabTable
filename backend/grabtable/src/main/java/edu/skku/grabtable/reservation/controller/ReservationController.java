package edu.skku.grabtable.reservation.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.order.domain.response.OrderResponse;
import edu.skku.grabtable.reservation.domain.request.ReservationRequest;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.user.domain.User;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/reservations")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;

    @PostMapping
    public ResponseEntity<Void> create(
            @AuthUser User user,
            @RequestBody ReservationRequest reservationRequest
    ) {
        reservationService.createNewReservation(user, reservationRequest.getStoreId());
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @PostMapping("/{inviteCode}")
    public ResponseEntity<Void> join(
            @AuthUser User user,
            @PathVariable String inviteCode
    ) {
        reservationService.joinExistingReservation(user, inviteCode);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    //select 6개 나감 (TODO)
    @GetMapping("/me")
    public ReservationDetailResponse findCurrentReservation(@AuthUser User user) {
        return reservationService.findReservationByUser(user);
    }

    @PostMapping("/confirm")
    public ResponseEntity<Void> confirm(@AuthUser User user) {
        reservationService.confirmCurrentReservation(user);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @DeleteMapping
    public ResponseEntity<Void> cancelReservation(@AuthUser User user) {
        reservationService.cancel(user);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/{reservationId}/orders")
    public List<OrderResponse> findAllOrders(@PathVariable Long reservationId) {
        return reservationService.findAllOrdersByReservationId(reservationId);
    }
}
