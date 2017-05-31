
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ru"><head>
    <title>

        Вход

    </title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">







<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


    <link rel="stylesheet" href="https://djinni.co/static/css/inner-styles.css?36">

    <meta property="og:site_name" content="Джинн — анонимный поиск работы">






    <meta name="google-translate-customization" content="43b319e88d47400c-2c58b02d438c987e-gbc703ae24e1d942c-9">


<body>

<nav class="nav navbar navbar-default" role="navigation">
    <div class="container">

        <div class="navbar-header " style="float: left;">
            <a href="/" class="navbar-brand">djinni.co</a>
        </div>

    </div> <!-- ./container -->
</nav>











<div class="container">
    <div class="row">
        <div class="col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2 loginpage-wrapper">


            <div class="page-header">
                <h1>

                    Вход на Джинн

                </h1>
            </div>

            <div class="row">

                <div class="col-sm-6 col-login-email">

                    <form method="post" action="/entry">
                        <div class="form-group">
                            <input class="form-control" type="email" name="email" id="email" placeholder="email" value="" required="">


                        </div>

                        <p style="color: red">${sentence}</p>
                        <div class="form-group">
                            <input class="form-control" type="password" name="password" id="password" placeholder="Пароль" required="">
                        </div>



                        <div>
                            <button class="btn btn-primary btn-lg" type="submit" style="min-width: 100px;">

                                Войти

                            </button>
                        </div>
                        <input type="hidden" name="csrfmiddlewaretoken" value="xGDi3iMxL0yJ7XL83q40eOXWc93rivPD">
                    </form>

                </div>

                <div class="col-sm-6 col-social-login">
                    <form method="post" action="/google/login">
                        <p><button class="btn btn-default btn-lg btn-social-login" type="submit" name="social_auth" value="google"><i class="icon-social-login icon-social-login__google">
                        </i>
                            <a href=" https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/auth/google/callback&response_type=code&client_id=927027748363-ks6je7ak0fiike6r3fojmg43mbrvpf1s.apps.googleusercontent.com&approval_prompt=force">Войти через Google</a></button></p>

                        <p><button class="btn btn-default btn-lg btn-social-login" type="submit" name="social_auth" value="linkedin">
                            <i class="icon-social-login icon-social-login__linkedin">
                        </i>
                            <a href="https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=86ye6xgf482eqp&redirect_uri=http://localhost:8080/auth/linkedin/callback&state=DCEeFWf45A53sdfKef424&scope=r_basicprofile%20r_emailaddress">Войти через LinkedIn</a></button></p>
                        <input type="hidden" name="csrfmiddlewaretoken" value="xGDi3iMxL0yJ7XL83q40eOXWc93rivPD">
                    </form>
                </div>

            </div>

            <br><br>


            <p><a href="/remind?email=&amp;lang=ru">Забыли пароль?</a></p>
            <p>
                Нет аккаунта? Войдите через соцсеть или
                <a href="/signup?lang=ru">зарегистрируйтесь</a>.</p>


        </div>
    </div>
</div>







<!--<script src="/static/js/bootstrap.min.js"></script>-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://djinni.co/static/js/bootstrap3-typeahead.min.js"></script>
<script src="https://djinni.co/static/js/inner-script.js?2"></script>



<div style="display:none">
    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
    </script><iframe name="google_conversion_frame" title="Google conversion frame" width="300" height="13" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/1068683888/?random=1494600196833&amp;cv=8&amp;fst=1494600196833&amp;num=1&amp;fmt=1&amp;guid=ON&amp;u_h=768&amp;u_w=1366&amp;u_ah=728&amp;u_aw=1366&amp;u_cd=24&amp;u_his=4&amp;u_tz=180&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=7&amp;frm=0&amp;url=https%3A%2F%2Fdjinni.co%2Flogin%3Flang%3Dru&amp;ref=https%3A%2F%2Fdjinni.co%2F&amp;tiba=%D0%92%D1%85%D0%BE%D0%B4" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no"></iframe>
</div>
<noscript>
    &lt;div style="display:none"&gt;
    &lt;img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1068683888/?value=0&amp;amp;guid=ON&amp;amp;script=0"/&gt;
    &lt;/div&gt;
</noscript>


<iframe id="intercom-frame" style="display: none;"></iframe><div id="intercom-container" style="position: fixed; width: 0px; height: 0px; bottom: 0px; right: 0px; z-index: 2147483647;"><div data-reactroot="" class="intercom-app"><span></span><span></span><!-- react-empty: 4 --><span></span><!-- react-empty: 6 --></div></div></body></html>
