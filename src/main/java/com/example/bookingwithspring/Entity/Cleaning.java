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
    CleaningPerson cleaningPerson;
    int extraBedding;
    LocalDate cleaningDate;
    boolean isDone;

    public Cleaning() {
    }

    public Cleaning(LocalDate cleaningDate) {
        this.cleaningDate = cleaningDate;
    }

    public Cleaning(CleaningPerson cleaningPerson, LocalDate cleaningDate) {
        this.cleaningPerson = cleaningPerson;
        this.cleaningDate = cleaningDate;
    }
}
