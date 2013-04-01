<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>wb2email</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">

      /* Sticky footer styles
      -------------------------------------------------- */

      html,
      body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
      }

      /* Wrapper for page content to push down footer */
      #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
      }

      /* Set the fixed height of the footer here */
      #push,
      #footer {
        height: 60px;
      }
      #footer {
        background-color: #f5f5f5;
      }

      /* Lastly, apply responsive CSS fixes as necessary */
      @media (max-width: 767px) {
        #footer {
          margin-left: -20px;
          margin-right: -20px;
          padding-left: 20px;
          padding-right: 20px;
        }
      }

      /* Custom page CSS
      -------------------------------------------------- */
      /* Not required for template or sticky footer method. */

      .container {
        width: auto;
        max-width: 680px;
      }
      .container .credit {
        margin: 20px 0;
      }

    </style>
    <link href="static/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
  </head>

  <body>

    <!-- Part 1: Wrap all page content here -->
    <div id="wrap">

      <!-- Begin page content -->
      <div class="container">
        <div class="page-header">
          <h1>Hello <{$screenName}> 欢迎使用wb2email </h1>
        </div>
        <p class="text-info">请填写接收收藏微博的邮箱</p>
        <form action="register.php" method="POST" >
          <fieldset>
            <input type="text" name="email" placeholder="填写你的邮箱">
            <span class="help-block">例如: neu.loner@gmail.com </span>
            <button type="submit" class="btn">提交</button>
          </fieldset>  
        </form>
          <p class="lead">您已提交的邮箱</p>
        <table class="table">
          <tr>
            <td>邮箱</td> 
            <td>已发送的最新收藏的微博的收藏时间</td>
          </tr> 
            <{foreach $userEmails as $email}>
            <tr>
                <td><{$email['email']}></td> 
                <td><{$email['lastTime']}></td>
            </tr>
            <{/foreach}>
        </table>
      </div>

    <div id="footer">
      <div class="container">
        <p class="muted credit">    </p></div>
    </div>



    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

  </body>
</html>
