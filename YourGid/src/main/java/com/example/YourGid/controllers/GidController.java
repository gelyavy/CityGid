package com.example.YourGid.controllers;

import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.repositories.PlaceRepository;
import com.example.YourGid.repositories.UserRepository;
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
public class GidController {
    //создаём объект сервиса, т.к. все действия прописаны в нём.
    private final PlaceService placeService;
    private final UserRepository userRepository;
    private final PlaceRepository placeRepository;
    private final UserService userService;

    //ГЕТ-запрос по поиску места по названию. Логика прописана в сервисе.
    @GetMapping("/")
    public String places(Model model, Principal principal){
        model.addAttribute("places", placeService.ListPlaces());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "places";
    }

    @GetMapping("/allPlaces")
    public String allPlaces(@RequestParam(name = "title", required = false) String title, Model model, Principal principal){
        model.addAttribute("places", placeService.listPlaces(title));
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "allPlaces";
    }


    //ГЕТ-запрос об информации о КОНКРЕТНОМ месте (по его id).Логика прописана в сервисе и связана с репозиторием.
    @GetMapping("/place/{id}")
    public String placeInfo(@PathVariable Long id, Model model, Principal principal){
        Place place = placeService.getPlaceById(id);
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        model.addAttribute("place", place);
        model.addAttribute("images", place.getImages());
        return "place-info";
    }


    //Добавление посещённого места в личный кабинет
    @PostMapping("/place/{id}")
    public String addPlaceById(@PathVariable Long id, Model model, Principal principal){
        //model.addAttribute("user", placeService.getUserByPrincipal(principal));
        //model.addAttribute("place", placeService.getPlaceByPrincipal(principal));
        User user = userRepository.findByEmail(principal.getName());
        userService.addPlace(user, id);
        return "redirect:/";
    }

    //ПОСТ-запрос о создании нового места. Логика прописана в сервисе.
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/place/create")
    public String createPlace(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                              @RequestParam("file3") MultipartFile file3, Place place) throws IOException {
        placeService.savePlace(place, file1, file2, file3);
        return "redirect:/";
    }

    //ПОСТ-запрос об удалении места. Логика прописана в сервисе.
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/place/delete/{id}")
    public String deletePlace(@PathVariable Long id){
        placeService.deletePlace(id);
        return "redirect:/";
    }
}
