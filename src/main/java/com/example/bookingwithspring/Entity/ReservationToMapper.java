package com.example.bookingwithspring.Entity;

import com.example.bookingwithspring.Repo.ApartmentRepo;
import lombok.Data;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;

@Service
public class ReservationToMapper {

    private ApartmentRepo apartmentRepo;

    public ReservationToMapper(ApartmentRepo apartmentRepo) {
        this.apartmentRepo = apartmentRepo;
    }

    ReservationTo map(Reservation reservation) {
        ReservationTo dto = new ReservationTo();

        dto.setId(reservation.getId());
        dto.setReservationCode(reservation.getReservationCode());
        dto.setApartment(reservation.getApartment().getApartmentName());
        dto.setCheckIn(reservation.getCheckIn());
        dto.setCheckOut(reservation.getCheckOut());
        dto.setStayDuration(reservation.getStayDuration());
        dto.setAdults(reservation.getAdults());
        dto.setChildren(reservation.getChildren());
        dto.setSmallChildren(reservation.getSmallChildren());
        dto.setGuestName(reservation.getGuestName());
        dto.setGuestCountry(reservation.getGuestCountry());
        dto.setReservationDate(reservation.getReservationDate());
        dto.setMoneyTransfer(reservation.getMoneyTransfer());

        return dto;
    }

    Reservation map(ReservationTo dto) {
        Reservation reservation = new Reservation();

        reservation.setId(dto.getId());
        reservation.setReservationCode(dto.getReservationCode());
        reservation.setApartment(apartmentRepo.findByapartmentName(dto.getApartment()));
        reservation.setCheckIn(dto.getCheckIn());
        reservation.setCheckOut(dto.getCheckOut());
        reservation.setStayDuration(dto.getStayDuration());
        reservation.setAdults(dto.getAdults());
        reservation.setChildren(dto.getChildren());
        reservation.setSmallChildren(dto.getSmallChildren());
        reservation.setGuestName(dto.getGuestName());
        reservation.setGuestCountry(dto.getGuestCountry());
        reservation.setReservationDate(dto.getReservationDate());
        reservation.setMoneyTransfer(dto.getMoneyTransfer());

        return reservation;
    }

    public Reservation setEntityFields(ReservationTo source, Reservation target) {
        if (source.getReservationCode() != null) {
            target.setReservationCode(source.getReservationCode());
        }
        if (source.getApartment() != null) {
            target.setApartment(apartmentRepo.findByapartmentName(source.getApartment()));
        }
        if (source.getCheckIn() != null){
            target.setCheckIn(source.getCheckIn());
        }
        if (source.getCheckOut() != null) {
            target.setCheckOut(source.getCheckOut());
        }

        target.setStayDuration(Period.between(target.getCheckIn(), target.getCheckOut()).getDays());

        if (source.getAdults() != null) {
            target.setAdults(source.getAdults());
        }
        if (source.getChildren() != null){
            target.setChildren(source.getChildren());
        }
        if (source.getSmallChildren() != null){
            target.setSmallChildren(source.getSmallChildren());
        }
        if (source.getGuestName() != null){
            target.setGuestName(source.getGuestName());
        }
        if (source.getGuestCountry() != null){
            target.setGuestCountry(source.getGuestCountry());
        }
        if (source.getReservationDate() != null){
            target.setReservationDate(source.getReservationDate());
        }
        if (source.getMoneyTransfer() != null){
            target.setMoneyTransfer(source.getMoneyTransfer());
        }
        return target;
    }

}
