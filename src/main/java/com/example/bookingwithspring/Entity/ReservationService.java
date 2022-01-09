package com.example.bookingwithspring.Entity;

import com.example.bookingwithspring.Repo.CleaningRepo;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.channels.FileChannel;
import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@Service
public class ReservationService {
    private final ReservationRepo reservationRepo;
    private final ReservationToMapper reservationToMapper;
    private final CleaningRepo cleaningRepo;

    public ReservationService(ReservationRepo reservationRepo, ReservationToMapper reservationToMapper, CleaningRepo cleaningRepo) {
        this.reservationRepo = reservationRepo;
        this.reservationToMapper = reservationToMapper;
        this.cleaningRepo = cleaningRepo;
    }

    public List<ReservationTo> getAllReservations() {
        return reservationRepo.findAll()
                .stream()
                .map(reservationToMapper::map)
                .toList();
    }

    public Optional<ReservationTo> getReservationById(Long id) {
        return reservationRepo.findById(id)
                .map(reservationToMapper::map);
    }

    public List<ReservationTo> getReservationByMultipleParam(Long apartmentId, String checkIn, String checkOut, String guestName, String guestCountry, String reservationDate, String checkInFrom, String checkInTo) {
        return reservationRepo.getReservationByMultipleParam
                (apartmentId, checkIn, checkOut, guestName, guestCountry, reservationDate, checkInFrom, checkInTo)
                .stream()
                .map(reservationToMapper::map)
                .toList();
    }

    public ReservationTo saveReservation(ReservationTo reservationTo) {
        Reservation reservation = reservationToMapper.map(reservationTo);
        Reservation savedReservation = reservationRepo.save(reservation);
        return reservationToMapper.map(savedReservation);
    }

    public Optional<ReservationTo> deleteReservationById(Long id) {
        Optional<ReservationTo> reservationToDelete = reservationRepo
                .findById(id)
                .stream()
                .map(reservationToMapper::map)
                .findFirst();

        if (!reservationToDelete.isEmpty()) {
            reservationRepo.deleteById(id);
        }

        return reservationToDelete;
    }

    @Transactional
    public Optional<ReservationTo> updateReservationById(Long id, ReservationTo reservation) {
        return reservationRepo.findById(id)
                .map(target -> reservationToMapper.setEntityFields(reservation, target))
                .map(reservationToMapper::map);
    }

}
