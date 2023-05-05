package com.example.YourGid.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data //Автоматическое создание геттеров и сеттеров всех полей класса.
@Entity //Указывает, что данный класс (БИН) является сущностью.
@Table(name = "places") //Указывает на имя таблицы, в которой будут храниться поля класса.
@AllArgsConstructor //Аатоматическое создание конструкторов всех полей класса.
@NoArgsConstructor //Автоматическое создание конструкторов всех полей класса БЕЗ ПАРАМЕТРОВ.
public class Place {
    @Id //ID КОЛОНКИ.
    @GeneratedValue(strategy = GenerationType.AUTO) //Указывает, что данное свойство будет создавать соглсно стратегии - АВТОМАТИЧЕСКИ.
    @Column(name = "id") //Колонка в БД, в которой будет храниться значение данного поля.
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private String type;
    @Column(name = "area")
    private String area;
    @Column(name = "address")
    private String address;
    @Column(name = "date")
    private String date;
    @Column(name = "description", columnDefinition = "text")
    private String description;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy= "place")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init(){
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToPlace(Image image){
        image.setPlace(this);
        images.add(image);
    }
}
