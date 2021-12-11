package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
public class CleaningPerson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    People people;
    LocalDate workStart;
    LocalDate workEnd;
    boolean isAvailabe;


    public CleaningPerson(People people) {
        this.people = people;
    }
    public CleaningPerson(){}
}
