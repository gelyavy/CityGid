package com.example.YourGid.controllers;

import com.example.YourGid.models.Event;
import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.repositories.EventRepository;
import com.example.YourGid.repositories.UserRepository;
import com.example.YourGid.services.EventService;
import com.example.YourGid.services.PlaceService;
import com.example.YourGid.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class EventController {
    private final EventService eventService;
    private final EventRepository eventRepository;
    private final UserService userService;
    private final UserRepository userRepository;
    private final PlaceService placeService;

    @GetMapping("/allEvents")
    public String allEvents(@RequestParam(name = "title", required = false) String title, Model model, Principal principal){
        model.addAttribute("events", eventService.listEvents(title));
        model.addAttribute("user", placeService.getPlaceByPrincipal(principal));
        return "allEvents";
    }

    @GetMapping("/event/{id}")
    public String eventInfo(@PathVariable Long id, Model model, Principal principal){
        Event event = eventService.getEventById(id);
        User user = placeService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("event", event);
        model.addAttribute("images", event.getEventImages());
        model.addAttribute("flag", user.getEvents().contains(eventService.getEventById(id)));
        return "event-info";
    }

    @PostMapping("/event/{id}")
    public String addEventById(@PathVariable Long id, Principal principal) {
        User user = placeService.getUserByPrincipal(principal);
        userService.addEvent(user, id);
        return "redirect:/event/{id}";
    }

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/event/create")
    public String createEvent(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                              @RequestParam("file3") MultipartFile file3, Event event) throws IOException {
        eventService.saveEvent(event, file1, file2, file3);
        return "redirect:/admin";
    }
}
