package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.Owner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OwnerRepo  extends JpaRepository<Owner, Long> {


}
