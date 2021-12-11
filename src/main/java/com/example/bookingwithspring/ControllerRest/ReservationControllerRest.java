package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/reservations")
public class ReservationControllerRest {

    private ReservationRepo reservationRepo;

    @Autowired
    public ReservationControllerRest(ReservationRepo reservationRepo) {
        this.reservationRepo = reservationRepo;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = reservationRepo.findAll();
        return reservations;
    }


    @GetMapping(path = "/findBy", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<Reservation> getReservationByMultipleParam(
            @RequestParam(required = false) Long apartmentId,
            @RequestParam(required = false) String checkIn,
            @RequestParam(required = false) String checkOut,
            @RequestParam(required = false) String guestName,
            @RequestParam(required = false) String guestCountry,
            @RequestParam(required = false) String reservationDate,
            @RequestParam(required = false) String checkInFrom,
            @RequestParam(required = false) String checkInTo) {
        List<Reservation> reservations = reservationRepo
                .getReservationByMultipleParam (apartmentId, checkIn, checkOut, guestName, guestCountry, reservationDate, checkInFrom, checkInTo);
        return reservations;
    }


    @GetMapping(path = "/{reservationId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Reservation> getReservationById(@PathVariable Long reservationId) {
        return reservationRepo.findById(reservationId)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public void saveCity(@RequestBody Reservation reservation) {
        reservationRepo.save(reservation);
    }
}
