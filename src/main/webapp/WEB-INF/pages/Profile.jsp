<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ru">
<head>
    <title>Мой профиль – Джинн</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">




    <link href="nouislider.min.css" rel="stylesheet" />



    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


    <link rel="stylesheet" href="https://djinni.co/static/css/inner-styles.css?36">

    <meta property="og:site_name" content="Джинн — анонимный поиск работы">



    


    <link rel="stylesheet" href="https://djinni.co/static/css/jquery.nouislider.css">
    <link rel="stylesheet" href="https://djinni.co/static/css/jquery.nouislider.pips.css">
    
    <style type="text/css">
        div.faq h4 {
            padding-top: 15px;
        }

        .input.salary {
            width: 70px;
        }

        ul.list-unstyled li label {
            display: inline-block;
        }

        p.preview {
            white-space: pre-wrap;
            font-size: 0.9em;
        }

        div.tips li, div.tips p {
            font-size: 0.9em;
        }

        .charsLeft-warn {
            margin-top: 0.75em;
            margin-bottom: 0;
            font-size: 0.9em;
        }
    </style>


    <meta name="google-translate-customization" content="43b319e88d47400c-2c58b02d438c987e-gbc703ae24e1d942c-9">

   
</head>

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



                    <li>
                        <a href="/my/inbox/">
                            Предложения
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
                        <a href="/Profile">
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

            <h1>
                Отправить Джинна на поиски
            </h1>

           

            <ul class="nav nav-pills" style="margin: 1.5em 0 1em;">
                <li class="active"><a href="/Profile">Профиль</a></li>

                <li><a href="/account">Контакты и резюме</a></li>

                <li><a href="/subs">Рассылки</a></li>
                <li><a href="/stop-list">Стоп-лист</a></li>


                <li><a href="/kill">Удалить профиль</a></li>


            </ul>

        </div>
        <div>




        </div>



<c:out value="${show}">${show}</c:out>
<c:if test="${show}">
    <div class="row">
        <div class="col-sm-12">
            <div class="alert alert-success">Профиль обновлен.</div>
        </div>
    </div>
</c:if>



        <form method="post" class="js-profile-form form-horizontal form-horizontal-text-left" action="/profile" accept-charset="UTF-8">
            <div class="row">
                <div class="col-sm-10">

                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="position">Должность</label>
                        <div class="col-sm-7">
                            <input type="text" name="position" autocomplete="off" data-provide="typeahead" id="position" class="form-control" value="${recruit.position}" required>
                        </div>
                    </div>


                    <div class="form-group">

                        <label class="col-sm-3 control-label" for="salary_min">Зарплата не ниже</label>
                        <div class="col-sm-7">
                            <div class="input-group">
                                <div class="input-group-addon">$</div>
                                <input type="number" name="salary_min" id="salary_min" step="100" min="100" required="required" autocomplete="off" class="form-control input salary" value="${recruit.salary}">

                            </div>
                            <p class="help-block">
                                Если не уверены сколько написать, посмотрите
                                <a target="_blank" href="https://djinni.co/salaries/?city=Киев&amp;job=PHP&amp;year=6m">наш виджет зарплат</a> и
                                <a target="_blank" href="/search/?sortby=rating&amp;keywords=PHP">как оценивают себя другие</a>.
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="location">Город</label>
                        <div class="col-sm-7">
                            <input type="text" name="location" id="location" autocomplete="off" data-provide="typeahead" required="required" class="form-control" value="${recruit.city}">
                            <p class="help-block">
                                Город, где вы ищете работу.
                                Например: Киев, Львов.
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="moreinfo">
                            Опыт, навыки

                        </label>

                        <div class="col-sm-7">
                            <textarea rows="9" class="form-control" maxlength="750" name="moreinfo" id="moreinfo">${recruit.expirience}</textarea>

                            <p class="help-block">
                                Напишите главное, не пишите все
                                знакомые аббревиатуры.
                            </p>

                            <p class="charsLeft-warn moreinfo-charsLeft-warn text-warning" style="display:none;">
                                <span class="charsLeftHelp">Осталось символов:</span>
                                <span class="charsLeft moreinfo-charsLeft label label-danger">750</span>
                            </p>
                        </div>
                    </div>




                </div>

            </div>


            <div class="row">
                <div class="col-sm-10">

                    <div class="form-group">
                        <h4 class="col-sm-offset-3 col-sm-7" style="margin-bottom: 0;">Дополнительная информация </h4>
                    </div>

                    <div id="extraquestions">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Опыт работы</label>
