package edu.skku.grabtable.reservation.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.reservation.domain.request.ReservationRequest;
import edu.skku.grabtable.reservation.domain.response.ReservationDetailResponse;
import edu.skku.grabtable.reservation.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/reservation")
@RequiredArgsConstructor
public class ReservationController {

    private final ReservationService reservationService;

    @PostMapping
    public ResponseEntity<Void> create(
            @AuthUser User user,
            ReservationRequest reservationRequest
    ) {
        reservationService.createNewReservation(user.getId(), reservationRequest.getStoreId());
        return ResponseEntity.ok().build();
    }

    @PostMapping("/{inviteCode}")
    public void join(
            @AuthUser User user,
            @PathVariable String inviteCode
    ) {
        reservationService.joinExistingReservation(user.getId(), inviteCode);
    }

    @GetMapping("/me")
    public ReservationDetailResponse findCurrentReservation(@AuthUser User user) {
        return reservationService.findByUserId(user.getId());
    }

    @PostMapping("/confirm")
    public void confirm(@AuthUser User user) {
        reservationService.confirmCurrentReservation(user.getId());
    }

    @DeleteMapping
    public ResponseEntity<Void> cancelReservation(@AuthUser User user) {
        reservationService.cancel(user.getId());
        return ResponseEntity.noContent().build();
    }
}
