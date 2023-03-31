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
            .menu3{
                line-height:20px;
                font-size: 45px;
                color:#000;
                font-family:arial;
            }

            .menu5 {
                font-size: 22px;
            }

            a{
                text-decoration:none;
            }

            a:hover { text-decoration:none; }

            .menu4 {
                font-size: 120px;
                color:#fff
             }
    </style>
</head>
<body>
    <nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
        <div class="uk-navbar-left uk-margin-left">
            <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
        </div>
        <#if user.isAdmin()>
            <div class="uk-navbar-right">
                <a href="/admin"><h3>АДМИНКА</h3></a>
            </div>
        </#if>
    </nav>

    <div class="uk-section uk-padding-remove-top uk-section-muted uk-padding">
        <div class="uk-child-width-1-5@xl uk-child-width-1-3@m uk-child-width-1-2@s uk-child-width-1-1 uk-grid-small uk-grid-match" uk-grid>

            <div class="uk-margin-remove-bottom uk-flex uk-flex-center">
               <div class="uk-padding-small uk-padding-remove-top uk-margin-bottom">
                   <div class="lightGray uk-card uk-card-default uk-padding uk-padding-remove-horizontal">
                      <div class="uk-card-media-top uk-padding uk-padding-remove-bottom">
                         <img class="uk-align-center uk-margin uk-margin-remove-bottom" src="/static/images/ЛоготипПрофиля.png" height="120px" width="120px" alt="LOGO">
                      </div>
                      <div class="uk-card-body uk-padding-small">
                         <button class="menu6 uk-text-bolder uk-button uk-button-default uk-button-large uk-width-1-1 uk-margin">${user.name}</button>
                         <button class="menu6 uk-text-bolder uk-button uk-button-default uk-button-large uk-width-1-1 uk-margin">${user.email}</button>
                         <button class="menu6 uk-text-bolder uk-button uk-button-default uk-button-large uk-width-1-1 uk-margin">${user.phoneNumber}</button>
                         <form action="/logout" method="post" class="uk-flex uk-flex-center">
                             <input type="hidden" name="_csrf" value="${_csrf.token}">
                             <input class="menu6 uk-button uk-button-secondary uk-margin" type="submit" value="Выйти"/>
                         </form>
                      </div>
                   </div>
               </div>
            </div>

            <div class="uk-margin-remove-bottom uk-margin-remove-top uk-flex uk-flex-center">
                <div class="uk-padding-small uk-padding-remove-top uk-padding-remove-bottom">
                    <a href="/profile/${user.id}/places"><div class="menu3 brown uk-text-bolder uk-text-large uk-margin-medium-bottom uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-top-right uk-padding">
                            <img src="/static/images/стрелка.png" height="60px" width="60px" alt="стрелка">
                        </div>
                        <div class="menu5 defaultBlack uk-position-top-left uk-padding">
                           <p>открывай город</p>
                        </div>
                        <div class="uk-position-bottom uk-padding uk-text-bold">
                            <p>места</p>
                            <p>в которых</p>
                            <p>я  бывал</p>
                        </div>
                    </div></a>
                </div>
                <div class="uk-padding-small uk-padding-remove-top uk-padding-remove-bottom">
                    <a href="/"><div class="menu4 black uk-text-bolder uk-text-large uk-margin-medium-bottom uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-center uk-padding">
                            <#if user.placesAmount??>
                                <p>${user.percents}%</p>
                            <#else>
                                <p>0%</p>
                            </#if>
                        </div>
                        <div class="menu5 white uk-position-bottom-center uk-padding">
                             <p>города открыто</p>
                        </div>
                    </div></a>
                </div>
            </div>

            <div class="uk-margin-remove-top uk-flex uk-flex-center">
                <div class="uk-padding-small uk-padding-remove-top uk-padding-remove-bottom">
                    <a href="/"><div class="menu3 beige uk-text-bolder uk-text-large uk-margin-medium-bottom uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-top-left uk-padding">
                            <img src="/static/images/зеркалоСтрелка.png" height="60px" width="60px" alt="стрелка">
                        </div>
                        <div class="menu5 defaultBlack uk-position-top-right uk-padding">
                             <p>умный текст</p>
                        </div>
                        <div class="uk-position-bottom uk-padding uk-text-right uk-text-bold">
                              <p>тут</p>
                              <p>тоже</p>
                              <p>будет текст</p>
                        </div>
                    </div></a>
                </div>
                <div class="uk-padding-small uk-padding-remove-top uk-padding-remove-bottom">
                    <a href="/profile/random"><div class="menu3 gray uk-text-bolder uk-text-large uk-margin-medium-bottom uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-top uk-padding uk-text-right uk-text-bold">
                            <p>рандомная</p>
                            <p>генерация</p>
                            <p>места</p>
                        </div>
                        <div class="uk-position-bottom-left uk-padding">
                            <img src="/static/images/геолокация.png" height="60px" width="60px" alt="геолокация">
                        </div>
                        <div class="menu5 defaultBlack uk-position-bottom-right uk-padding">
                             <p>попробуй новое</p>
                        </div>
                    </div></a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>