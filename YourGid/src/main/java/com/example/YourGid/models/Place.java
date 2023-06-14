package com.example.YourGid.models;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "places")
@AllArgsConstructor
@NoArgsConstructor
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private String type;
    @Column(name = "area")
    private String area;
    @Column(name = "address")
    private String address;
    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Override
    public boolean equals(Object ob){
        if (ob == this) {return true;}
        if (ob == null || ob.getClass() != getClass()) {return false;}
        Place place = (Place) ob;
        return place.id.equals(id) &&
                place.title.equals(title) &&
                place.type.equals(type) &&
                place.area.equals(area) &&
                place.address.equals(address) &&
                place.description.equals(description);
    }

    @Override
    public int hashCode(){
        int result = 17;
        result = 31 * result + (id == null ? 0 : id.hashCode());
        result = 31 * result + (title == null ? 0 : title.hashCode());
        result = 31 * result + (type == null ? 0 : type.hashCode());
        result = 31 * result + (area == null ? 0 : area.hashCode());
        result = 31 * result + (address == null ? 0 : address.hashCode());
        result = 31 * result + (description == null ? 0 : description.hashCode());
        return result;
    }

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="users_places", joinColumns = @JoinColumn(name = "place_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
    private Set<User> allUsersOfPlaces = new HashSet<User>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy= "place")
    private List<PlaceImage> placeImages = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init(){
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToPlace(PlaceImage placeImage){
        placeImage.setPlace(this);
        placeImages.add(placeImage);
    }

}
