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

}