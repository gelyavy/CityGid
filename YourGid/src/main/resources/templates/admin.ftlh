<!DOCTYPE html>
<html>
<head>
    <title>CITYGID</title>
</head>
<body>
    <nav class="BackWhite uk-navbar-container uk-padding uk-padding-remove-bottom uk-padding-remove-top uk-padding-remove-left uk-background-default" uk-navbar>
        <div class="uk-navbar-left uk-margin-left">
            <a href="/" class="uk-navbar-item uk-logo"><img src="/static/images/Логотип.png" height="50px" width="160px" alt="NAME"></a>
        </div>
    </nav>
    <h4>Панель администратора</h4>
    <div class="uk-section uk-section-muted">
            <div class="uk-child-width-1-3@xl uk-child-width-1-2@m uk-child-width-1-1@s uk-child-width-1-1 uk-grid-small uk-grid-match" uk-grid>
                <div>
                  <h1>Добавить карточку</h1>
                  <form action="/place/create" method="post" enctype="multipart/form-data">
                                            Название места: <input type="text" name="title"/><br><br>
                                            Описание места: <input type="text" name="description"/><br><br>
                                            Цена места: <input type="number" name="price"/><br><br>
                                            Город места: <input type="text" name="city"/><br><br>
                                            Владелец места: <input type="text" name="owner"/><br><br>
                                            Первая фотография: <input type="file" name="file1"/><br><br>
                                            Вторая фотография: <input type="file" name="file2"/><br><br>
                                            Третья фотография: <input type="file" name="file3"/><br><br>
                                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                                            <input type="submit" value="Добавить место" />
                  </form>
                </div>
                <div>
                    <table border="1">
                        <tr>
                            <th>Email</th>
                            <th>Номер телефона</th>
                            <th>Активность</th>
                            <th>Роль</th>
                            <th>Бан</th>
                            <th>Редактировать</th>
                        </tr>
                        <#list users as user>
                            <tr>
                                <th>${user.email}</th>
                                <th>${user.phoneNumber}</th>
                                <th><#if user.active>true<#else>false</#if></th>
                                <th><#list user.roles as role>${role}</#list></th>
                                <th>
                                    <form action="admin/user/ban/${user.id}" method="post">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" value="BAN">
                                    </form>
                                </th>
                                <th>
                                     <form action="admin/user/delete/${user.id}" method="post">
                                         <input type="hidden" name="_csrf" value="${_csrf.token}">
                                         <input type="submit" value="DELETE">
                                     </form>
                                </th>
                                <th><a href="/admin/user/edit/${user.id}">Редактировать</a></th>
                            </tr>
                            <#else>
                            <h3>Пользователей нет</h3>
                        </#list>
                    </table>
                </div>

</body>
</html>