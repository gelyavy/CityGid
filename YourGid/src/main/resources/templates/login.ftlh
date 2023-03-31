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

          .menu1{
            font-size:15px;
            font-family:trebuchet ms;
            color:#000;
          }

          .menu2{
            margin-bottom:15px;
            color:#000;
            font-size:40px;
          }

          .uk-icon{
            color:#000;
            height:55px;
            width:55px;
          }

          .uk-icon-button{
            color:#000;
             height:55px;
             width:55px;
          }

    </style>
</head>
<body>
<nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
    <div class="uk-navbar-left uk-margin-left">
        <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
    </div>
</nav>
<div class="BackWhite uk-section uk-section-large uk-section-muted">
    <div class="uk-child-width-1-1@xl uk-child-width-1-1@m uk-child-width-1-1@s uk-child-width-1-1" uk-grid>
                   <form action="/login" method="post">
                          <div class="menu2 uk-text-bolder uk-text-center">
                             <p>авторизуйтесь</p>
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
                                <input class="uk-align-center uk-margin-remove menu6 uk-button uk-button-secondary" type="submit" value="                Войти                "/>
                          </div>
                   </form>
    </div>
</div>
</body>
</html>