<c:set var="work" value="${recruit.workExperience}"/>

                            <c:choose>

                                <c:when test = "${work eq 0}">
                                    <c:set var="help0" value="selected"/>
                                </c:when>

                                <c:when test = "${work eq 0.5}">
                                    <c:set var="help05" value="selected"/>
                                </c:when>

                                <c:when test = "${work == 1}">
                                    <c:set var="help1" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 1.5}">
                                    <c:set var="help15" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 2}">
                                    <c:set var="help2" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 2.5}">
                                    <c:set var="help25" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 3}">
                                    <c:set var="help3" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 3.5}">
                                    <c:set var="help35" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 4}">
                                    <c:set var="help4" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 5}">
                                    <c:set var="help5" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 6}">
                                    <c:set var="help6" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 7}">
                                    <c:set var="help7" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 8}">
                                    <c:set var="help8" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 9}">
                                    <c:set var="help9" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 10}">
                                    <c:set var="help10" value="selected"/>
                                </c:when>
                                <c:when test = "${work eq 11}">
                                    <c:set var="help11" value="selected"/>
                                </c:when>
                            </c:choose>

                            <div class="col-sm-6">
                                <select class="form-control" id="" name="experience">
                                    <option value="0" ${help0}>без опыта</option>
                                    <option value="0.5" ${help05}>меньше года</option>
                                    <option value="1" ${help1}>год</option>
                                    <option value="1.5" ${help15}>1.5 года</option>
                                    <option value="2" ${help2}>2 года</option>
                                    <option value="2.5" ${help25}>2.5 года</option>
                                    <option value="3" ${help3}>3 года</option>
                                    <option value="3.5" ${help35}>3.5 года</option>
                                    <option value="4" ${help4}>4 года</option>
                                    <option value="5" ${help5}>5 лет</option>
                                    <option value="6" ${help6}>6 лет</option>
                                    <option value="7" ${help7}>7 лет</option>
                                    <option value="8" ${help8}>8 лет</option>
                                    <option value="9" ${help9}>9 лет</option>
                                    <option value="10" ${help10}>10 лет</option>
                                    <option value="11" ${help11}>больше 10 лет</option>

                                </select>
                                
                            </div>
                        </div>
                        <c:set var="cat" value="${recruit.category}"/>

                        <c:choose>

                            <c:when test = "${cat eq \"JavaScript\"}">
                                <c:set var="cat0" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Java\"}">
                                <c:set var="cat1" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \".NET\"}">
                                <c:set var="cat2" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"iOS\"}">
                                <c:set var="cat3" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Android\"}">
                                <c:set var="cat4" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Lead\"}">
                                <c:set var="cat5" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Design\"}">
                                <c:set var="cat6" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"PHP\"}">
                                <c:set var="cat7" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Python\"}">
                                <c:set var="cat8" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Ruby\"}">
                                <c:set var="cat9" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"C++\"}">
                                <c:set var="cat10" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Unity\"}">
                                <c:set var="cat11" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"QA\"}">
                                <c:set var="cat12" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"SQL\"}">
                                <c:set var="cat13" value="selected"/>
                            </c:when>
                            <c:when test = "${cat eq \"Other\"}">
                                <c:set var="cat14" value="selected"/>
                            </c:when>
                        </c:choose>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Категория</label>

                            <div class="col-sm-6">
                                <select class="form-control" id="id_primary_keyword_cache" name="primary_keyword_cache">
                                    <option value="JavaScript" ${cat0}>JavaScript</option>
                                    <option value="Java" ${cat1} >Java</option>
                                    <option value=".NET" ${cat2}>.NET</option>
                                    <option value="iOS" ${cat3}>iOS</option>
                                    <option value="Android" ${cat4}>Android</option>
                                    <option value="Lead" ${cat5}>Lead</option>
                                    <option value="Design" ${cat6}>Design</option>
                                    <option value="PHP" ${cat7}>PHP</option>
                                    <option value="Python" ${cat8}>Python</option>
                                    <option value="Ruby" ${cat9}>Ruby</option>
                                    <option value="C++" ${cat10}>C++</option>
                                    <option value="Unity" ${cat11}>Unity</option>
                                    <option value="QA" ${cat12}>QA</option>
                                    <option value="SQL" ${cat13}>SQL</option>
                                    <option value="Other" ${cat14}>Other</option>
                                </select>
                                <p class="help-block">
                                    Чтобы работодателю легче было найти вас в <a href="/developers/">поиске</a>
                                </p>
                            </div>
                        </div>
                        <c:set var="cater" value="${recruit.additionalCategor}"/>

                        <c:choose>

                            <c:when test = "${cater eq \"JavaScript\"}">
                                <c:set var="cater0" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Java\"}">
                                <c:set var="cater1" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \".NET\"}">
                                <c:set var="cater2" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"iOS\"}">
                                <c:set var="cater3" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Android\"}">
                                <c:set var="cater4" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Lead\"}">
                                <c:set var="cater5" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Design\"}">
                                <c:set var="cater6" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"PHP\"}">
                                <c:set var="cater7" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Python\"}">
                                <c:set var="cater8" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Ruby\"}">
                                <c:set var="cater9" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"C++\"}">
                                <c:set var="cater10" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Unity\"}">
                                <c:set var="cater11" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"QA\"}">
                                <c:set var="cater12" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"SQL\"}">
                                <c:set var="cater13" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"Other\"}">
                                <c:set var="cater14" value="selected"/>
                            </c:when>
                            <c:when test = "${cater eq \"\"}">
                                <c:set var="cater15" value="selected"/>
                            </c:when>
                        </c:choose>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Дополнительная категория</label>

                            <div class="col-sm-6">
                                <select class="form-control" id="id_secondary_keyword" name="secondary_keyword">
                                    <option value="" ${cater15}></option>
                                    <option value="JavaScript" ${cater0}>JavaScript</option>
                                    <option value="Java" ${cater1} >Java</option>
                                    <option value=".NET" ${cater2}>.NET</option>
                                    <option value="iOS" ${cater3}>iOS</option>
                                    <option value="Android" ${cater4}>Android</option>
                                    <option value="Lead" ${cater5}>Lead</option>
                                    <option value="Design" ${cater6}>Design</option>
                                    <option value="PHP" ${cater7}>PHP</option>
                                    <option value="Python" ${cater8}>Python</option>
                                    <option value="Ruby" ${cater9}>Ruby</option>
                                    <option value="C++" ${cater10}>C++</option>
                                    <option value="Unity" ${cater11}>Unity</option>
                                    <option value="QA" ${cater12}>QA</option>
                                    <option value="SQL" ${cater13}>SQL</option>
                                    <option value="Other" ${cater14}>Other</option>
                                </select>
                                <p class="help-block">
                                    Для особых случаев, например .NET + Lead.
                                </p>
                            </div>
                        </div>
                        <c:set var="cate" value="${recruit.english}"/>

                        <c:choose>

                            <c:when test = "${cate eq 0}">
                                <c:set var="cate0" value="checked"/>
                            </c:when>
                            <c:when test = "${cate eq 1}">
                                <c:set var="cate1" value="checked"/>
                            </c:when>
                            <c:when test = "${cate eq 2}">
                                <c:set var="cate2" value="checked"/>
                            </c:when>
                            <c:when test = "${cate eq 3}">
                                <c:set var="cate3" value="checked"/>
                            </c:when>
                            <c:when test = "${cate eq 4}">
                                <c:set var="cate4" value="checked"/>
                            </c:when>

                        </c:choose>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Уровень английского языка</label>

                            <div class="col-sm-7">

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="english_level" value="0" ${cate0}>
                                        Нет английского
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="english_level" value="1"  ${cate1}>
                                        Слабый английский (Pre-Intermediate)
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="english_level" value="2"  ${cate2}>
                                        На уровне чтения тех. документации (Intermediate)
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="english_level" value="3" ${cate3}>
                                        Пишу и говорю, хоть и с ошибками (Upper Intermediate)
                                    </label>
                                </div>

                                <div class="radio">
                                    <label>
                                        <input type="radio" name="english_level" value="4" ${cate4}>
                                        Свободный английский (Advanced/Fluent)
                                    </label>
                                </div>

                            </div>

                        </div>

                        <div class="form-group">

                            <label class="col-sm-3 control-label">
                                Варианты

                            </label>

                            <div class="col-sm-7">


                                <c:if test="${recruit.workInOffice}" >
                                    <c:set var="full" value="checked"/>
                                </c:if>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="employment_options" value="fulltime" ${full} >
                                        Работа на полный день в офисе
                                    </label>
                                </div>
                                <c:if test="${recruit.remoteWork}" >
                                    <c:set var="remote" value="checked"/>
                                </c:if>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="employment_options" value="remote" ${remote}>
                                        Удаленная работа (полный день)
                                    </label>
                                </div>
                                <c:if test="${recruit.freelance}" >
                                    <c:set var="freelance" value="checked"/>
                                </c:if>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="employment_options" value="freelance" ${freelance}>
                                        Фриланс (разовые проекты)
                                    </label>
                                </div>
                                <c:if test="${recruit.removal}" >
                                    <c:set var="removal" value="checked"/>
                                </c:if>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="employment_options" value="move" ${removal}>
                                        Переезд в другой город
                                        Украины

                                    </label>
                                </div>
                                <c:if test="${recruit.relocate}" >
                                    <c:set var="relocate" value="checked"/>
                                </c:if>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="employment_options" value="relocate" ${relocate}>
                                        Relocate в США или Европу (<a target="_blank" href="http://lurkmore.to/%D0%9F%D0%BE%D1%80%D0%BE%D1%81%D1%91%D0%BD%D0%BE%D0%BA_%D0%9F%D1%91%D1%82%D1%80#.D0.A1.D1.80.D0.B0.D0.BD.D1.8B.D0.B9_.D1.82.D1.80.D0.B0.D0.BA.D1.82.D0.BE.D1.80">трактор</a>)
                                    </label>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <h4 class="col-sm-offset-3 col-sm-7">Ищете что-то особенное?</h4>



                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="looking_for">Ожидания от работы</label>

                            <div class="col-sm-7">
                                <textarea rows="5" class="input form-control" maxlength="750" name="looking_for" id="looking_for">${recruit.expectations}</textarea>

                                <p class="help-block">
                                    Если знаете, чем точно НЕ хотите
                                    заниматься, напишите и об этом.
                                </p>

                                <p class="charsLeft-warn looking_for-charsLeft-warn text-warning" style="display:none;">
                                    <span class="charsLeftHelp">Осталось символов:</span>
                                    <span class="charsLeft looking_for-charsLeft label label-danger">750</span>
                                </p>
                            </div>
                        </div>

                        <br>

                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="highlights">Достижения</label>
                            <div class="col-sm-7">
                                <textarea rows="5" class="input form-control" maxlength="750" name="highlights" id="highlights">${recruit.achievement}</textarea>

                                <p class="help-block">
                                    Чем конкретнее, тем лучше. Для
                                    интересных предложений must have.
                                </p>

                                <p class="charsLeft-warn highlights-charsLeft-warn text-warning" style="display:none;">
                                    <span class="charsLeftHelp">Осталось символов:</span>
                                    <span class="charsLeft highlights-charsLeft label label-danger">750</span>
                                </p>
                            </div>
                        </div>
                        <br>
                    </div>

                </div>





            </div>



            <div class="row">
                <div class="col-sm-10">
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-10">
                            
                            <input type="submit" class="btn btn-primary btn-lg form_btn" value="Опубликовать сейчас">

                            <button type="submit" class="btn btn-link form_btn" name="save_only">

                                Сохранить изменения,<br>но профиль не
                                публиковать
                            </button>

                        </div>
                    </div>

                    <br>

                    <div class="form-group">

                        <div class="col-sm-offset-3 col-sm-7 help-block">
                            <h5>ПОДСКАЗКИ ДЖИННА</h5>
                            <ol>
                                <li>
                                    Хотите интересных предложений? Заинтересуйте.
                                    Лучшие работодатели
                                    переборчивы в контактах и не реагируют на
                                    «шаблонные» профили.
                                </li>
                                <li>
                                    Если вы джуниор, обязательно опишите свой опыт работы. Пусть даже
                                    это учебный или тестовый проект.
                                </li>
                                <li>Примеры хорошо заполненых профилей <a href="/developers/?sortby=rating">смотрите здесь</a>.</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>

        </form>

        <script>
      /*$(document).ready(function(){
        if($('.js-profile-form').length) {
          $('.js-profile-form').data('serialize',$('.js-profile-form').serialize());

          $(window).on('beforeunload', function(e){
              if($('.js-profile-form').serialize() != $('.js-profile-form').data('serialize')) return 'В форме есть несохраненные данные.';
              else e=null;
          });

          $('.js-profile-form').submit(function() {
              $(window).off('beforeunload');
          });
        }
      });*/
        </script>





        <form id="onoff_form" method="post" action="/my/stop/">
            <input type="hidden" name="onoff_value" id="onoff_value">
            <input type="hidden" name="csrfmiddlewaretoken" value="myNV3ZyUIcztTiV6743lv8yKNdNd8Pe9">
        </form>

    </div>
    <script src="nouislider.min.js"></script>
    <script src="JavaScript.js"></script>
    <script src="https://djinni.co/static/js/number-polyfill.min.js"></script>

    <script type="text/javascript">
