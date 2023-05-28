package com.example.YourGid.repositories;

import com.example.YourGid.models.Event;
import com.example.YourGid.models.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByTitle(String title);

    @Query(value = "SELECT * FROM events ORDER BY ID DESC LIMIT 5", nativeQuery = true)
    List<Event> findLast5Events();

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM users_events WHERE event_id = :id", nativeQuery = true)
    void deleteEventFromUsersById(@Param("id") Long id);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM events_images WHERE event_id = :id", nativeQuery = true)
    void deleteEventFromImagesById(@Param("id") Long id);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM events WHERE id = :id", nativeQuery = true)
    void deleteEventById(@Param("id") Long id);

}
