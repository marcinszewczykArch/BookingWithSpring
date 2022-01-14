package com.example.bookingwithspring.Repo;

import com.example.bookingwithspring.Entity.TaskManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskManagerRepo extends JpaRepository<TaskManager, Long> {

    TaskManager findByTask(String task);

}
