package com.example.bookingwithspring.ControllerWeb;

import com.example.bookingwithspring.Entity.Apartment;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/apartments")
public class ApartmentControllerMvc {
    private ApartmentRepo apartmentRepo;

    @Autowired
    public ApartmentControllerMvc(ApartmentRepo apartmentRepo) {
        this.apartmentRepo = apartmentRepo;
    }

    @GetMapping
    public String listApartments(Model model) {
        List<Apartment> apartments = apartmentRepo.findAll();
        apartments.sort(Comparator.comparing(Apartment::getId));
        model.addAttribute("apartmentsList", apartments);
        return "ApartmentsList";
    }

}
