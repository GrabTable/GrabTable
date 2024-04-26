package edu.skku.grabtable.reservation.controller;

import edu.skku.grabtable.auth.annotation.AuthUser;
import edu.skku.grabtable.domain.User;
import edu.skku.grabtable.reservation.domain.Reservation;
import edu.skku.grabtable.reservation.service.ReservationService;
import lombok.RequiredArgsConstructor;
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
    public Reservation create(@AuthUser User user) {
        return reservationService.createNewReservation(user.getId());
    }

    @PostMapping("/{inviteCode}")
    public void join(
            @AuthUser User user,
            @PathVariable String inviteCode
    ) {
        reservationService.joinExistingReservation(user.getId(), inviteCode);
    }

//    @GetMapping("/{reservationId}")
//    public ReservationDetailResponse findReservation(
//            @PathVariable Long reservationId
//    ) {
//
//    }
}
