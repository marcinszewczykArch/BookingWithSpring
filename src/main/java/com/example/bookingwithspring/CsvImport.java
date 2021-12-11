package com.example.bookingwithspring;

import com.example.bookingwithspring.Entity.Apartment;
import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import com.example.bookingwithspring.Repo.ReservationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

@Component
public class CsvImport {
    private static final String CSV_AIRBNB_RESERVATIONS_URL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vSTOCRewRy7iKDAQJPk8g6zm5_X0jwBgXuMw_xVvc69TjUQR0lMeBx988f70Ccb3JTo4SIkcsMT54Mh/pub?gid=1586827895&single=true&output=csv";

    private ApartmentRepo apartmentRepo;

    @Autowired
    public CsvImport(ApartmentRepo apartmentRepo) {
        this.apartmentRepo = apartmentRepo;
    }

    public List<Reservation> importReservations() throws IOException {
        List<Reservation> reservations = new ArrayList<>();
        URL rowdata = new URL(CSV_AIRBNB_RESERVATIONS_URL);
        URLConnection data = rowdata.openConnection();
        Scanner input = new Scanner(data.getInputStream());
        input.nextLine();

        while (input.hasNextLine()) {
            String line = input.nextLine();
            if(line.contains("#")){
                break;
            } else {
                Reservation r = createReservationObjectFromString(line);
                reservations.add(r);
            }
        }
        return reservations;
    };

    private Reservation createReservationObjectFromString(String line) {
        List<String> reservation = Arrays.asList(line.split(","));
        String reservationCode = reservation.get(0);
        String apartment = reservation.get(1);
        Apartment a = apartmentRepo.findByapartmentName(apartment);
        String checkIn = reservation.get(2);
        String checkOut = reservation.get(3);
        String stayDuration = reservation.get(4);
        String adults = reservation.get(5);
        String children = reservation.get(6);
        String smallChildren = reservation.get(7);
        String guestName = reservation.get(8);
        String guestCountry = reservation.get(9);
        String reservationDate = reservation.get(10);
        String moneyTransfer = reservation.get(11).replaceAll("\"", "");


        return new Reservation(
                reservationCode,
                a,
                LocalDate.parse(checkIn),
                LocalDate.parse(checkOut),
                Integer.valueOf(stayDuration),
                (adults.equals("-")) ? 0 : Integer.valueOf(adults),
                (children.equals("-")) ? 0 : Integer.valueOf(children),
                (smallChildren.equals("-")) ? 0 : Integer.valueOf(smallChildren),
                guestName,
                guestCountry,
                LocalDate.parse(reservationDate),
                Double.valueOf(moneyTransfer)
        );
    }

    public void printAllReservations(List<Reservation> reservations) {
        reservations.stream().forEach(System.out::println);
    }

}
