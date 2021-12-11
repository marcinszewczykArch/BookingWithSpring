package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Data
@Entity
public class Reservation implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    String reservationCode;
    @ManyToOne
    Apartment apartment;
    LocalDate checkIn;
    LocalDate checkOut;
    int stayDuration;
    int adults;
    int children;
    int smallChildren;
    String guestName;
    String guestCountry;
    LocalDate reservationDate;
    Double moneyTransfer;

    public Reservation(String reservationCode, Apartment apartment, LocalDate checkIn, LocalDate checkOut, int stayDuration, int adults, int children, int smallChildren, String guestName, String guestCountry, LocalDate reservationDate, Double moneyTransfer) {
        this.reservationCode = reservationCode;
        this.apartment = apartment;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.stayDuration = stayDuration;
        this.adults = adults;
        this.children = children;
        this.smallChildren = smallChildren;
        this.guestName = guestName;
        this.guestCountry = guestCountry;
        this.reservationDate = reservationDate;
        this.moneyTransfer = moneyTransfer;
    }

    public Reservation(Apartment apartment, LocalDate checkIn, LocalDate checkOut) {
        this.apartment = apartment;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
    }

    public Reservation() {
    }

}
