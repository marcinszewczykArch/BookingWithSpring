package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class Apartment {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    String apartmentName;
    String airbnbLink;
    int guestsNumber;
    String address;
    int size;
    @OneToMany
    private List<Reservation> reservations;
    @ManyToOne
    Owner owner;
    String image;

    public Apartment() {
    }
    public Apartment(String apartmentName, String airbnbLink, int guestsNumber, String address, int size, String image) {
        this.apartmentName = apartmentName;
        this.airbnbLink = airbnbLink;
        this.guestsNumber = guestsNumber;
        this.address = address;
        this.size = size;
        this.image = image;
    }
}
