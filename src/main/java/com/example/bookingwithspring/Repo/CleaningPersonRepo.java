package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.CleaningPerson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CleaningPersonRepo extends JpaRepository<CleaningPerson, Long> {
}
