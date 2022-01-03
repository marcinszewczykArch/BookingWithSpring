package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.Apartment;
import com.example.bookingwithspring.Entity.Cleaning;
import com.example.bookingwithspring.Entity.ReservationTo;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import com.example.bookingwithspring.Repo.CleaningRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/cleaning")
public class CleaningControllerRest {

    private CleaningRepo cleaningRepo;

    @Autowired
    public CleaningControllerRest(CleaningRepo cleaningRepo) {
        this.cleaningRepo = cleaningRepo;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Cleaning> getAllCleanings() {
        return cleaningRepo.findAll()
                .stream()
                .sorted(
                    (c1, c2) -> c1.getCleaningDate().compareTo(c2.getCleaningDate()))
                .toList();
    }

}
