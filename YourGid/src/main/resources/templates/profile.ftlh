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

</head>
<body>
<div class="BackColor uk-padding uk-padding-remove-horizontal">
    <div class="BackColor">
           <div class="uk-flex uk-flex-between">
              <div class="uk-padding uk-padding-remove-vertical">
                   <a href="/"><img src="/static/images/Логотип.png" height="55px" width="125px" alt="LOGO"></a>
              </div>
              <div class="uk-padding uk-padding-remove-vertical">
                <#if user.isAdmin()>
                    <a href="/admin"><p>админка</p></a>
                </#if>
              </div>
           </div>
    </div>

    <div class="BackColor uk-section uk-padding-small">
        <div class="uk-child-width-1-3@xl uk-child-width-1-3@m uk-child-width-1-2@s uk-child-width-1-1 uk-grid-small uk-grid-match" uk-grid>
            <div class="uk-margin-remove-bottom uk-margin-remove-top uk-flex uk-flex-center">
                <div class="uk-padding-small">
                    <a href="/profile/${user.id}/places"><div class="WhiteCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-top-right uk-padding">
                            <img src="/static/images/стрелка.png" height="60px" width="60px" alt="стрелка">
                        </div>
                        <div class="Font22Black defaultBlack uk-position-top-left uk-padding">
                           <p>открывай город</p>
                        </div>
                        <div class="Font40Black uk-position-bottom uk-padding uk-text-bold">
                            <p>места</p>
                            <p>в которых</p>
                            <p>я  бывал</p>
                        </div>
                    </div></a>
                </div>

                <div class="uk-padding-small">
                    <a href="/profile/${user.id}/places"><div class="OrangeCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="Font22Black defaultBlack uk-position-top-right uk-padding">
                            <p>следи за новостями</p>
                        </div>
                        <div class="uk-position-bottom-left uk-padding uk-margin-small-bottom">
                            <img src="/static/images/ГлазИконка.png" height="60px" width="60px" alt="глаз">
                        </div>
                        <div class="Font40Black uk-position-bottom uk-padding uk-text-right uk-text-bold">
                            <p>куда</p>
                            <p>я пойду</p>
                        </div>
                    </div></a>
                </div>
            </div>
            <div class="uk-margin-remove-bottom uk-margin-remove-top uk-flex uk-flex-center">
                <div class="uk-padding-small">
                    <div class="Font120White BlackCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="uk-position-center uk-padding">
                            <#if user.placesAmount??>
                                <p>${user.percents}%</p>
                            <#else>
                                <p>0%</p>
                            </#if>
                        </div>
                        <div class="Font22White uk-position-bottom-center uk-padding">
                             <p>города открыто</p>
                        </div>
                    </div>
                </div>

                <div class="uk-padding-small">
                    <a href="/profile/random"><div class="WhiteCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="Font40Black uk-position-top uk-padding uk-text-right uk-text-bold">
                            <p>рандомная</p>
                            <p>генерация</p>
                            <p>места</p>
                        </div>
                        <div class="uk-position-bottom-left uk-padding">
                            <img src="/static/images/ЧёрнаяГеолокация.png" height="60px" width="60px" alt="геолокация">
                        </div>
                        <div class="Font22Black uk-position-bottom-right uk-padding">
                             <p>попробуй новое</p>
                        </div>
                    </div></a>
                </div>
            </div>

            <div class="uk-margin-remove-top uk-flex uk-flex-center">
                <div class="uk-padding-small">
                    <a href="/"><div class="BlackCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="Font22White defaultBlack uk-position-top-left uk-padding">
                           <p>узнавай первым</p>
                        </div>
                        <div class="Font40White uk-position-bottom uk-text-left uk-padding uk-text-bold">
                            <img src="/static/images/ИконкаЧасы.png" height="60px" width="60px" alt="часы">
                            <p>подпишись</p>
                            <p>на рассылку</p>
                        </div>
                    </div></a>
                </div>

                <div class="uk-padding-small">
                    <div class="OrangeCard uk-text-bolder uk-text-large uk-card uk-card-default uk-card-body uk-height-medium">
                        <div class="Font40Black uk-position-top-center uk-text-center uk-padding uk-text-bold">
                            <p>нам пора</p>
                            <p>прощаться</p>
                        </div>
                        <form action="/logout" method="post" class="uk-position-center uk-margin-top">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" class="BigButton Font22White uk-text-lowercase uk-button uk-button-large" value="           выход           "/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>