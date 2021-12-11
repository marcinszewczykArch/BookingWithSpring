package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.Apartment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApartmentRepo extends JpaRepository<Apartment, Long> {

    Apartment findByapartmentName(String apartmentName);
}
