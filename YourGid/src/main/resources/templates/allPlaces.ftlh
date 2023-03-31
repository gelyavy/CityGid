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
            img{
                border-radius: 25px 25px 0 0;
            }

            .smallLine{
                padding:5px;
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

    <div class="BackWhite uk-padding-small uk-margin-remove uk-align-center uk-flex uk-flex-center uk-child-width-1-2@xl uk-child-width-1-2@m uk-child-width-1-2@s uk-width-1-1">
        <form class="uk-search uk-search-default gray" action="/allPlaces" method="get">
            <span uk-search-icon></span>
            <input class="uk-search-input uk-align-center uk-margin-remove" type="search" aria-label="Search">
        </form>
    </div>

    <div class="BackWhite uk-padding-small uk-margin-remove uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid">
        <#list places as place>
             <div class="smallLine">
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
        </#list>
    </div>
</body>
</html>