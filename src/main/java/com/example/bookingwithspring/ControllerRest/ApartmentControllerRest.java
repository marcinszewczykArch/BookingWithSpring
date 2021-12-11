package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.Apartment;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/apartments")
public class ApartmentControllerRest {

    private ApartmentRepo apartmentRepo;

    @Autowired
    public ApartmentControllerRest(ApartmentRepo apartmentRepo) {
        this.apartmentRepo = apartmentRepo;
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Apartment> getAllApartments() {
        List<Apartment> apartments = apartmentRepo.findAll();
        return apartments;
    }

}
