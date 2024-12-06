package edu.skku.grabtable.controller

import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping
class DelayController {

    @GetMapping("/api/v1/delay-success/{delay}")
    fun delaySuccess(
        @PathVariable delay: Long
    ): ResponseEntity<String> {
        Thread.sleep(delay * 1000)
        return ResponseEntity.ok("delay success")
    }

    @GetMapping("/api/v1/delay-failure/{delay}")
    fun delayFailure(
        @PathVariable delay: Long
    ): ResponseEntity<String> {
        Thread.sleep(delay * 1000)
        return ResponseEntity
            .status(HttpStatus.SERVICE_UNAVAILABLE)
            .body("delay failed")
    }
}

