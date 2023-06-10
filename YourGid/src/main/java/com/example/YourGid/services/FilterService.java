package com.example.YourGid.services;

import com.example.YourGid.models.Place;
import com.example.YourGid.repositories.FilterRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FilterService {

    private final FilterRepository filterRepository;

    public List<Place> listCafe(){
        return filterRepository.findCafe();
    }
    public List<Place> listTour(){
        return filterRepository.findTours();
    }

    public List<Place> listBar(){
        return filterRepository.findBar();
    }

    public List<Place> listCoffee(){
        return filterRepository.findCoffee();
    }

    public List<Place> listHotel(){
        return filterRepository.findHotel();
    }

    public List<Place> listMuseum(){
        return filterRepository.findMuseum();
    }

    public List<Place> listOther(){
        return filterRepository.findOther();
    }

    public List<Place> listPark(){
        return filterRepository.findPark();
    }

    public List<Place> listShop(){
        return filterRepository.findShop();
    }

    public List<Place> listSport(){
        return filterRepository.findSport();
    }

    public List<Place> listTheatre(){
        return filterRepository.findTheatre();
    }


}