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


        img{
            border-radius: 25px 25px 0 0;
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

        .menu4{
            font-size:25px;
            color:#000;
        }

        .menu5{
            font-size:18px;
            color:#000;
        }

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


    <div class="uk-padding-small uk-padding-remove-right BackWhite uk-child-width-1-1@xl uk-child-width-1-1@m uk-child-width-1-1@s uk-child-width-1-1 uk-margin-remove-top" uk-grid>

            <div class="uk-container uk-container-xlarge uk-background-cover uk-padding-remove-right">
                    <div class="menu3 uk-margin-bottom uk-text-center uk-align-center uk-text-bolder uk-padding-large uk-padding-remove-vertical uk-margin-top">
                        <p class="uk-margin-remove">твой гид</p>
                        <p class="uk-margin-remove">по любимому городу</p>
                    </div>
                    <div class="menu2 uk-margin-remove uk-text-center uk-align-center">
                        <p>ищи интересные места</p>
                        <p>и перестань думать куда сходить</p>
                    </div>
                    <#if !(user.email??)>
                        <div class="uk-margin-medium-top uk-flex uk-flex-center">
                             <form action="/registration" method="get">
                                   <input type="hidden" name="_csrf" value="${_csrf.token}">
                                   <button class="menu6 uk-button uk-button-default uk-margin-small-right">Регистрация</button>
                             </form>
                             <form action="/login" method="get">
                                   <input type="hidden" name="_csrf" value="${_csrf.token}">
                                   <input class="menu6 uk-button uk-button-secondary" type="submit" value="Войти"/>
                             </form>
                        </div>
                    </#if>

                    <div class="uk-padding uk-margin-remove uk-align-center uk-flex uk-flex-center uk-child-width-1-2@xl uk-child-width-1-2@m uk-child-width-1-2@s uk-width-1-1">
                        <form class="uk-search uk-search-default gray" action="/allPlaces" method="get">
                            <span uk-search-icon></span>
                            <input class="uk-search-input uk-align-center uk-margin-remove" type="search" aria-label="Search">
                        </form>
                    </div>
            </div>


            <div class="uk-padding-large uk-padding-remove-top uk-padding-remove-right uk-margin-remove uk-position-relative uk-visible-toggle uk-dark" tabindex="-1" uk-slider="finite: true">

                <ul class="uk-slider-items uk-child-width-1-4 uk-child-width-1-6@m uk-child-width-1-5@s uk-grid-small">
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
                </ul>

                <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-margin-remove-top uk-margin-medium-left" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
                <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-margin-remove-top" href="#" uk-slidenav-next uk-slider-item="next"></a>

            </div>

            <div class="uk-inline uk-margin">
                <div class="uk-padding-large uk-padding-remove-vertical uk-position-small uk-position-center-left uk-align-center uk-text-bolder menu4">
                    <p>Популярное</p>
                </div>

                <a href="/allPlaces"><div class="uk-padding-large uk-padding-remove-vertical uk-position-small uk-position-center-right uk-align-center uk-margin-remove-right menu5">
                    <p>подробнее</p>
                </div></a>
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



