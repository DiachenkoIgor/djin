<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ru"><head>
    <title>Мой аккаунт – diachenko.ig@yandex.ru – Джинн</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">







 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


    <link rel="stylesheet" href="https://djinni.co/static/css/inner-styles.css?36">

    <meta property="og:site_name" content="Джинн — анонимный поиск работы">






    <link rel="stylesheet" href="/static/css/ladda-themeless.min.css">
    <style>
        #choose_file[disabled] {
            cursor: default;
        }
    </style>

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

            <li class="active"><a href="/account">Контакты и резюме</a></li>
            <li><a href="/subs">Рассылки</a></li>
            <li><a href="/stop-list">Стоп-лист</a></li>


            <li><a href="/kill">Удалить профиль</a></li>


        </ul>

    </div>



    <form class="form-horizontal form-horizontal-text-left js-account-form" method="post" enctype="multipart/form-data" id="contact-dropzone " action="/updateAcc">
        <div class="row">
            <div class="col-sm-10">

                <div class="row">
                    <div class="col-sm-10">
                        <p class="lead">Поиск работы на Джинне анонимен. Ваши персональные данные увидят только те, кому вы решите открыть контакты.</p>
                        <br>
                    </div>
                </div>







                <div class="form-group">

                    <label class="col-sm-3 control-label" for="name">Имя и фамилия</label>

                    <div class="col-sm-7">
                        <input type="text" name="name" id="name" class="form-control" value="${recruit.name}" required>
                        <p class="help-block">
                            Полное имя, пожалуйста. Не надо писать Слава С.
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">Фотография</label>

                    <div class="col-sm-7">
                        <c:set var="photo" value="${recruit.photo}"/>
                        <c:if test="${photo eq null}">

                        <div id="pic_block">

                            <img src="https://djinni.co/static/i/default-userpic@2x.png" class="settings-photo" style="height: 100px; width: 100px;">
                            <input type="file" accept="image/jpeg,image/png"  name="photo" id="inbox-profile-photo" >
                        </div>
                        </c:if>
                        <c:if test="${photo ne null}">
                            <div id="pic_block">

                                <img src="/recPhoto/${recruit.id}" class="settings-photo" style="height: 100px; width: 100px;">
                                <input type="file" accept="image/jpeg,image/png"  name="photo" id="inbox-profile-photo" >
                            </div>
                        </c:if>


                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="email">Почта</label>

                    <div class="col-sm-7">
                        <input disabled value="${recruit.email}" type="text" name="email" id="email" class="form-control">
                        <p class="help-block">
                            Адрес эл.&nbsp;почты нам дает Google, поэтому изменить его нельзя
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="skype">Skype</label>

                    <div class="col-sm-7">
                        <input type="text" name="skype" id="skype" class="form-control" value="${recruit.skype}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="phone">Моб. телефон</label>

                    <div class="col-sm-7">
                        <input type="tel" name="phone" id="phone" class="form-control" value="${recruit.number}">
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-3 control-label" for="linkedin">LinkedIn-профиль</label>

                    <div class="col-sm-7">
                        <input type="text" name="linkedin" id="linkedin" class="form-control" value="${LinkedIn}">

                        <p class="help-block">
                            Полный URL, например: <a href="http://www.linkedin.com/in/linustorvalds" target="_blank">http://www.linkedin.com/in/linustorvalds</a>
                        </p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label" for="github">GitHub-профиль</label>

                    <div class="col-sm-7">
                        <input type="text" name="github" id="github" class="form-control" value="${recruit.gitHub}">

                        <p class="help-block">
                            Полный URL, например: <a href="https://github.com/torvalds" target="_blank">https://github.com/torvalds</a>
                        </p>
                    </div>
                </div>

                <a name="cv"></a>
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="github">Резюме</label>

                    <div class="col-sm-7" style="margin-top: 7px; margin-bottom: 20px;">


                        <c:if test="${recruit.resume ne null}">
                            <c:set var="sho"  value=""/>
                        </c:if>

                        <input type="file" class="js-cv-input" name="cv" id="inbox-contact-cv">
                        <span class="js-cv-status" style="display: ${sho}">${recruit.cvName}</span>
                        <a href="#" class="js-cv-remove-link close inline-close" style="display: none;">×</a>


                        <input type="hidden" class="js-cv-filename" name="cvName">
                        <input type="hidden" class="js-cv-url" name="cv_url">
                    </div>
                </div>

                <input type="hidden" name="csrfmiddlewaretoken" value="ngGGgXKPRBgNwWSDAPAMLE3wffmWJJIp">

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-offset-3 col-sm-7">
                            <input type="submit" name="save_changes" class="btn btn-primary btn-lg form_btn" value="Сохранить изменения">
                        </div>

                    </div>
                </div>



            </div>
        </div>
    </form>


    <div class="modal" id="uploadModal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">Загрузка фотографии</h4>
                </div>
                <div class="modal-body">
                    <p>
                        <button id="choose_file" class="btn btn-primary btn-lg ladda-button" data-style="expand-left"><span class="ladda-label">Выбрать файл</span><span class="ladda-spinner"></span></button>
                    </p>

                    <p class="help-block" style="max-width: 320px;">
                        <small>Джинн рекомендует загружать фотографии размером не меньше 200×200 пикселей.</small>
                    </p>


                </div>
            </div>
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



