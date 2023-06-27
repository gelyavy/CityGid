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
                  <h1>Добавить place</h1>
                  <form action="/place/create" method="post" enctype="multipart/form-data">
                    Название: <input type="text" name="title"/><br><br>
                    Тип: <input type="text" name="type"/><br><br>
                    Район: <input type="text" name="area"/><br><br>
                    Адрес: <input type="text" name="address"/><br><br>
                    Описание: <input type="text" name="description"/><br><br>
                    Первая фотография: <input type="file" name="file1"/><br><br>
                    Вторая фотография: <input type="file" name="file2"/><br><br>
                    Третья фотография: <input type="file" name="file3"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Добавить" />
                  </form>
                </div><br><br>

                <div>
                  <h1>Добавить event</h1>
                  <form action="/event/create" method="post" enctype="multipart/form-data">
                    Название: <input type="text" name="title"/><br><br>
                    Тип: <input type="text" name="type"/><br><br>
                    Адрес: <input type="text" name="address"/><br><br>
                    Дата: <input type="text" name="date"/><br><br>
                    Описание: <input type="text" name="description"/><br><br>
                    Первая фотография: <input type="file" name="file1"/><br><br>
                    Вторая фотография: <input type="file" name="file2"/><br><br>
                    Третья фотография: <input type="file" name="file3"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Добавить" />
                  </form>
                </div><br><br>

                <div>
                  <h1>Добавить статью</h1>
                  <form action="/article/create" method="post" enctype="multipart/form-data">
                    Название: <input type="text" name="title"/><br><br>
                    Тип: <input type="text" name="number"/><br><br>
                    Дата: <input type="text" name="date"/><br><br>
                    Описание: <textarea class="uk-textarea" rows="10" name="description"></textarea><br><br>
                    Фотография: <input type="file" name="file1"/><br><br>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Добавить" />
                  </form>
                </div><br><br>

                <div>
                    <table border="1">
                        <tr>
                            <th>Login</th>
                            <th>Имя</th>
                            <th>Активность</th>
                            <th>Роль</th>
                            <th>Бан</th>
                            <th>Редактировать</th>
                        </tr>
                        <#list users as user>
                            <tr>
                                <th>${user.login}</th>
                                <th>${user.name}</th>
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
            </div><br><br>

                <div>
                    <table border="2">
                        <tr>
                            <th>Название</th>
                            <th>Тип</th>
                            <th>Район</th>
                            <th>Редактировать</th>
                        </tr>
                        <#list places as place>
                            <tr>
                                <th>${place.title}</th>
                                <th>${place.type}</th>
                                <th>${place.area}</th>
                                <th>
                                     <form action="/admin/place/delete/${place.id}" method="post">
                                         <input type="hidden" name="_csrf" value="${_csrf.token}">
                                         <input type="submit" value="DELETE">
                                     </form>
                                </th>
                            </tr>
                            <#else>
                            <h3>мест нет</h3>
                        </#list>
                    </table>
                </div><br><br>

                <div>
                    <table border="2">
                        <tr>
                            <th>Название</th>
                            <th>Тип</th>
                            <th>Район</th>
                            <th>Редактировать</th>
                        </tr>
                        <#list events as event>
                            <tr>
                                <th>${event.title}</th>
                                <th>${event.type}</th>
                                <th>${event.address}</th>
                                <th>
                                     <form action="/admin/event/delete/${event.id}" method="post">
                                         <input type="hidden" name="_csrf" value="${_csrf.token}">
                                         <input type="submit" value="DELETE">
                                     </form>
                                </th>
                            </tr>
                            <#else>
                            <h3>ивентов нет</h3>
                        </#list>
                    </table>
                </div><br><br>

                <div>
                    <table border="2">
                        <tr>
                            <th>Номер</th>
                            <th>Название</th>
                            <th>Дата</th>
                            <th>Редактировать</th>
                        </tr>
                        <#list articles as article>
                            <tr>
                                <th>${article.number}</th>
                                <th>${article.title}</th>
                                <th>${article.date}</th>
                                <th>
                                     <form action="/admin/article/delete/${article.id}" method="post">
                                         <input type="hidden" name="_csrf" value="${_csrf.token}">
                                         <input type="submit" value="DELETE">
                                     </form>
                                </th>
                            </tr>
                            <#else>
                            <h3>статей нет</h3>
                        </#list>
                    </table>
                </div><br><br>
    </div>
</body>
</html>