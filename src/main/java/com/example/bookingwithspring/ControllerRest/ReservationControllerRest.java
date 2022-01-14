package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Entity.ReservationService;
import com.example.bookingwithspring.Entity.ReservationTo;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@RestController
@RequestMapping("/api/reservations")
public class ReservationControllerRest {

    private ReservationRepo reservationRepo;
    private ReservationService reservationService;

    @Autowired
    public ReservationControllerRest(ReservationRepo reservationRepo, ReservationService reservationService) {
        this.reservationRepo = reservationRepo;
        this.reservationService = reservationService;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ReservationTo> getAllReservations() {
        return reservationService.getAllReservations();
    }


    @GetMapping(path = "/findBy", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<ReservationTo> getReservationByMultipleParam(
            @RequestParam(required = false) Long apartmentId,
            @RequestParam(required = false) String checkIn,
            @RequestParam(required = false) String checkOut,
            @RequestParam(required = false) String guestName,
            @RequestParam(required = false) String guestCountry,
            @RequestParam(required = false) String reservationDate,
            @RequestParam(required = false) String checkInFrom,
            @RequestParam(required = false) String checkInTo) {
        return reservationService.getReservationByMultipleParam
                (apartmentId, checkIn, checkOut, guestName, guestCountry, reservationDate, checkInFrom, checkInTo);
    }


    @GetMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ReservationTo> getReservationById(@PathVariable Long id) {
        return reservationService.getReservationById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ReservationTo> saveReservation(@RequestBody ReservationTo reservation) {
        ReservationTo savedReservation = reservationService.saveReservation(reservation);
        URI savedReservationUri = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(savedReservation.getId())
                .toUri();
        return ResponseEntity.created(savedReservationUri).body(savedReservation);
    }

    @DeleteMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ReservationTo> deleteReservation(@PathVariable Long id) {
        return reservationService.deleteReservationById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }


    @PatchMapping(path = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    ResponseEntity<ReservationTo> updateReservation(@PathVariable Long id, @RequestBody ReservationTo reservation) {
        return reservationService.updateReservationById(id, reservation)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping(path = "/refresh")
    public boolean refreshReservationsImport() {
        return reservationService.updateReservationsInDB();
    }

}
