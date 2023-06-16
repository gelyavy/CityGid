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

    <div class="BackColor uk-padding uk-padding-remove-vertical uk-margin-top uk-flex uk-flex-between">
        <div class="uk-text-bolder Font25Orange">
            <p class="uk-margin-small-bottom"><a href="/"><img src="/static/images/ПрямаяСтрелкаЧёрная.png" height="25px" width="25px" class="uk-margin-small-right"></a>${article.number}</p>
            <p class="Font22Black uk-margin-remove uk-padding-remove uk-align-right">${article.date}</p>
        </div>
    </div>

    <div>
        <div class="uk-padding-small uk-padding-remove-vertical uk-text-center uk-align-center uk-margin-remove" uk-grid>
            <p class="Font35Black uk-text-bold uk-margin-remove uk-padding-remove">${article.title}</p>
        </div>
    </div>

    <div class="uk-padding uk-padding-remove-vertical uk-align-center uk-margin-bottom uk-margin-remove-top" uk-grid>
        <p style="white-space:pre-wrap" class="Font19Black uk-margin-remove uk-padding-remove">${article.description}</p>
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