package com.example.bookingwithspring.Entity;

import com.example.bookingwithspring.CsvImport;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import com.example.bookingwithspring.Repo.CleaningRepo;
import com.example.bookingwithspring.Repo.ReservationRepo;
import com.example.bookingwithspring.Repo.TaskManagerRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Optional;

@Service
public class ReservationService {
    private final ReservationRepo reservationRepo;
    private final ReservationToMapper reservationToMapper;
    private final CleaningRepo cleaningRepo;
    private final TaskManagerRepo taskManagerRepo;
    private final ApartmentRepo apartmentRepo;

    public ReservationService(ApartmentRepo apartmentRepo, ReservationRepo reservationRepo, ReservationToMapper reservationToMapper, CleaningRepo cleaningRepo, TaskManagerRepo taskManagerRepo) {
        this.reservationRepo = reservationRepo;
        this.reservationToMapper = reservationToMapper;
        this.cleaningRepo = cleaningRepo;
        this.taskManagerRepo = taskManagerRepo;
        this.apartmentRepo = apartmentRepo;
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

    public boolean updateReservationsInDB() {

        CsvImport csvImport = new CsvImport(apartmentRepo);
        TaskManager airbnbReservationsTask = taskManagerRepo.findByTask("airbnbReservations");
        LocalDateTime operationStart = LocalDateTime.now();


        List<Reservation> reservationsFromAirbnb = null;
        try {
            reservationsFromAirbnb = csvImport.importReservations();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        List<Reservation> reservationsFromDB = reservationRepo.findAll();

        if(reservationsFromAirbnb != null) {
            for (Reservation reservationFromAirbnb : reservationsFromAirbnb) {
                boolean addReservationFromAirbnbToDB = true;

                for (Reservation reservationFromDB : reservationsFromDB) {
                    if (reservationFromDB.getReservationCode().equals(reservationFromAirbnb.getReservationCode())) {
                        addReservationFromAirbnbToDB = false;
                    }
                }
                if (addReservationFromAirbnbToDB) {
                    reservationRepo.save(reservationFromAirbnb);
                }
            }
        } else {
            System.out.println("reservations import from CSV is empty");
            return false;
        }

        airbnbReservationsTask.setLastExecution(LocalDateTime.now());
        airbnbReservationsTask.setDurationMilisec(ChronoUnit.MILLIS.between(operationStart, LocalDateTime.now()));
        taskManagerRepo.save(airbnbReservationsTask);

        return true;
    }

}
