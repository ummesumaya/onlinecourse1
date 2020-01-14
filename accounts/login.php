<?php 
$con = mysqli_connect("localhost","root","","onlinecourse");

if (isset($_POST['login'])) {
$uname = $_POST['uname'];
$pass = $_POST['pass'];

$login_query="SELECT * FROM admin WHERE username = '$uname' AND password = $pass ";
$rs = mysqli_query($con,$login_query);
$num = mysqli_num_rows($rs);
if ($rs AND $num>0) {

  header("Location:index.php");
  
}else{
  echo "Wrong information";
}

  
}




 ?>



<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>LOG IN page</title>
   <style type="text/css">
    .login-page {width: 360px;padding: 8% 0 0;margin: auto;}
    .form {position: relative;z-index: 1;background: #FFFFFF;max-width: 360px;margin: 0 auto 100px;padding: 45px;text-align: center;box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);}
    .form input {font-family: "Roboto", sans-serif;outline: 0;background: #f2f2f2;width: 100%;border: 0;margin: 0 0 15px;padding: 15px;box-sizing: border-box;font-size: 14px;}
    .form button {font-family: "Roboto", sans-serif;text-transform: uppercase;outline: 0;background: #4CAF50;width: 100%;border: 0;padding: 15px;color: #FFFFFF;font-size: 14px;-webkit-transition: all 0.3 ease;transition: all 0.3 ease;cursor: pointer;}
    .form button:hover,.form button:active,.form button:focus {background: #43A047;}
    .form .message {margin: 15px 0 0; color: #b3b3b3;font-size: 12px;}
    .form .message a {color: #4CAF50;text-decoration: none;}
  </style>
 </head>
 <body>

 <div class="login-page">
  <p style="font-size: 32px;text-align: center">Accountant Login</p>
  <div class="form">
    <form class="login-form" action="login.php" method="post">
      <input type="text" name="uname" placeholder="Enter Username"/>
     <input type="password" name="pass" placeholder="Enter_Password"/>
      <button name="login">login</button>
    </form>
  </div>
</div>

  </body>
</html>
