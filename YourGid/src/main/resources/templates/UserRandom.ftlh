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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js" async></script>

    </style>

</head>
<body>
        <nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
            <div class="uk-navbar-left uk-margin-left">
                <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
            </div>
        </nav>


        <form action="/profile/random" method="get">
            <button class="uk-button uk-button-default uk-margin-small-right" type="button" uk-toggle="target: #modal-close-default">Default</button>
        </form>

        <div id="modal-close-default" uk-modal>
            <div class="uk-modal-dialog uk-modal-body">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-section uk-section-muted uk-padding"">
                            <div class="uk-child-width-1-7@xl uk-child-width-1-5@m uk-child-width-1-2@s uk-child-width-1-2 uk-text-center" uk-grid>
                                <div>
                                    <div class="uk-card uk-card-default">
                                        <div class="uk-card-media-top">
                                            <img src="/images/${place.previewImageId}" alt="logo">
                                        </div>
                                        <div class="uk-card-body">
                                            <h3 class="uk-card-title">${place.title}</h3>
                                            <p>${place.description}</p>
                                            <form action="/place/${place.id}" method="get">
                                                <input class="uk-button uk-button-secondary" type="submit" value="Подробнее"/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                        </div>
            </div>
        </div>

</body>
</html>