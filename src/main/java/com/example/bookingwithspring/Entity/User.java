package com.example.bookingwithspring.Entity;

import com.example.bookingwithspring.Enum.UserRole;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToOne
    People people;
    private String login;
    private String password;
    private UserRole userRole;

    public User(People people, String login, String password, UserRole userRole) {
        this.people = people;
        this.login = login;
        this.password = password;
        this.userRole = userRole;
    }

    public User(String login, String password, UserRole userRole) {
        this.login = login;
        this.password = password;
        this.userRole = userRole;
    }

    public User() {
    }

}
