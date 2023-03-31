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
            height:40px;
            width:40px;
        }
    </style>
</head>
<body>

<nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
     <div class="uk-navbar-left uk-margin-left">
        <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
     </div>
</nav>

<div class="BackWhite uk-section uk-section-large uk-section-muted uk-padding-large">
    <div class="uk-child-width-1-1@xl uk-child-width-1-1@m uk-child-width-1-1@s uk-child-width-1-1" uk-grid>
            <form action="/registration" method="post">
                    <div class="menu2 uk-text-bolder uk-text-center">
                        <p>регистрация</p>
                    </div>
                    <div class="uk-text-center uk-margin-bottom">
                         <div class="uk-inline">
                             <input class="uk-input uk-form-large" type="text" name="name" placeholder="Введите имя">
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
                    <div class="uk-flex uk-flex-center">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input class="menu6 uk-align-center uk-button uk-button-secondary uk-margin-remove" type="submit" value="         Регистрация         "/>
                    </div>
            </form>
            <#if errorMessage??>
                <h2 style="color: red">${errorMessage}</h2>
            </#if>
    </div>
</div>
</body>
</html>