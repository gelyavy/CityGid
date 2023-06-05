package com.example.YourGid.controllers;

import com.example.YourGid.models.Article;
import com.example.YourGid.models.Place;
import com.example.YourGid.models.User;
import com.example.YourGid.services.ArticleService;
import com.example.YourGid.services.PlaceService;
import com.example.YourGid.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class ArticleController {
    private final ArticleService articleService;
    private final PlaceService placeService;

    @GetMapping("/article/{id}")
    public String articleInfo(@PathVariable Long id, Model model, Principal principal){
        Article article = articleService.getArticleById(id);
        model.addAttribute("user", placeService.getUserByPrincipal(principal));
        model.addAttribute("article", article);
        return "article-info";
    }

    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    @PostMapping("/article/create")
    public String createArticle(@RequestParam("file1") MultipartFile file1, Article article) throws IOException {
        articleService.saveArticle(article, file1);
        return "redirect:/admin";
    }
}
