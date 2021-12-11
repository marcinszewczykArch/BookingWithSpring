package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class People {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    String firstName;
    String lastName;
    String phoneNumber;
    String email;


    public People(String firstName, String lastName, String phoneNumber, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public People() {
    }
}
