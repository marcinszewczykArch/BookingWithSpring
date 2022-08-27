package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.User;
import com.example.bookingwithspring.Entity.UserActivity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserActivityRepo extends JpaRepository <UserActivity, Long> {
}
