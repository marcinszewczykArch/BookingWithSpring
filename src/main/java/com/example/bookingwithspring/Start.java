package com.example.bookingwithspring;

import com.example.bookingwithspring.Entity.*;
import com.example.bookingwithspring.Enum.UserRole;
import com.example.bookingwithspring.Repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Component
public class Start {

    private ReservationRepo reservationRepo;
    private ApartmentRepo apartmentRepo;
    private PeopleRepo peopleRepo;
    private OwnerRepo ownerRepo;
    private CleaningPersonRepo cleaningPersonRepo;
    private CleaningRepo cleaningRepo;
    private UserRepo userRepo;

    @Autowired
    public Start(ReservationRepo reservationRepo, ApartmentRepo apartmentRepo, PeopleRepo peopleRepo, OwnerRepo ownerRepo, CleaningPersonRepo cleaningPersonRepo, CleaningRepo cleaningRepo, UserRepo userRepo) {
        this.reservationRepo = reservationRepo;
        this.apartmentRepo = apartmentRepo;
        this.peopleRepo = peopleRepo;
        this.ownerRepo = ownerRepo;
        this.cleaningPersonRepo = cleaningPersonRepo;
        this.cleaningRepo = cleaningRepo;
        this.userRepo = userRepo;
    }



    @EventListener(ApplicationReadyEvent.class)
    public void runExample() throws IOException {
        CsvImport csvImport = new CsvImport(apartmentRepo);

        Apartment komunyZLustrem = new Apartment(
                "Słoneczna kamienica - apartament z lustrem",
                "https://airbnb.com/h/slonecznakamienica",
                3,
                "Komuny Paryskiej 94/3",
                29,
                "https://a0.muscache.com/im/pictures/miso/Hosting-45055284/original/9e2b6df6-6b5f-48eb-80e1-d37cc68220a4.jpeg?im_w=1200");
        apartmentRepo.save(komunyZLustrem);

        Apartment komunyZBalkonem = new Apartment(
                "Słoneczna kamienica - apartament z balkonem",
                "https://airbnb.com/h/slonecznakamienica",
                3,
                "Komuny Paryskiej 94/3",
                29,
                "https://a0.muscache.com/im/pictures/miso/Hosting-44638934/original/ecc5b0d1-f95d-460a-a177-3001143f4bdc.jpeg?im_w=1200");
        apartmentRepo.save(komunyZBalkonem);

        Apartment komunyCale= new Apartment(
                "Słoneczna kamienica - CAŁE",
                "https://airbnb.com/h/slonecznakamienica",
                3,
                "Komuny Paryskiej 94/3",
                65,
                "https://a0.muscache.com/im/pictures/miso/Hosting-45237021/original/6fc5378c-c2e2-4a5e-b448-9a421b6243fa.jpeg?im_w=1200");
        apartmentRepo.save(komunyCale);

        Apartment HercenaKolokow= new Apartment(
                "Hercena Kołokoł - design apartment",
                "https://www.airbnb.pl/rooms/45117982",
                2,
                "Aleksandra Hercena 34",
                34,
                "https://a0.muscache.com/im/pictures/miso/Hosting-45117982/original/1447b673-0d04-4c22-8ff1-0e71e9a2a9d6.jpeg?im_w=1200");
        apartmentRepo.save(HercenaKolokow);

        Apartment HercenaPolarnaja= new Apartment(
                "Hercena Polarnaja Zwiezda - design apartment",
                "https://www.airbnb.pl/rooms/45255708",
                2,
                "Aleksandra Hercena 34",
                31,
                "https://a0.muscache.com/im/pictures/miso/Hosting-45255708/original/bf8fa553-281b-4751-a6f8-17ee1faf2bfa.jpeg?im_w=1200");
        apartmentRepo.save(HercenaPolarnaja);

        Apartment KniaziewiczaSommeil= new Apartment(
                "Kniaziewicza Sommeil - design apartment",
                "https://www.airbnb.pl/rooms/50165522",
                2,
                "Kniaziewicza 12",
                31,
                "https://a0.muscache.com/im/pictures/miso/Hosting-50165522/original/52d48a49-a2c6-48c8-93d4-a32aed0bd619.jpeg?im_w=1200");
        apartmentRepo.save(KniaziewiczaSommeil);

        Apartment PomorskaBohoWithBalcony= new Apartment(
                "Pomorska Boho - apartment with balcony",
                "https://www.airbnb.pl/rooms/50165522",
                4,
                "Pomorska 64",
                62,
                "https://a0.muscache.com/im/pictures/91960bc6-a769-44ce-ac8d-d219a66d0bd0.jpg?im_w=1440");
        apartmentRepo.save(PomorskaBohoWithBalcony);

        Apartment PomorskaModernWithMirrors= new Apartment(
                "Pomorska Modern - apartment with mirrors",
                "https://www.airbnb.pl/rooms/38545880",
                2,
                "Pomorska 64",
                41,
                "https://a0.muscache.com/im/pictures/dc9f876f-40c9-41b0-bb0d-f12a53296c86.jpg?im_w=1440");
        apartmentRepo.save(PomorskaModernWithMirrors);




        People people1 = new People("Marcin", "Szewczyk", "602317995", "kp94m3@gmail.com");
        peopleRepo.save(people1);
        People people2 = new People("Konrad", "Onderko", "666555444", "ko@gmail.com");
        peopleRepo.save(people2);
        People people3 = new People("Beata", "Onderko", "666555444", "ko@gmail.com");
        peopleRepo.save(people3);


        User admin = new User("admin", "admin", UserRole.ADMIN);
        userRepo.save(admin);
        User user1 = new User(people1, "marcin", "marcinPass", UserRole.OWNER);
        userRepo.save(user1);


        List<Apartment> apartments = new ArrayList<>();
        apartments.add(komunyZLustrem);
        apartments.add(komunyZBalkonem);
        apartments.add(komunyCale);

        Owner owner1 = new Owner(people1, apartments);
        ownerRepo.save(owner1);

        CleaningPerson cleaner1 = new CleaningPerson(people1);
        CleaningPerson cleaner2 = new CleaningPerson(people2);
        CleaningPerson cleaner3 = new CleaningPerson(people3);
        cleaningPersonRepo.save(cleaner1);
        cleaningPersonRepo.save(cleaner2);
        cleaningPersonRepo.save(cleaner3);


        List<Reservation> reservations = csvImport.importReservations();
        for (Reservation reservation : reservations) {
            Cleaning cleaning = new Cleaning(reservation, reservation.getCheckOut());

            if (reservation.getStayDuration()<3) {
                cleaning.setCleaningPerson(cleaner1);
            }
            if (reservation.getStayDuration()>=3 && reservation.getStayDuration()<5) {
                cleaning.setCleaningPerson(cleaner2);
            }
            if  (reservation.getStayDuration()>=5) {
                cleaning.setCleaningPerson(cleaner3);
            }

            reservationRepo.save(reservation);
            cleaningRepo.save(cleaning);
        }

        Reservation reservation1 = new Reservation(apartmentRepo.getById(1L), LocalDate.now(), LocalDate.now().plusDays(1));
        Reservation reservation2 = new Reservation(apartmentRepo.getById(2L), LocalDate.now(), LocalDate.now().plusDays(2));
        Reservation reservation3 = new Reservation(apartmentRepo.getById(3L), LocalDate.now(), LocalDate.now().plusDays(3));
        Reservation reservation4 = new Reservation(apartmentRepo.getById(1L), LocalDate.now(), LocalDate.now().plusDays(4));
        reservation1.setReservationDate(LocalDate.parse("2022-12-22"));
        reservation2.setReservationDate(LocalDate.parse("2022-12-22"));
        reservation3.setReservationDate(LocalDate.parse("2022-12-22"));
        reservation4.setReservationDate(LocalDate.parse("2022-12-22"));
        Cleaning cleaning1 = new Cleaning(reservation1, cleaner3, reservation1.getCheckOut());
        Cleaning cleaning2 = new Cleaning(reservation2, cleaner3, reservation2.getCheckOut());
        Cleaning cleaning3 = new Cleaning(reservation3, cleaner3, reservation3.getCheckOut());
        Cleaning cleaning4 = new Cleaning(reservation4, cleaner3, reservation4.getCheckOut());
        reservationRepo.save(reservation1);
        reservationRepo.save(reservation2);
        reservationRepo.save(reservation3);
        reservationRepo.save(reservation4);
        cleaningRepo.save(cleaning1);
        cleaningRepo.save(cleaning2);
        cleaningRepo.save(cleaning3);
        cleaningRepo.save(cleaning4);

    }
}
