package com.example.YourGid.repositories;


import com.example.YourGid.models.Place;
import org.apache.catalina.LifecycleState;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {
    List<Place> findByTitle(String title);
}
