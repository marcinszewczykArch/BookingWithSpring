package com.example.bookingwithspring.ControllerRest;

import com.example.bookingwithspring.Entity.Apartment;
import com.example.bookingwithspring.Entity.User;
import com.example.bookingwithspring.Repo.ApartmentRepo;
import com.example.bookingwithspring.Repo.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/api/users")
public class UserControllerRest {

    private UserRepo userRepo;

    @Autowired
    public UserControllerRest(UserRepo userRepo) {
        this.userRepo = userRepo;
    }


    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<User> getAllUsers() {
        List<User> users = userRepo.findAll();
        return users;
    }

}
