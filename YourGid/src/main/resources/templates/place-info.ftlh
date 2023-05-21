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

    <link rel = "stylesheet" href = "/static/css/style.css">

    <style media="screen">
          .All{
            min-height: 100vh;
          }
    </style>
</head>

<body>
<div class="All BackColor uk-padding uk-padding-remove-horizontal">
    <div class="BackColor">
           <div class="uk-flex uk-flex-between">
              <div class="uk-padding uk-padding-remove-vertical">
                   <a href="/"><img src="/static/images/Логотип.png" height="55px" width="125px" alt="LOGO"></a>
              </div>
              <div class="uk-padding uk-padding-remove-vertical">
                <#if !(user.email??)>
                    <a href="/registration"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
                <#if (user.email??)>
                    <a href="/profile/${user.id}"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
              </div>
           </div>
    </div>

    <div class="BackColor uk-child-width-1-2@l uk-child-width-1-2@m uk-child-width-1-1@s uk-margin-remove" uk-grid>
        <div class="uk-margin-remove uk-inline" uk-grid>
            <p class="About uk-text-bold uk-margin-remove uk-padding-remove">ABOUT<img src="/static/images/Звездочка.png" height="40px" width="40px" class="uk-margin-small-left uk-margin-small-bottom"></p>
        </div>
    </div>

    <div class="uk-position-relative uk-text-left uk-visible-toggle uk-light uk-margin-remove-bottom uk-padding-small uk-padding-remove-vertical" tabindex="-1" uk-slider>
        <ul class="uk-slider-items uk-child-width-3-4 uk-child-width-1-3@m uk-child-width-1-2@s uk-grid-small">
            <#list images as img>
                <li>
                    <div class="uk-panel">
                        <img src="/placeImages/${img.id}" class="ImageInfoStyle">
                    </div>
                </li>
            </#list>
        </ul>
        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>

     <div class="BackColor uk-child-width-1-3@l uk-child-width-1-3@m uk-child-width-1-1@s uk-margin-small-left" uk-grid>
        <div class="uk-padding-small uk-padding-remove-vertical">
            <div class="InfoCardOrange uk-card uk-card-default uk-card-small uk-card-body uk-margin-small-top">
                <p class="uk-card-title Font35Black uk-text-bold uk-margin-remove-bottom">как называется?</p>
                <p class="Font25Black uk-margin-remove">${place.title}</p>
                <p class="Font25Black uk-margin-small-bottom uk-margin-small-top"><img src="/static/images/ЧёрнаяГеолокация.png" height="25px" width="25px" class="uk-margin-small-right">${place.area}</p>
            </div>
        </div>
        <div class="uk-padding-small uk-padding-remove-vertical uk-margin-remove">
            <div class="InfoCardOrange uk-card uk-card-default uk-card-small uk-card-body uk-margin-small-top">
                <p class="uk-card-title Font35Black uk-text-bold uk-margin-remove-bottom">куда идти?</p>
                <p class="Font25Black uk-margin-small-bottom uk-margin-remove-top"><img src="/static/images/ЧёрнаяГеолокация.png" height="25px" width="25px" class="uk-margin-small-right">${place.address}</p>
                <#if (flag==false)>
                     <form action="/place/${place.id}" method="post">
                          <input type="hidden" name="_csrf" value="${_csrf.token}">
                          <input class="BigButtonTransparent Font19Black uk-text-bolder uk-text-lowercase uk-button uk-button-secondary" type="submit" value="добавить"/>
                     </form>
                <#else>
                     <button class="BigButtonTransparent Font19Black uk-text-bolder uk-text-lowercase uk-button uk-button-secondary">вы тут были;)</button>
                </#if>
            </div>
        </div>
        <div class="uk-padding-small uk-padding-remove-vertical uk-margin-remove">
            <div class="InfoCardOrange uk-card uk-card-default uk-card-small uk-card-body uk-margin-small-top">
                <p class="uk-card-title Font35Black uk-text-bold uk-margin-remove-bottom">подробнее?</p>
                <p class="Font19Black uk-margin-small-bottom uk-margin-remove">${place.description}</p>
            </div>
        </div>
     </div>
</div>
</body>
</html>