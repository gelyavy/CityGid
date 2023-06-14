package com.example.YourGid.controllers;

import com.example.YourGid.models.ArticleImage;
import com.example.YourGid.models.EventImage;
import com.example.YourGid.models.PlaceImage;
import com.example.YourGid.repositories.ArticleImageRepository;
import com.example.YourGid.repositories.EventImageRepository;
import com.example.YourGid.repositories.PlaceImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final PlaceImageRepository placeImageRepository;
    private final EventImageRepository eventImageRepository;
    private final ArticleImageRepository articleImageRepository;

    @GetMapping("/placeImages/{id}")
    private ResponseEntity<?> getPlaceImageById(@PathVariable Long id){
        PlaceImage placeImage = placeImageRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", placeImage.getOriginalFileName())
                .contentType(MediaType.valueOf(placeImage.getContentType()))
                .contentLength(placeImage.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(placeImage.getBytes())));
    }

    @GetMapping("/eventImages/{id}")
    private ResponseEntity<?> getEventImageById(@PathVariable Long id){
        EventImage eventImage = eventImageRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", eventImage.getOriginalFileName())
                .contentType(MediaType.valueOf(eventImage.getContentType()))
                .contentLength(eventImage.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(eventImage.getBytes())));
    }
    @GetMapping("/articleImages/{id}")
    private ResponseEntity<?> getArticleImageById(@PathVariable Long id){
        ArticleImage articleImage = articleImageRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", articleImage.getOriginalFileName())
                .contentType(MediaType.valueOf(articleImage.getContentType()))
                .contentLength(articleImage.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(articleImage.getBytes())));
    }


}
