package com.example.YourGid.services;

import com.example.YourGid.models.PlaceImage;
import com.example.YourGid.models.Place;
import com.example.YourGid.models.PlaceImage;
import com.example.YourGid.models.User;
import com.example.YourGid.repositories.PlaceRepository;
import com.example.YourGid.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class PlaceService {

    //Создаём объект репозитория, т.к. все методы берём оттуда.
    private final PlaceRepository placeRepository;
    private final UserRepository userRepository;



    //Метод, возвращающий список мест в поиске по его названию.
    public List<Place> listPlaces(String title) {
        if(title!=null) return placeRepository.findByTitle(title);

        return placeRepository.findAll();
    }

    public List<Place> ListPlaces(){ return placeRepository.findAll(); }

    //Метод, сохраняющий новое место.
    public void savePlace(Place place, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        PlaceImage image1;
        PlaceImage image2;
        PlaceImage image3;
        if (file1.getSize()!=0){
            image1 = toImageEntity(file1); //Преобразование из файла в модель фотографии
            image1.setPreviewImage(true);
            place.addImageToPlace(image1);
        }
        if (file2.getSize()!=0){
            image2 = toImageEntity(file2); //Преобразование из файла в модель фотографии
            place.addImageToPlace(image2);
        }
        if (file3.getSize()!=0){
            image3 = toImageEntity(file3); //Преобразование из файла в модель фотографии
            place.addImageToPlace(image3);
        }
        log.info("Saving new Place. Title: {}", place.getTitle());
        Place placeFromDb = placeRepository.save(place);
        placeFromDb.setPreviewImageId(placeFromDb.getPlaceImages().get(0).getId());
        placeRepository.save(place);
    }

    //Получение рандомного айди места из БД
    public Place getRandomPlacesId(){
        int i = (int) (Math.random()*(ListPlaces().size()));
        log.info("весь список: {} {}", ListPlaces().size(), i);
        return ListPlaces().get(i);
    }

    //Преобразование из файла в модель фотографии
    private PlaceImage toImageEntity(MultipartFile file) throws IOException {
        PlaceImage image = new PlaceImage();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    //Метод, удаляющий конкретное место (по id).
    public void deletePlace(Long id){

        placeRepository.deletePlaceFromUsersById(id);
        placeRepository.deletePlaceFromImagesById(id);
        placeRepository.deletePlaceById(id);

    }


    //Метод, возвращающий конкретное место по его id.
    public Place getPlaceById(Long id) {
        return placeRepository.findById(id).orElse(null);
    }

    public User getUserByPrincipal(Principal principal){
        if (principal==null) return new User();
        return userRepository.findByEmail(principal.getName());
    }
}

