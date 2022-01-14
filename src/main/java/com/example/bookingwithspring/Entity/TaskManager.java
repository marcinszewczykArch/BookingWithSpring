package com.example.bookingwithspring.Entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
public class TaskManager {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String task;
    private int frequencyMinutes;
    private LocalDateTime lastExecution;
    private LocalDateTime nextExecution;
    private Long durationMilisec;

    public TaskManager() {
    }
}

