package com.example.YourGid.controllers;

import com.example.YourGid.repositories.FilterRepository;
import com.example.YourGid.services.FilterService;
import com.example.YourGid.services.PlaceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class FilterController {

    private final FilterService filterService;

    private final PlaceService placeService;

    @GetMapping("/Cafe")
    public String getCafes(Model model, Principal principal){
        model.addAttribute("cafes", filterService.listCafe());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Cafe";
    }
}
