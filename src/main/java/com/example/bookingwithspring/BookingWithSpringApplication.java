package com.example.bookingwithspring;

import com.example.bookingwithspring.Configuration.AppConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SpringBootApplication
public class BookingWithSpringApplication {

    public static void main(String[] args) {
        SpringApplication.run(BookingWithSpringApplication.class, args);
    }

}
