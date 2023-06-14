package com.example.YourGid.controllers;

import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.repositories.EventRepository;
import com.example.YourGid.services.ArticleService;
import com.example.YourGid.services.PlaceService;
import com.example.YourGid.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class PlaceController {
    private final PlaceService placeService;
    private final UserService userService;
    private final EventRepository eventRepository;
    private final ArticleService articleService;


    @GetMapping("/")
    public String places(Model model, Principal principal){
        model.addAttribute("places", placeService.ListPlaces());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        model.addAttribute("events", eventRepository.findLast5Events());
        model.addAttribute("articles", articleService.findAll());
        return "places";
    }

    @GetMapping("/allPlaces")
    public String allPlaces(@RequestParam(name = "title", required = false) String title, Model model, Principal principal){
        model.addAttribute("places", placeService.listPlaces(title));
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "allPlaces";
    }

    @GetMapping("/place/{id}")
    public String placeInfo(@PathVariable Long id, Model model, Principal principal){
        Place place = placeService.getPlaceById(id);
        User user = placeService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("place", place);
        model.addAttribute("images", place.getPlaceImages());
        model.addAttribute("flag", user.getPlaces().contains(placeService.getPlaceById(id)));
        return "place-info";
    }


    @PostMapping("/place/{id}")
    public String addPlaceById(@PathVariable Long id, Principal principal) {
        User user = placeService.getUserByPrincipal(principal);
        userService.addPlace(user, id);
        return "redirect:/place/{id}";
    }

    @PostMapping("/place/delete/{id}")
    public String deletePlaceById(@PathVariable Long id, Principal principal){
        User user = placeService.getUserByPrincipal(principal);
        userService.deletePlaceFromUser(id, user.getId());
        return "redirect:/place/{id}";
    }

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/place/create")
    public String createPlace(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                              @RequestParam("file3") MultipartFile file3, Place place) throws IOException {
        placeService.savePlace(place, file1, file2, file3);
        return "redirect:/admin";
    }




}
