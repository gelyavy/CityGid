package com.example.YourGid.repositories;


import com.example.YourGid.models.Place;
import org.apache.catalina.LifecycleState;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface PlaceRepository extends JpaRepository<Place, Long> {
    List<Place> findByTitle(String title);

    @Query(value = "SELECT COUNT(*) FROM places", nativeQuery = true)
    int countAll();

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM users_places WHERE place_id = :id", nativeQuery = true)
    void deletePlaceFromUsersById(@Param("id") Long id);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM places_images WHERE place_id = :id", nativeQuery = true)
    void deletePlaceFromImagesById(@Param("id") Long id);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM places WHERE id = :id", nativeQuery = true)
    void deletePlaceById(@Param("id") Long id);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM users_places WHERE place_id = :id_place AND user_id = :id_user", nativeQuery = true)
    void deletePlaceFromUserById(@Param("id_place") Long Id, @Param("id_user") Long id);
}
