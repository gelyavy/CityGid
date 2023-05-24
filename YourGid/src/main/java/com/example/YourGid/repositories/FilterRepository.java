package com.example.YourGid.repositories;

import com.example.YourGid.models.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FilterRepository extends JpaRepository<Place, Long> {

    @Query(value = "SELECT * FROM places WHERE type='Кофейня'", nativeQuery = true)
    List<Place> findCafe();
}
