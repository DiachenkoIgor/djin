<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 30.05.2017
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru"><head>
    <title>Восстановление пароля</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">







    <script type="text/javascript" async="" src="https://widget.intercom.io/widget/cg6zpunb"></script><script type="text/javascript" async="" src="https://static.intercomcdn.com/intercom.v1.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/gtm/js?id=GTM-NRD3B57&amp;cid=2092431152.1491496936"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://cdn.mxpnl.com/libs/mixpanel-2.2.min.js"></script><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">


    <link rel="stylesheet" href="https://djinni.co/static/css/inner-styles.css?36">


<body>

<nav class="nav navbar navbar-default" role="navigation">
    <div class="container">

        <div class="navbar-header " style="float: left;">
            <a href="/" class="navbar-brand">Джинн</a>
        </div>

    </div> <!-- ./container -->
</nav>











<div class="container">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">

            <div class="page-header">
                <h1>


                    Восстановление пароля

                </h1>
            </div>



            <div class="row">
                <div class="col-md-10">
                    <form method="post" class="form-inline" action="/forgetPassword">

                        <div class="input-group input-group-lg" style="width: 100%;">

                            <input type="email" id="email" name="email" value="" class="form-control" placeholder="Email" required="">

                            <span class="input-group-btn">
                      <button type="submit" class="btn btn-primary">
                        Продолжить
                      </button>
                    </span>

                        </div>




                        <input type="hidden" name="csrfmiddlewaretoken" value="foW7swflqQ7rXcuW0BttowsILJFWlIwL">
                    </form>
                </div>
                <p style="color: red">${sentence}</p>
            </div>



        </div>
    </div>

</div>






<!--<script src="/static/js/bootstrap.min.js"></script>-->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://djinni.co/static/js/bootstrap3-typeahead.min.js"></script>
<script src="https://djinni.co/static/js/inner-script.js?2"></script>




</body></html>