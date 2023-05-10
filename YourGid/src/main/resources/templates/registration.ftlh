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
            min-height: 80vh;
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


    <div class="All uk-child-width-1-3@xl uk-child-width-1-3@m uk-child-width-1-1@s uk-child-width-1-1 uk-padding-large uk-padding-remove-horizontal uk-margin-large-top" uk-grid>
                   <form action="/registration" method="post" class="uk-align-center">
                          <div class="Font22Black uk-text-bolder uk-text-center uk-margin-small-top">
                              <p>регистрация<img src="/static/images/ДлиннаяОранжеваяСтрелка.png" height="15px" width="90px"></p>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                 <input class="uk-input uk-form-large" type="text" name="username" placeholder="Введите имя">
                             </div>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                  <input class="uk-input uk-form-large" type="email" name="email" placeholder="Введите почту">
                             </div>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                  <input class="uk-input uk-form-large" type="text" name="phoneNumber" placeholder="Введите номер">
                             </div>
                          </div>
                          <div class="uk-text-center uk-margin-bottom">
                             <div class="uk-inline">
                                  <input class="uk-input uk-form-large" type="text" name="password" placeholder="Введите пароль">
                             </div>
                          </div>
                          <div class = "uk-flex uk-flex-center">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input class="uk-text-center uk-margin-remove uk-button uk-button-secondary" type="submit" value="         Регистрация         "/>
                          </div>
                          <div>
                            <a href="/login"><div class="LinkStyle uk-flex uk-flex-center uk-margin-small-top">
                            <p>уже есть аккаунт? войти.</p></a>
                          </div>
                   </form>
                   <#if errorMessage??>
                       <h2 style="color: red">${errorMessage}</h2>
                   </#if>
    </div>
</div>
</body>
</html>