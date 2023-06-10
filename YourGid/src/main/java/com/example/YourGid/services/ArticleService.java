package com.example.YourGid.services;

import com.example.YourGid.models.Article;
import com.example.YourGid.models.ArticleImage;
import com.example.YourGid.models.Place;
import com.example.YourGid.models.PlaceImage;
import com.example.YourGid.repositories.ArticleRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ArticleService {

    private final ArticleRepository articleRepository;

    public List<Article> findAll(){
        return articleRepository.findAll();
    }

    public void saveArticle(Article article, MultipartFile file1) throws IOException {
        ArticleImage image1;
        if (file1.getSize()!=0){
            image1 = toImageEntity(file1); //Преобразование из файла в модель фотографии
            image1.setPreviewImage(true);
            article.addImageToArticle(image1);
        }
        log.info("Saving new Article. Title: {}", article.getTitle());
        Article articleFromDb = articleRepository.save(article);
        articleFromDb.setPreviewImageId(articleFromDb.getArticleImages().get(0).getId());
        articleRepository.save(article);
    }

    private ArticleImage toImageEntity(MultipartFile file) throws IOException {
        ArticleImage image = new ArticleImage();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public Article getArticleById(Long id) {
        return articleRepository.findById(id).orElse(null);
    }

    public void deleteArticle(Long id){
        articleRepository.deleteArticleFromImagesById(id);
        articleRepository.deleteArticleById(id);
    }
}
