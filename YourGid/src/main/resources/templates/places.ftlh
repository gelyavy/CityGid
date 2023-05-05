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

    <style media="screen">
        a{
            text-decoration:none;
        }

        a:hover { text-decoration:none; }

        .menu2{
             line-height:20px;
             font-size:20px;
             color:#000;
        }

        .menu1{
            font-size: 20px;
            font-family:arial;
         }

        .menu3{
            line-height:70px;
            font-size: 55px;
            color:#000;
        }

        .MainText{
            font-size:35px;
            color:#000;
        }

        .PreMainText{
            font-size:24px;
            color:#000;
        }

        .Font16White{
            font-size:16px;
            color:#fff;
        }

        .Font22Black{
            font-size:22px;
            color:#000;
        }

        .Font22White{
            font-size:22px;
            color:#fff;
        }

        .BigButton{
            border-width:2px;
            border-radius: 35px;
            border-color:#000;
            background: #000;
        }

        .LinkStyle{
            text-decoration: none;
            color: #000;
            font-size:20px;
        }

        .ImageStyle{
            border-radius: 20px;
        }

        .CardStyle{
            border-radius: 25px;
            background-color: #000;
        }

        .OrangeCard{
            border-radius: 25px;
            background-color: #F95B32;
        }



    </style>
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


    <div class="BackColor uk-child-width-1-2@l uk-child-width-1-2@m uk-child-width-1-1@s uk-margin-remove" uk-grid>
        <div class="uk-margin-top" uk-grid>
            <p class="MainText uk-text-bold uk-margin-remove"><img src="/static/images/НазваниеХайлайт.png" height="100px" width="180px" alt="PUZZLE">  - Is who? </p>
            <p class="PreMainText uk-text-bold uk-margin-remove">проект о любви к своему городу.</p>
            <p class="PreMainText uk-text-bold uk-margin-remove-top uk-margin-small-bottom">подборки уникальных мест.</p>
        </div>
        <div class="uk-inline uk-padding-remove uk-margin-remove">
            <#if !(user.email??)>
                    <img src="/static/images/ОранжеваяОбводка.png" height="190px" width="360px" class="uk-align-center uk-margin-top">
                    <div class="uk-flex uk-position-center">
                        <form action="/registration" method="get">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input class="BigButton Font16White uk-text-lowercase uk-button uk-button-secondary uk-margin-right" type="submit" value="Регистрация"/>
                        </form>
                        <form action="/login" method="get">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input class="BigButton Font16White uk-text-lowercase uk-button uk-button-secondary" type="submit" value="Вход"/>
                        </form>
                    </div>
            </#if>
        </div>
    </div>


    <div class="BackColor uk-padding-small uk-padding-remove-vertical uk-margin-small-top uk-position-relative uk-visible-toggle uk-dark" tabindex="-1" uk-slider="finite: true">
        <ul class="uk-slider-items uk-grid-small">
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипЕда.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипТеатр.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипБар.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипМагазин.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипКофейня.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипМузеи.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипОтдых.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипПарк.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипСпорт.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипМузеи.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипТеатр.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипЕда.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипБар.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипСпорт.png" width="75" height="75" alt="">
                </div>
            </li>
            <li>
                <div class="uk-panel">
                    <img src="/static/images/ЛоготипОтдых.png" width="75" height="75" alt="">
                </div>
            </li>
        </ul>

        <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-margin-remove-top uk-margin-medium-left" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-margin-remove-top" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>


    <div class="BackColor uk-padding uk-padding-remove-vertical uk-margin-top uk-flex uk-flex-between">
        <div class="uk-text-bolder Font22Black">
            <p class="uk-margin-small-bottom">Популярное<img src="/static/images/Звездочка.png" height="25px" width="25px" class="uk-margin-small-left"></p>
        </div>
        <a href="/allPlaces"><div class="LinkStyle">
                    <p>подробнее</p>
        </div></a>
    </div>

    <div class="uk-position-relative uk-visible-toggle uk-light uk-margin-remove uk-dark" tabindex="-1" uk-slider="finite: true">
        <div class="uk-slider-items uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small">
            <#list places as place>
                <div>
                    <div class="CardStyle uk-padding-small uk-card uk-card-body">
                        <img src="/images/${place.previewImageId}" class="ImageStyle">
                        <p class="Font22White uk-margin-small-top uk-margin-small-bottom">${place.title}</p>
                        <p class="Font16White uk-margin-small-bottom uk-margin-remove-top"><img src="/static/images/Геолокация.png" height="15px" width="15px" class="uk-margin-small-right">${place.area}</p>
                            <form action="/place/${place.id}" method="get">
                                <input class="BigButton Font16White uk-text-lowercase uk-button uk-button-secondary" type="submit" value="go" href="/place/${place.id}"/>
                            </form>
                    </div>
                </div>
            </#list>
        </div>
        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
    </div>

            <div class="uk-position-relative uk-visible-toggle uk-light uk-padding-small uk-margin-remove uk-dark" tabindex="-1" uk-slider="finite: true">
                <ul class="uk-slider-items uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small">
                    <#list places as place>
                        <#if (place.id==102)||(place.id==106)||(place.id==90)>
                            <li>
                                <div>
                                    <div class="uk-card uk-card-default">
                                        <div class="uk-card-media-top">
                                            <img src="/images/${place.previewImageId}" alt="logo">
                                        </div>
                                        <div class="uk-card-body uk-padding-small">
                                            <h3 class="uk-card-title">${place.title}</h3>
                                            <p>${place.description}</p>
                                            <form action="/place/${place.id}" method="get">
                                                <input class="uk-button uk-button-secondary" type="submit" value="Подробнее"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </#if>
                    </#list>
                </ul>

                <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>

            </div>
</div>
</body>
</html>