<script src="//assets.transloadit.com/js/jquery.transloadit2-v2-latest.js"></script>
<script>
    $(function(){
        $('.js-cv-input').on('change', function(){
            if ($(this).val()) {
                $('.js-account-form').transloadit({
                    wait: true,
                    autoSubmit: false,
                    modal: false,
                    triggerUploadOnFileSelection: true,

                    onFileSelect: function(e) {
                        var input = $('.js-cv-input');
                        var filename = input.val().replace(/^.*\\/, "");
                        input.hide();
                        $('.js-cv-filename').val(filename);
                        $('.js-cv-status').show().html('<img src="https://djinni.co/static/i/spinner.gif"> Загрузка...').addClass('text-muted');
                    },

                    onSuccess: function(result){
                        var filename = $('.js-cv-filename').val();
                        var url = result['results'][':original'][0]['url'];
                        $('.js-cv-url').val(url);
                        $('.js-cv-status').show().html('<a href=' + url + ' target="_blank">' + filename + '</a>').removeClass('text-muted');

                        $('.js-cv-remove-link').show();
                        $('.js-account-form').unbind('submit.transloadit');

                        Intercom('trackEvent', 'CV upload');
                    },

                    params: {
                        auth: { key: "70b3fdb085d111e3b3e3a539a6199a02" },
                        template_id: "a56bc880868a11e3b08b6f8923cff007",
                        shortcode: "00c07350"
                    }
                });

            }
        });

        if($('.js-cv-remove-link').length) {
            $('body').on('click', '.js-cv-remove-link', function(){

                $('.js-cv-input').show();
                $('.js-cv-status').hide();
                $('.js-cv-url').val('(hidden)');
                $('.js-cv-filename').val('');

                $(this).hide();
                return false;
            });
        }
    });
</script>
<script src="https://djinni.co/static/js/spin.min.js"></script>
<script src="https://djinni.co/static/js/ladda.min.js"></script>
<script src="https://djinni.co/static/js/ladda.jquery.min.js"></script>

<script>
    $(document).ready(function(){
        $('body').on('keypress change', 'input, textarea', function(e){
            window.onbeforeunload = promtSave;
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
    });




</script>









<iframe id="intercom-frame" style="display: none;"></iframe><div id="intercom-container" style="position: fixed; width: 0px; height: 0px; bottom: 0px; right: 0px; z-index: 2147483647;"><div data-reactroot="" class="intercom-app"><span></span><span></span><!-- react-empty: 4 --><span></span><!-- react-empty: 6 --></div></div></body></html>