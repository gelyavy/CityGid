package com.example.YourGid.services;

import com.example.YourGid.models.Event;
import com.example.YourGid.models.EventImage;
import com.example.YourGid.models.EventImage;
import com.example.YourGid.models.Place;
import com.example.YourGid.repositories.EventRepository;
import com.example.YourGid.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class EventService {

    private final EventRepository eventRepository;
    private final UserRepository userRepository;

    public List<Event> listEvents (String title){
        if(title!=null) return eventRepository.findByTitle(title);

        return eventRepository.findAll();
    }

    public List<Event> ListEvents() {
        return eventRepository.findAll();
    }

    public void saveEvent(Event event, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        EventImage image1;
        EventImage image2;
        EventImage image3;
        if (file1.getSize()!=0){
            image1 = toImageEntity(file1); //Преобразование из файла в модель фотографии
            image1.setPreviewImage(true);
            event.addImageToEvent(image1);
        }
        if (file2.getSize()!=0){
            image2 = toImageEntity(file2); //Преобразование из файла в модель фотографии
            event.addImageToEvent(image2);
        }
        if (file3.getSize()!=0){
            image3 = toImageEntity(file3); //Преобразование из файла в модель фотографии
            event.addImageToEvent(image3);
        }
        log.info("Saving new Event. Title: {}", event.getTitle());
        Event eventFromDb = eventRepository.save(event);
        eventFromDb.setPreviewImageId(eventFromDb.getEventsImages().get(0).getId());
        eventRepository.save(event);
    }

    private EventImage toImageEntity(MultipartFile file) throws IOException {
        EventImage eventImage = new EventImage();
        eventImage.setName(file.getName());
        eventImage.setOriginalFileName(file.getOriginalFilename());
        eventImage.setContentType(file.getContentType());
        eventImage.setSize(file.getSize());
        eventImage.setBytes(file.getBytes());
        return eventImage;
    }

    public void deleteEvent(Long id){
        eventRepository.deleteById(id);
    }

    public Event getEventById(Long id){
        return eventRepository.findById(id).orElse(null);
    }
}
