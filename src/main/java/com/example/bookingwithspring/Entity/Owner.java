package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Owner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    People people;



    public Owner(People people) {
        this.people = people;
    }

    public Owner(People people, List<Apartment> apartments) {
        this.people = people;
    }

    public Owner() {
    }

}
