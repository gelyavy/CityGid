<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>

    <title>CITYGID</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.15.22/dist/js/uikit-icons.min.js"></script>

    <link rel = "stylesheet" href = "/static/css/style.css">

</head>
<body>
<div class="BackColor uk-padding uk-padding-remove-horizontal">
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

        <div class="uk-margin-small-right uk-margin-small-left uk-margin-top uk-child-width-1-3@xl uk-child-width-1-3@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small uk-flex uk-flex-center">
            <#list places as place>
                <div>
                    <a href="/place/${place.id}"><div class="PlaceCardStyle uk-padding-small uk-card uk-card-body">
                        <img src="/placeImages/${place.previewImageId}" class="ImageStyle">
                        <p class="Font22White uk-margin-small-top uk-margin-small-bottom">${place.title}</p>
                        <p class="Font16White uk-margin-small-bottom uk-margin-remove-top"><img src="/static/images/Геолокация.png" height="17px" width="17px" class="uk-margin-small-right">${place.area}</p>
                    </div></a>
                </div>
            </#list>
        </div>
</body>
</html>