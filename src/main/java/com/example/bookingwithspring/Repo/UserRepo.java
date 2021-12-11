package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.Cleaning;
import com.example.bookingwithspring.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
}
