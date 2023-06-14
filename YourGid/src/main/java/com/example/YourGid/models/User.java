package com.example.YourGid.models;


import com.example.YourGid.models.enums.Role;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.*;

@Entity
@Table(name="users")
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "email", unique = true)
    private String email;
    @Column(name = "phoneNumber")
    private String phoneNumber;
    @Column(name = "name")
    private String name;
    @Column(name = "PlacesAmount")
    private Double placesAmount = 0.0;
    @Column(name = "percents")
    private Integer percents;
    @Column(name = "active")
    private boolean active;
    @Column(name = "password", length = 1000)
    private String password;

    @Override
    public boolean equals(Object ob){
        if (ob == this) {return true;}
        if (ob == null || ob.getClass() != getClass()) {return false;}
        User user = (User) ob;
        return user.id.equals(id) &&
                user.email.equals(email) &&
                user.phoneNumber.equals(phoneNumber) &&
                user.name.equals(name) &&
                user.placesAmount == placesAmount &&
                user.percents == percents &&
                user.active == active &&
                user.password.equals(password);
    }

    @Override
    public int hashCode(){
        int result = 17;
        result = 31 * result + (id == null ? 0 : id.hashCode());
        result = 31 * result + (email == null ? 0 : email.hashCode());
        result = 31 * result + (phoneNumber == null ? 0 : phoneNumber.hashCode());
        result = 31 * result + (name == null ? 0 : name.hashCode());
        long lplacesAmount = Double.doubleToLongBits(placesAmount);
        result = result * 31 + (int)(lplacesAmount ^ (lplacesAmount >>> 32));
        result = 31 * result + percents;
        result = 31 * result + (active ? 1 : 0);
        result = 31 * result + (password == null ? 0 : password.hashCode());
        return result;
    }

    private LocalDateTime dateOfCreated;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="users_events", joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "event_id", referencedColumnName = "id"))
    private Set<Event> events = new HashSet<Event>();

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="users_places", joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
                inverseJoinColumns = @JoinColumn(name = "place_id", referencedColumnName = "id"))
    private Set<Place> places = new HashSet<Place>();

    @PrePersist
    private void init(){
        dateOfCreated = LocalDateTime.now();
    }

    // security

    public boolean isAdmin(){return roles.contains(Role.ROLE_ADMIN);}

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
