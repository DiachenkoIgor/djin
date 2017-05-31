<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ru"><head>
    <title>Управление рассылками Джинна</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">







   <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


    <link rel="stylesheet" href="https://djinni.co/static/css/inner-styles.css?36">

    <meta property="og:site_name" content="Джинн — анонимный поиск работы">






    <meta name="google-translate-customization" content="43b319e88d47400c-2c58b02d438c987e-gbc703ae24e1d942c-9">

<body>



<nav class="navbar navbar-default" role="navigation">
    <div class="container">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

            </button>

            <a class="navbar-brand" href="/">Джинн</a>

        </div>

        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">



                <li><a href="/my/inbox/">Предложения
                </a>
                </li>


                <li><a href="/recruiters/">Работодатели</a></li>


                <li><a href="/jobs/">Вакансии</a></li>



            </ul>


            <c:set var="publ" value="${recruit.isPublished}"/>
            <c:set var="publish" value="Не опубликовано"/>
            <c:if test="${publ}">
                <c:set var="publish" value="Опубликовано"/>
            </c:if>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/my/profile/Profile.jsp">
                        Мой профиль

                        <span class="label label-danger">${publish}</span>


                    </a>
                </li>
            </ul>


        </div> <!-- /navbar-collapse -->

    </div> <!-- /.container -->
</nav>











<div class="container">

    <div class="page-header">

        <h1>Мой аккаунт
        </h1>


        <ul class="nav nav-pills" style="margin: 1.5em 0 1em;">
            <li><a href="/Profile">Профиль</a></li>

            <li><a href="/account">Контакты и резюме</a></li>
            <li class="active"><a href="/subs">Рассылки</a></li>
            <li><a href="/stop-list">Стоп-лист</a></li>


            <li><a href="/kill">Удалить профиль</a></li>


        </ul>

    </div>

    <div class="row">
        <div class="col-sm-8">

<c:if test="${recruit.isDistribution}">
    <c:set var="show" value="checked"/>
</c:if>


            <form method="post" class="form" action="/subss">
                <div class="row">
                    <div class="col-sm-10">
                        <h4>Рассылка с вакансиями</h4>

                        <div class="form-group">


                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="jobs_push" value="Yes" ${show}>
                                    Присылать новые вакансии по моему профилю (если профиль онлайн)
                                </label>
                            </div>

                        </div>

                    </div>
                </div>
                <br>


                <input type="submit" class="btn btn-primary" name="submit" value="Сохранить изменения">
            </form>
            <br>
        </div>
    </div>

</div>





<br>
<div class="footer">
    <div class="container">
        <p>
            <strong style="color: #999;">
                <span class="glyphicon glyphicon-send"></span>&nbsp; <a style="color: #444;" href="mailto:magic@djinni.co">magic@djinni.co</a>
            </strong>
        </p>

        <p>

            <a href="/Profile">Мой профиль</a> ·
            <a href="/account">Настройки</a> ·
            <a href="/exit">Выйти из аккаунта</a>

            <br>
        </p>
        <p></p>













    </div>
</div>



<!--<script src="/static/js/bootstrap.min.js"></script>-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://djinni.co/static/js/bootstrap3-typeahead.min.js"></script>
<script src="https://djinni.co/static/js/inner-script.js?2"></script>



<iframe id="intercom-frame" style="display: none;"></iframe><div id="intercom-container" style="position: fixed; width: 0px; height: 0px; bottom: 0px; right: 0px; z-index: 2147483647;"><div data-reactroot="" class="intercom-app"><span></span><span></span><!-- react-empty: 4 --><span></span><!-- react-empty: 6 --></div></div></body></html>
