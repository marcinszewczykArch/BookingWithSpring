package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.People;
import com.example.bookingwithspring.Entity.Reservation;
import com.example.bookingwithspring.Entity.ReservationTo;
import com.example.bookingwithspring.Entity.User;
import com.example.bookingwithspring.Repo.PeopleRepo;
import com.example.bookingwithspring.Repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/people")
public class PeopleControllerRest {

    private PeopleRepo peopleRepo;

    @Autowired
    public PeopleControllerRest(PeopleRepo peopleRepo) {
        this.peopleRepo = peopleRepo;
    }


    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<People> getAllPeople() {
        List<People> people = peopleRepo.findAll();
        return people;
    }

}
