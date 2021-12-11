package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.Cleaning;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CleaningRepo extends JpaRepository<Cleaning, Long> {
}
