<!DOCTYPE html>
<html>
<head>
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
            <p class="About uk-text-bold uk-margin-remove uk-padding-remove">PLACES<img src="/static/images/ОранжевыеТочки.png" height="40px" width="60px" class="uk-margin-small-left uk-margin-small-bottom"></p>
        </div>
    </div>

        <div class="uk-margin-small-right uk-slider-items uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small">
            <#list user.places as place>
                <div>
                    <a href="/place/${place.id}"><div class="PlaceCardStyle uk-padding-small uk-card uk-card-body">
                        <img src="/placeImages/${place.previewImageId}" class="ImageStyle">
                        <p class="Font22White uk-margin-small-top uk-margin-small-bottom">${place.title}</p>
                        <p class="Font16White uk-margin-small-bottom uk-margin-remove-top"><img src="/static/images/Геолокация.png" height="17px" width="17px" class="uk-margin-small-right">${place.area}</p>
                    </div></a>
                </div>
            </#list>
        </div>

</div>
</body>
</html>