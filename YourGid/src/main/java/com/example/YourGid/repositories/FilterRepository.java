package com.example.YourGid.repositories;

import com.example.YourGid.models.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FilterRepository extends JpaRepository<Place, Long> {

    @Query(value = "SELECT * FROM places WHERE type='Кафе'", nativeQuery = true)
    List<Place> findCafe();

    @Query(value = "SELECT * FROM places WHERE type='Бар'", nativeQuery = true)
    List<Place> findBar();

    @Query(value = "SELECT * FROM places WHERE type='Кофейня'", nativeQuery = true)
    List<Place> findCoffee();

    @Query(value = "SELECT * FROM places WHERE type='Отель'", nativeQuery = true)
    List<Place> findHotel();

    @Query(value = "SELECT * FROM places WHERE type='Музей'", nativeQuery = true)
    List<Place> findMuseum();

    @Query(value = "SELECT * FROM places WHERE type='Другое'", nativeQuery = true)
    List<Place> findOther();

    @Query(value = "SELECT * FROM places WHERE type='Парк'", nativeQuery = true)
    List<Place> findPark();

    @Query(value = "SELECT * FROM places WHERE type='Магазин'", nativeQuery = true)
    List<Place> findShop();

    @Query(value = "SELECT * FROM places WHERE type='Спорт'", nativeQuery = true)
    List<Place> findSport();

    @Query(value = "SELECT * FROM places WHERE type='Театр'", nativeQuery = true)
    List<Place> findTheatre();
}
