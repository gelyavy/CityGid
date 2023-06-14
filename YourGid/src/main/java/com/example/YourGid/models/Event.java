package com.example.YourGid.models;

import lombok.*;
import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="events")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Event {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private String type;
    @Column(name = "address")
    private String address;
    @Column(name = "date")
    private String date;
    @Column(name = "description", columnDefinition = "text")
    private String description;

    @Override
    public boolean equals(Object ob){
        if (ob == this) {return true;}
        if (ob == null || ob.getClass() != getClass()) {return false;}
        Event event = (Event) ob;
        return event.id.equals(id) &&
                event.title.equals(title) &&
                event.type.equals(type) &&
                event.address.equals(address) &&
                event.date.equals(date) &&
                event.description.equals(description);
    }

    @Override
    public int hashCode(){
        int result = 17;
        result = 31 * result + (id == null ? 0 : id.hashCode());
        result = 31 * result + (title == null ? 0 : title.hashCode());
        result = 31 * result + (type == null ? 0 : type.hashCode());
        result = 31 * result + (address == null ? 0 : address.hashCode());
        result = 31 * result + (date == null ? 0 : date.hashCode());
        result = 31 * result + (description == null ? 0 : description.hashCode());
        return result;
    }

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name="users_events", joinColumns = @JoinColumn(name = "event_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
    private Set<User> allUsersOfEvents = new HashSet<User>();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy= "event")
    private List<EventImage> eventImages = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void initial(){
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToEvent(EventImage eventImage){
        eventImage.setEvent(this);
        eventImages.add(eventImage);
    }
}
