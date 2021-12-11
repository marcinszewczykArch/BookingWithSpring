package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Repository
public interface ReservationRepo extends JpaRepository<Reservation, Long> {


    List<Reservation> findByGuestCountry(String guestCountry);

    @Query("select r from Reservation r left join fetch r.apartment a where a.id = :id")
    List<Reservation> findByApartmentId(@Param("id") long id);


    default List<Reservation> getReservationByMultipleParam (
            Long apartmentId,
            String checkIn,
            String checkOut,
            String guestName,
            String guestCountry,
            String reservationDate,
            String checkInFrom,
            String checkInTo) {

        List<Reservation> reservations = findAll();

        if (apartmentId != null) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getApartment().getId().equals(apartmentId))
                    .toList();
        }

        if (checkIn != null && !checkIn.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getCheckIn().isEqual(LocalDate.parse(checkIn, DateTimeFormatter.ISO_DATE)))
                    .toList();
        }

        if (checkOut != null && !checkOut.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getCheckOut().isEqual(LocalDate.parse(checkOut, DateTimeFormatter.ISO_DATE)))
                    .toList();
        }

        if (guestName != null && !guestName.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getGuestName() != null)
                    .filter(reservation -> reservation.getGuestName().equalsIgnoreCase(guestName))
                    .toList();
        }

        if (guestCountry != null && !guestCountry.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getGuestCountry() != null)
                    .filter(reservation -> reservation.getGuestCountry().equalsIgnoreCase(guestCountry))
                    .toList();
        }

        if (reservationDate != null && !reservationDate.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> reservation.getReservationDate().isEqual(LocalDate.parse(reservationDate, DateTimeFormatter.ISO_DATE)))
                    .toList();
        }

        if (checkInFrom != null && !checkInFrom.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> !reservation.getCheckIn().isBefore(LocalDate.parse(checkInFrom, DateTimeFormatter.ISO_DATE)))
                    .toList();
        }

        if (checkInTo != null && !checkInTo.isEmpty()) {
            reservations = reservations.stream()
                    .filter(reservation -> !reservation.getCheckIn().isAfter(LocalDate.parse(checkInTo, DateTimeFormatter.ISO_DATE)))
                    .toList();
        }


        reservations = reservations.stream()
                .sorted(Comparator
                        .comparing(Reservation::getCheckIn)
                        .thenComparing(Reservation::getId))
                .toList();

        return reservations;
    };

}