$(document).ready(function() {
    $('body').on('keypress', 'input, textarea', function(e){
      window.onbeforeunload = promtSave;
    });
    $('body').on('click', 'input', function(e){
      if(($(e.target).attr('type') == 'checkbox' ||
              $(e.target).attr('type') == 'radio' ||
              $(e.target).attr('type') == 'number')){
        window.onbeforeunload = promtSave;
      }
    });

    $('body').on('click', '.form_btn', function(){
      window.onbeforeunload = null;
      return true;
    });

    function promtSave(evt){
      var message = "Любые изменения будут потеряны";
      if (typeof evt == "undefined") {
          evt = window.event;
      }
      if (evt) {
          evt.returnValue = message;
      }
      return message;
    }


    var experienceValues = {
      0: 'нет опыта работы',
      1: 'меньше года',
      2: '1 год',
      3: '1,5 года',
      4: '2 года',
      5: '2,5 года',
      6: '3 года',
      7: '4 года',
      8: '5 лет',
      9: '6 лет',
      10: '7 лет',
      11: '8 лет',
      12: '9 лет',
      13: '10 лет',
      14: 'больше 10 лет'
    }

    var startVal = parseInt(0);
    $('.experience-slider-value').html(experienceValues[startVal]);
    

    $('.experience-slider').noUiSlider({
        start: startVal,
        connect:true,
      range: {
        'min': [0],
        'max': [14]
      },
      step: 1,
    });

    $('.experience-slider').noUiSlider_pips({
      mode: 'steps',
      density: 14
    });

    $('.experience-slider').on({
      slide: function() {
        var val = parseInt($('.experience-slider-input').val());
        $('.experience-slider-value').html(experienceValues[val]);

      }
    })

    $('.experience-slider').Link('lower').to($('.experience-slider-input'));

    //$('[rel="tooltip"]').tooltip();

    var positions = ["\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a PHP", "QA Engineer", "Front-End Developer", "Java Developer", "Junior QA Engineer", "Project Manager", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a java", "junior java developer", "Junior Front-end Developer", "Android Developer", "PHP Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a JavaScript", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a C++", "JavaScript Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a C#", "iOS Developer", ".NET Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a .NET", "UI/UX Designer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Python", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Android", "\u0421\u0438\u0441\u0442\u0435\u043c\u043d\u044b\u0439 \u0430\u0434\u043c\u0438\u043d\u0438\u0441\u0442\u0440\u0430\u0442\u043e\u0440", "Business analyst", "Web Developer", "Junior QA", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a iOS", "Python Developer", "Junior PHP Developer", "Frontend Developer", "Junior .Net Developer", "QA Automation Engineer", "Ruby on Rails Developer", "\u0412\u0435\u0440\u0441\u0442\u0430\u043b\u044c\u0449\u0438\u043a", "Senior Java Developer", "Junior Android Developer", "\u041f\u0440\u043e\u0433\u0440\u0430\u043c\u043c\u0438\u0441\u0442", "Automation QA Engineer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Ruby on Rails", "Senior QA Engineer", "\u0422\u0435\u0441\u0442\u0438\u0440\u043e\u0432\u0449\u0438\u043a", "Junior Python Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Python/Django", "DevOps engineer", "Junior JavaScript developer", "System administrator", "Senior PHP Developer", "Product manager", "Junior C++ Developer", "Junior Project Manager", "C++ Developer", "Software Engineer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a HTML", "web designer", "Senior .Net Developer", "Middle PHP Developer", "Junior C# Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Ruby", "Unity3D Developer", "Junior iOs Developer", "Middle Java developer", "\u0414\u0438\u0437\u0430\u0439\u043d\u0435\u0440", "Full Stack Web Developer", "Python/Django developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Unity3d", "QA", "Middle QA Engineer", "c# developer", "Front End Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a ASP.NET MVC", "DevOps", "Java Software Engineer", "HR", "Junior Ruby on Rails developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a", "Web \u0440\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a", "Senior Software Engineer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a PHP, Javascript", "Full stack developer", "Middle .Net Developer", "IT Recruiter", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a ASP.NET", "Software Developer", "C/C++ developer", "\u0412\u0435\u0431-\u0440\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a", "Data scientist", "Senior iOS developer", "Java Trainee", "Team Lead", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a C/C++", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Linux", "Ruby Developer", "Senior Android Developer", "QA Lead", "Junior Developer", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a oracle", "\u0420\u0430\u0437\u0440\u0430\u0431\u043e\u0442\u0447\u0438\u043a Delphi", "Developer", "Sales Manager", "Manual QA Engineer", "Senior C++ Developer"];
    $('#position').typeahead({source: positions});
    var abbreviate = function(name) {
      var parts = name.split(" ", 2);
      if (parts.length == 2) {
        name = parts[0] + " " + parts[1][0] + ".";
      }
      return name;
    }
    $('#location').typeahead({source: ["\u041c\u0438\u043d\u0441\u043a", "\u041c\u043e\u0441\u043a\u0432\u0430", "\u0421\u0430\u043d\u043a\u0442 \u041f\u0435\u0442\u0435\u0440\u0431\u0443\u0440\u0433", "\u0412\u043e\u0440\u043e\u043d\u0435\u0436", "\u0415\u043a\u0430\u0442\u0435\u0440\u0438\u043d\u0431\u0443\u0440\u0433", "\u041a\u0430\u0437\u0430\u043d\u044c", "\u041a\u0430\u043b\u0438\u043d\u0438\u043d\u0433\u0440\u0430\u0434", "\u041a\u0440\u0430\u0441\u043d\u043e\u0434\u0430\u0440", "\u041a\u0440\u0430\u0441\u043d\u043e\u044f\u0440\u0441\u043a", "\u041d\u0438\u0436\u043d\u0438\u0439 \u041d\u043e\u0432\u0433\u043e\u0440\u043e\u0434", "\u041d\u043e\u0432\u043e\u0441\u0438\u0431\u0438\u0440\u0441\u043a", "\u041e\u043c\u0441\u043a", "\u041f\u0435\u0440\u043c\u044c", "\u0420\u043e\u0441\u0442\u043e\u0432-\u043d\u0430-\u0414\u043e\u043d\u0443", "\u0421\u0430\u043c\u0430\u0440\u0430", "\u0422\u043e\u043c\u0441\u043a", "\u0423\u043b\u044c\u044f\u043d\u043e\u0432\u0441\u043a", "\u0423\u0444\u0430", "\u0427\u0435\u043b\u044f\u0431\u0438\u043d\u0441\u043a", "\u041a\u0438\u0435\u0432", "\u0412\u0438\u043d\u043d\u0438\u0446\u0430", "\u0414\u043d\u0435\u043f\u0440\u043e\u043f\u0435\u0442\u0440\u043e\u0432\u0441\u043a", "\u0418\u0432\u0430\u043d\u043e-\u0424\u0440\u0430\u043d\u043a\u043e\u0432\u0441\u043a", "\u0416\u0438\u0442\u043e\u043c\u0438\u0440", "\u0417\u0430\u043f\u043e\u0440\u043e\u0436\u044c\u0435", "\u041b\u044c\u0432\u043e\u0432", "\u041d\u0438\u043a\u043e\u043b\u0430\u0435\u0432", "\u041e\u0434\u0435\u0441\u0441\u0430", "\u0425\u0430\u0440\u044c\u043a\u043e\u0432", "\u0427\u0435\u0440\u043a\u0430\u0441\u0441\u044b", "\u0427\u0435\u0440\u043d\u043e\u0432\u0446\u044b", "\u0427\u0435\u0440\u043d\u0438\u0433\u043e\u0432", "\u0425\u043c\u0435\u043b\u044c\u043d\u0438\u0446\u043a\u0438\u0439"]});
    $('#extraheader').click(function(){
      $("#extraquestions").show();
      $("#extraqsidebar").show();
      $("#extraheader").hide();
      return true;
    });

    charlim = function (name, counter, warning_limit) {
      $(name).on("change keyup", function () {
        var limit = $(name).attr('maxlength');
        if (limit) {
          if(typeof warning_limit == "undefined"){
            var warning_limit = (limit -0) * 0.9;
          }else{
            warning_limit -= 0; //Convert to int
          }
          if ($(name).val().length > warning_limit) {
            $(counter + '-warn').slideDown('fast');
            $(counter).text(($(name).attr('maxlength') - $(name).val().length));
          } else {
            $(counter + '-warn').slideUp();
          }
        }
      });
    }

    charlim('#moreinfo', '.moreinfo-charsLeft', 700);
    charlim('#looking_for', '.looking_for-charsLeft', 700);
    charlim('#highlights', '.highlights-charsLeft', 700);

    // $("#position").on("change keyup", function() {
    //   $("#position-preview").html($(this).val());
    // });
    // $("#salary_min").on("change keyup", function() {
    //   $("#salary-preview").html($(this).val());
    // });
    // $("#location").on("change keyup", function() {
    //   $("#location-preview").html($(this).val());
    // });
    // $("#looking_for").on("change keyup", function() {
    //   $("#looking_for-preview").text($(this).val());
    // });
    // $("#highlights").on("change keyup", function() {
    //   $("#highlights-preview").text($(this).val());
    // });

    // $("#position-preview").html($("#position").val());
    // $("#salary-preview").html($("#salary_min").val());
    // $("#location-preview").html($("#location").val());
    // $("#moreinfo-preview").html($("#moreinfo").val());
    $("#extraheader").hide();
    $("#extraqsidebar").show();

});
    </script>







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

                · <a class="text-warning&quot;" href="/account_select/">Вы работодатель?</a>

                <br>
            </p>
            <p></p>













        </div>
    </div>



    <!--<script src="/static/js/bootstrap.min.js"></script>-->
    
    <script src="https://djinni.co/static/js/bootstrap3-typeahead.min.js"></script>
    <script src="https://djinni.co/static/js/inner-script.js?2"></script>



    <script>
      $(function(){

        var page = $('.feedback-page').val();
        var like = $('.feedback-like');
        var dislike = $('.feedback-dislike');
        var val;
        var bothInactive = false;

        if((!like.hasClass('active') && !dislike.hasClass('active'))) {
          bothInactive = true;
        }

        $('.feedback-box').on('click', '.feedback-like', function() {

          if(bothInactive || dislike.hasClass('active')) {
            like.addClass('active');
            dislike.removeClass('active');
            val = 'like';
            sendFeedback();
            bothInactive = false;
          }

          else {
            resetFeedback();
          }

          return false;
        });


        $('.feedback-box').on('click', '.feedback-dislike', function() {

          if(bothInactive || like.hasClass('active')) {
            dislike.addClass('active');
            like.removeClass('active');
            val = 'dislike';
            sendFeedback();
            bothInactive = false;
          }

          else {
            resetFeedback();
          }

          return false;
        });

        function sendFeedback() {
          $.post("/user_feedback", {
            feedback: val,
            page: page,
            csrfmiddlewaretoken: 'myNV3ZyUIcztTiV6743lv8yKNdNd8Pe9'
            },
            function(data, status){
          });
        }

        function resetFeedback() {
          bothInactive = true;
          like.removeClass('active');
          dislike.removeClass('active');
          val = 'reset';
          sendFeedback();
        }
      });
    </script>









   

    




    
  
</body>
</html>
