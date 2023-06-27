package com.example.YourGid.services;

import com.example.YourGid.models.Event;
import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.models.enums.Role;
import com.example.YourGid.repositories.EventRepository;
import com.example.YourGid.repositories.PlaceRepository;
import com.example.YourGid.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final PlaceRepository placeRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final EventRepository eventRepository;
    private final PlaceService placeService;

    public boolean createUser(User user){
        String login = user.getLogin();
        if(userRepository.findByLogin(login)!=null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        user.setPercents(0);
        log.info("Saving new User with login: {}", login);
        userRepository.save(user);
        return true;
    }

    public void addPlace(User user, Long id){
        String login = user.getLogin();
        Place place = placeRepository.getById(id);
        user.getPlaces().add(place);
        user.setPlacesAmount(user.getPlacesAmount()+1);
        user.setPercents((int)(user.getPlacesAmount()/placeService.countAllPlaces()*100));
        log.info("Saving new Place by user with login: {}", login);
        userRepository.save(user);
    }

    public void addEvent(User user, Long id){
        String login = user.getLogin();
        Event event = eventRepository.getById(id);
        user.getEvents().add(event);
        log.info("Saving new event by: {}", login);
        userRepository.save(user);
    }

    public void deletePlaceFromUser(Long Id, Long id){
        placeRepository.deletePlaceFromUserById(Id, id);
        User user = userRepository.getById(id);
        Place place = placeRepository.getById(Id);
        user.getPlaces().remove(place);
        user.setPlacesAmount(user.getPlacesAmount()-1);
        user.setPercents((int)(user.getPlacesAmount()/placeService.countAllPlaces()*100));
        userRepository.save(user);
    }

    public void deleteEventFromUser(Long Id, Long id){
        eventRepository.deleteEventFromUserById(Id, id);
        User user = userRepository.getById(id);
        Event event = eventRepository.getById(Id);
        user.getEvents().remove(event);
        userRepository.save(user);
    }


    public List<User> list(){
        return userRepository.findAll();
    }

    public void deleteUser(Long id){
        userRepository.deleteById(id);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user!=null){
            if (user.isActive()){
                user.setActive(false);
                log.info("Ban user with id = {}; login = {}", user.getId(), user.getLogin());
            } else{
                user.setActive(true);
                log.info("Unban user with id = {}; login = {}", user.getId(), user.getLogin());
            }

        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()){
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
