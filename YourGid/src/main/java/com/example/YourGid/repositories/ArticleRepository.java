package com.example.YourGid.repositories;

import com.example.YourGid.models.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleRepository extends JpaRepository<Article, Long> {
    void deleteArticleById(Long id);
}
