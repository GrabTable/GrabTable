package edu.skku.grabtable.reservation.aop;

import edu.skku.grabtable.reservation.service.ReservationService;
import edu.skku.grabtable.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
@RequiredArgsConstructor
public class ReservationAspect {

    private final ReservationService reservationService;

    @Pointcut("execution(* edu.skku.grabtable.cart.controller.CartController.addCart(..)) || " +
            "execution(* edu.skku.grabtable.cart.controller.CartController.updateCart(..)) || " +
            "execution(* edu.skku.grabtable.cart.controller.CartController.deleteCart(..))")
    public void cartControllerUpdateMethods() {
    }

    @Pointcut("execution(* edu.skku.grabtable.reservation.controller.ReservationController.create(..)) || " +
            "execution(* edu.skku.grabtable.reservation.controller.ReservationController.join(..)) || " +
            "execution(* edu.skku.grabtable.reservation.controller.ReservationController.confirm(..)) || " +
            "execution(* edu.skku.grabtable.reservation.controller.ReservationController.cancelReservation(..))")
    public void reservationControllerUpdateMethods() {

    }

    @AfterReturning("cartControllerUpdateMethods() || reservationControllerUpdateMethods()")
    public void sendReservationEvent(JoinPoint joinPoint) throws Throwable {
        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            if (arg instanceof User user) {
                reservationService.send(user.getId());
                break;
            }
        }
    }
}