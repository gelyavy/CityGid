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

    <style media="screen">
    </style>
</head>

<body>

<#if (flag==false)>
    <form action="/place/${place.id}" method="post">
         <input type="hidden" name="_csrf" value="${_csrf.token}">
         <input class="uk-button uk-button-secondary" type="submit" value="посетил"/>
    </form>
<#else>
    <button class="BigButton Font16White uk-text-lowercase uk-button uk-button-secondary">Y</button>
</#if>




</body>
</html>