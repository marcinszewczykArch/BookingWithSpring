package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class Cleaning {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    Reservation reservation;
    @OneToOne
    CleaningPerson cleaningPerson;
    int extraBedding;
    LocalDate cleaningDate;
    boolean isDone;

    public Cleaning() {
    }

    public Cleaning(Reservation reservation, LocalDate cleaningDate) {
        this.reservation = reservation;
        this.cleaningDate = cleaningDate;
    }

    public Cleaning(Reservation reservation, CleaningPerson cleaningPerson, LocalDate cleaningDate) {
        this.reservation = reservation;
        this.cleaningPerson = cleaningPerson;
        this.cleaningDate = cleaningDate;
    }
}
