package com.example.bookingwithspring;

import com.example.bookingwithspring.Entity.*;
import com.example.bookingwithspring.Repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Component
public class Start {

    private ReservationRepo reservationRepo;
    private ApartmentRepo apartmentRepo;
    private PeopleRepo peopleRepo;
    private OwnerRepo ownerRepo;
    private CleaningPersonRepo cleaningPersonRepo;
    private CleaningRepo cleaningRepo;
    private UserRepo userRepo;
    private TaskManagerRepo taskManagerRepo;
    private ReservationService reservationService;

    @Autowired
    public Start(ReservationService reservationService, TaskManagerRepo taskManagerRepo, ReservationRepo reservationRepo, ApartmentRepo apartmentRepo, PeopleRepo peopleRepo, OwnerRepo ownerRepo, CleaningPersonRepo cleaningPersonRepo, CleaningRepo cleaningRepo, UserRepo userRepo) {
        this.reservationRepo = reservationRepo;
        this.apartmentRepo = apartmentRepo;
        this.peopleRepo = peopleRepo;
        this.ownerRepo = ownerRepo;
        this.cleaningPersonRepo = cleaningPersonRepo;
        this.cleaningRepo = cleaningRepo;
        this.userRepo = userRepo;
        this.taskManagerRepo = taskManagerRepo;
        this.reservationService = reservationService;
    }

    @EventListener(ApplicationReadyEvent.class)
    private void autoUpdateDB() {
        while(true){
            reservationService.updateReservationsInDB();

            TaskManager airbnbReservationsTask = taskManagerRepo.findByTask("airbnbReservations");
            int airbnbReservationsFreq = airbnbReservationsTask.getFrequencyMinutes();
            airbnbReservationsTask.setNextExecution(LocalDateTime.now().plusMinutes(airbnbReservationsFreq));
            taskManagerRepo.save(airbnbReservationsTask);
            try {
                TimeUnit.MINUTES.sleep(airbnbReservationsFreq);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


}
