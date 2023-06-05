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
                    <a href="/login"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
                <#if (user.email??)>
                    <a href="/profile/${user.id}"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
              </div>
           </div>
    </div>

        <div class="BackColor uk-margin-top" uk-grid>
            <img src="/static/images/НазваниеХайлайт.png" height="100px" width="180px" alt="PUZZLE" class="uk-align-center">
        </div>

    <div class="BackColor uk-align-center uk-margin-remove-top uk-width-3-4@xl uk-width-3-4@m" uk-grid>
        <p class="Font16Black">Страницы истории - это проект, направленный на повышение уровня интереса молодёжи к истории родного города. Вместе с экскурсоводами из туристического агентства Царицынский гид мы подготовили историю нынешних точек притяжения молодёжи города Волгограда</p>
    </div>

        <div class="uk-align-center uk-margin-small-right uk-margin-small-left uk-margin-top uk-child-width-1-4@xl uk-child-width-1-4@m uk-child-width-1-3@s uk-child-width-1-1 uk-grid-small uk-flex uk-flex-center" uk-grid>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
        </div>
        <div class="uk-align-center uk-margin-small-right uk-margin-small-left uk-margin-top uk-child-width-1-4@xl uk-child-width-1-4@m uk-child-width-1-3@s uk-child-width-1-1 uk-grid-small uk-flex uk-flex-center" uk-grid>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card PlaceCardStyle">
                        <div class="uk-card-media-top">
                            <img src="/static/images/wears.jpg" width="1800" height="1200" alt="" class="ImageStyle">
                        </div>
                        <div class="uk-card-body uk-padding-small">
                            <h3 class="uk-card-title">Bar</h3>
                        </div>
                    </div>
                </div>
        </div>
</body>
</html>