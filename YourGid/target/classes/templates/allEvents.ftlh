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
        .black{
            border: 2px solid #000;
        }

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
                    <a href="/login"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
                <#if (user.email??)>
                    <a href="/profile/${user.id}"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
              </div>
           </div>
    </div>

    <div class="BackColor uk-padding uk-padding-remove-vertical uk-margin-top uk-align-center uk-flex uk-flex-center uk-child-width-1-2@xl uk-child-width-1-2@m uk-child-width-1-2@s uk-width-1-1">
        <form class="uk-search uk-search-default black" action="/allEvents" method="get">
            <span uk-search-icon></span>
            <input class="black uk-search-input uk-align-center uk-margin-remove" type="text" name="title">
        </form>
    </div>

        <div class="uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-3@s uk-child-width-1-2 uk-grid-small">
            <#list events as event>
                <div>
                    <a href="/event/${event.id}"><div class="EventCardStyle uk-padding-small uk-card uk-card-body">
                        <img src="/eventImages/${event.previewImageId}" class="ImageStyle">
                        <p class="Font22White uk-margin-small-top uk-margin-small-bottom">${event.title}</p>
                        <p class="Font16White uk-margin-small-bottom uk-margin-remove-top"><img src="/static/images/ИконкаЧасы.png" height="17px" width="17px" class="uk-margin-small-right">${event.date}</p>
                    </div></a>
                </div>
            </#list>
        </div>

</div>
</body>
<div class="BackColor">
    <div class="footer uk-padding-small uk-child-width-1-6@l uk-child-width-1-6@m uk-child-width-1-6@s uk-child-width-1-2" uk-grid>
        <div>
            <div class="uk-padding-small uk-padding-remove-vertical">
                <div class="Font16White">
                    <p class="uk-margin-small-bottom">With the support of</p>
                </div>
            </div>

            <div class="uk-padding-small uk-padding-remove-horizontal uk-margin-remove" uk-grid>
                <div class="uk-padding-small uk-padding-remove-vertical">
                    <div>
                        <img src="/static/images/logobig.png" class="uk-text-center" alt="LOGO">
                    </div>
                </div>
            </div>
        </div>

        <div class="uk-padding-remove">
            <div class="uk-padding-small uk-padding-remove-vertical">
                <div class="Font16White">
                    <p class="uk-margin-small-bottom">Contact us</p>
                </div>
            </div>

            <div class="uk-padding-small uk-padding-remove-vertical">
                <div class="Font17White">
                    <p class="uk-margin-small-bottom">puzzle.volga@gmail.com</p>
                </div>
            </div>

        </div>
    </div>
</div>
</html>