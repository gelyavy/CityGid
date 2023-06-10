package com.example.YourGid.repositories;

import com.example.YourGid.models.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ArticleRepository extends JpaRepository<Article, Long> {

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM articles_images WHERE article_id = :id", nativeQuery = true)
    void deleteArticleFromImagesById(@Param("id") Long id);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM articles WHERE id = :id", nativeQuery = true)
    void deleteArticleById(@Param("id") Long id);
}
