<html lang="ru">
<head>
    <title>Кого вы ищете на Джинне?</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">







  
   
   
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <style>
        <%@include file="StyleSheet.css" %>

    </style>


    <meta property="og:site_name" content="Джинн — анонимный поиск работы">






    <meta name="google-translate-customization" content="43b319e88d47400c-2c58b02d438c987e-gbc703ae24e1d942c-9">

   

  
    
</head>

<body>
   

    <nav class="nav navbar " role="navigation">
        <div class="container">

            <div class="navbar-header " style="float: left; ">
                <a href="/" class="navbar-brand">Джинн</a>
            </div>

        </div> <!-- ./container -->
    </nav>












    <div class="container">
        <div class="row">
            <div class="col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">

                <div class="page-header">
                    <h1>
                        Кого вы ищете на Джинне?
                    </h1>
                </div>

                <form method="post" action="/chooseFor">
                    <br>
                    <div class="row">
                        <div class="col-sm-6">
                            <label class="social-login-label social-login-label__candidate
              active">
                                <div class="radio social-login-label__radio">
                                    <input type="radio" name="account_select" value="candidate" checked="checked">
                                    Я ищу работу
                                </div>
                                <p>
                                    Создайте анонимный профиль кандидата и компании будут предлагать вам свои вакансии.
                                </p>
                            </label>

                            <br>

                            <div>
                                <button type="submit" class="btn btn-lg btn-primary social-login-candidate-submit">Продолжить</button>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label class="social-login-label social-login-label__recruiter
              ">
                                <div class="radio social-login-label__radio">
                                    <input type="radio" name="account_select" value="recruiter">
                                    Я ищу сотрудников
                                </div>
                                <p>Находите кандидатов, приглашайте на собеседования. Оплата по факту найма.</p>
                            </label>

                            <br>

                            <div>
                                <button type="submit" class="btn btn-lg btn-success social-login-recruiter-submit" style="display: none;">Продолжить</button>
                            </div>

                        </div>
                    </div>

                    <input type="hidden" name="csrfmiddlewaretoken" value="myNV3ZyUIcztTiV6743lv8yKNdNd8Pe9">
                </form>

            </div>
        </div>
    </div>

    <script>
  $(function(){
    $('.social-login-label').on('click', function(){
      $('.social-login-label').removeClass('active');
      $(this).addClass('active');

      if ($('.social-login-label__recruiter').hasClass('active')) {
        $('.social-login-candidate-submit').hide();
        $('.social-login-recruiter-submit').fadeIn();
      }

      else {
        $('.social-login-recruiter-submit').hide();
        $('.social-login-candidate-submit').fadeIn();
      }
    });

  });
    </script>






    <!--<script src="/static/js/bootstrap.min.js"></script>-->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://djinni.co/static/js/bootstrap3-typeahead.min.js"></script>
    



  






  
  

   



   
</body>
</html>