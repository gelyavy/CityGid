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
          .uk-button{
            border-radius:25px;
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
                    <a href="/registration"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
                <#if (user.email??)>
                    <a href="/profile/${user.id}"><img src="/static/images/ЛоготипПрофиля.png" height="50px" width="50px" alt="PROFILE"></a>
                </#if>
              </div>
           </div>
    </div>


    <div class="uk-child-width-1-3@xl uk-child-width-1-3@m uk-child-width-1-1@s uk-child-width-1-1 uk-padding-large uk-padding-remove-horizontal uk-margin-large-top" uk-grid>
                   <form action="/login" method="post" class="uk-align-center">
                          <div class="Font35Black uk-text-bolder uk-text-center uk-margin-small-top">
                              <p>вход<img src="/static/images/ДлиннаяОранжеваяСтрелка.png" height="15px" width="150px"></p>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                 <input class="uk-input uk-form-large" type="email" name="username" placeholder="Введите почту">
                             </div>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                  <input class="uk-input uk-form-large" type="text" name="password" placeholder="Введите пароль">
                             </div>
                          </div>
                          <div class = "uk-flex uk-flex-center">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input class="uk-text-center uk-margin-remove uk-button uk-button-secondary" type="submit" value="Войти"/>
                          </div>
                          <div>
                             <a href="/registration"><div class="LinkStyle uk-flex uk-flex-center uk-margin-small-top">
                             <p>нет аккаунта? регистрация.</p></a>
                          </div>
                   </form>
    </div>
</div>
</body>
</html>
