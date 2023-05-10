package com.example.YourGid.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.scheduling.quartz.LocalDataSourceJobStore;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="events")
@Data
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
