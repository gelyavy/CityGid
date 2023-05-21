package com.example.YourGid.controllers;

import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.repositories.PlaceRepository;
import com.example.YourGid.repositories.UserRepository;
import com.example.YourGid.services.PlaceService;
import com.example.YourGid.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final PlaceRepository placeRepository;
    private final PlaceService placeService;
    private final UserRepository userRepository;

    //Регистрация
    @GetMapping("/registration")
    public String registration(Model model, Principal principal){
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "registration";
    }

    @GetMapping("/login")
    public String login(Model model, Principal principal){
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "login";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model, Principal principal){
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        if (userService.createUser(user) == false){
            model.addAttribute("errorMessage", "Пользователь с email: "+ user.getEmail() + "уже существует");
            return "registration";
        }
        return "redirect:/";
    }

    //Переход на профиль человека
    @GetMapping("/profile/{id}")
    public String profile(@PathVariable("id") Long id, Model model, Principal principal){
        User user = userService.getUserById(id);
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        model.addAttribute("profile", user);
        return "profile";
    }

    //Список посещённых мест пользователя
    @GetMapping("/profile/{id}/places")
    public String getUserPlaces(@PathVariable("id") Long id, Model model){
        User user = userService.getUserById(id);
        model.addAttribute("user",user);
        return "UserPlaces";
    }

    @GetMapping("/profile/{id}/events")
    public String getUserEvents(@PathVariable("id") Long id, Model model){
        User user = userService.getUserById(id);
        model.addAttribute("user",user);
        return "UserEvents";
    }

    //Рандомные места
    @GetMapping("/profile/random")
    public String getUserRandomPlace(Model model, Principal principal){
        model.addAttribute("place", placeService.getRandomPlacesId());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "UserRandom";
    }

}
