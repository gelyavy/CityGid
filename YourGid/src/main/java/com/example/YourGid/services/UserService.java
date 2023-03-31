package com.example.YourGid.services;

import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.models.enums.Role;
import com.example.YourGid.repositories.PlaceRepository;
import com.example.YourGid.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Query;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.security.Principal;
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

    //Создание нового пользователя
    public boolean createUser(User user){
        String email = user.getEmail();
        if(userRepository.findByEmail(email)!=null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        user.setPercents(0);
        log.info("Saving new User with email: {}", email);
        userRepository.save(user);
        return true;
    }

    //Добавление посещённого места в личный кабинет
    public void addPlace(User user, Long id){
        String email = user.getEmail();
        Place place = placeRepository.getById(id);
        user.getPlaces().add(place);
        user.setPlacesAmount(user.getPlacesAmount()+1);
        user.setPercents((int)(user.getPlacesAmount()/110*100));
        log.info("Saving new Place by user with email: {}", email);
        userRepository.save(user);
    }

    //public int countPlaces(User user){
        //return user.getPlaces().;
    //}


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
                log.info("Ban user with id = {}; email = {}", user.getId(), user.getEmail());
            } else{
                user.setActive(true);
                log.info("Unban user with id = {}; email = {}", user.getId(), user.getEmail());
            }

        }
        userRepository.save(user);
    }

    //Изменение роли пользователю
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
