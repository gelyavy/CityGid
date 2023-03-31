<!DOCTYPE html>
<html>
<head>
    <link rel = "stylesheet" href = "/static/css/style.css">
    <title>CITYGID</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/js/uikit-icons.min.js"></script>

    <style media="screen">
    </style>
</head>

<body>
    <nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
              <div class="uk-navbar-left uk-margin-left">
                   <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
              </div>

              <div class="uk-navbar-right uk-margin-remove-top">
                    <div class="uk-navbar-item">
                        <#if user.email??>
                                <a href="/profile/${user.id}"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="LOGO"></a>
                        </#if>
                    </div>
              </div>
    </nav>
<div class="uk-position-relative uk-visible-toggle" tabindex="-1" uk-slideshow="animation: push">
    <div class="uk-position-center uk-position-small uk-text-center uk-light">
        <h2 class="uk-margin-remove">Center</h2>
        <p class="uk-margin-remove">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </div>
    <ul class="uk-slideshow-items">
            <li>
                <img src="/images/$2" alt="" uk-cover>
            </li>
    </ul>
    <div class="uk-light">
            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
    </div>
</div>


<!--<#list images as img>
    <img src="/images/${img.id}" height="100px"/><br><br>
</#list>
<b>Название места: </b>${place.title}<br>
<b>Описание места: </b>${place.description}<br>
<b>Цена места: </b>${place.price}<br>
<b>Город места: </b>${place.city}<br>
<b>Владелец места: </b>${place.owner}<br>
</hr>
<form action="/place/${place.id}" method="post">
     <input type="hidden" name="_csrf" value="${_csrf.token}">
     <input class="uk-button uk-button-secondary" type="submit" value="посетил"/>
</form>
<#if user.isAdmin()>
    <form action="/place/delete/${place.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Удалить место"/>
    </form>
</#if>-->

</body>
</html>