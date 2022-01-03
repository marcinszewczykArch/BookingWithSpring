package com.example.bookingwithspring.Entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Data
public class ReservationTo {

    private Long id;
    String reservationCode;
    String apartment;
    LocalDate checkIn;
    LocalDate checkOut;
    Integer stayDuration;
    Integer adults;
    Integer children;
    Integer smallChildren;
    String guestName;
    String guestCountry;
    LocalDate reservationDate;
    Double moneyTransfer;

}
