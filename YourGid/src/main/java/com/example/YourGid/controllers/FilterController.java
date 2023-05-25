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

    @GetMapping("/Bar")
    public String getBars(Model model, Principal principal){
        model.addAttribute("bars", filterService.listBar());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Bar";
    }

    @GetMapping("/Coffee")
    public String getCoffees(Model model, Principal principal){
        model.addAttribute("coffees", filterService.listCoffee());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Coffee";
    }

    @GetMapping("/Hotel")
    public String getHotels(Model model, Principal principal){
        model.addAttribute("hotels", filterService.listHotel());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Hotel";
    }

    @GetMapping("/Museum")
    public String getMuseums(Model model, Principal principal){
        model.addAttribute("museums", filterService.listMuseum());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Museum";
    }

    @GetMapping("/Other")
    public String getOthers(Model model, Principal principal){
        model.addAttribute("others", filterService.listOther());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Other";
    }

    @GetMapping("/Park")
    public String getParks(Model model, Principal principal){
        model.addAttribute("parks", filterService.listPark());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Park";
    }

    @GetMapping("/Shop")
    public String getShops(Model model, Principal principal){
        model.addAttribute("shops", filterService.listShop());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Shop";
    }

    @GetMapping("/Sport")
    public String getSports(Model model, Principal principal){
        model.addAttribute("sports", filterService.listSport());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Sport";
    }

    @GetMapping("/Theatre")
    public String getTheatres(Model model, Principal principal){
        model.addAttribute("theatres", filterService.listTheatre());
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        return "filters/Theatre";
    }

}
