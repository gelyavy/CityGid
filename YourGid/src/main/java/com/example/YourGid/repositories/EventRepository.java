package com.example.YourGid.repositories;

import com.example.YourGid.models.Event;
import com.example.YourGid.models.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByTitle(String title);

    @Query(value = "SELECT * FROM events ORDER BY ID DESC LIMIT 5", nativeQuery = true)
    List<Event> findLast5Events();

}
