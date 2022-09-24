<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/question.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="body">
        <div class="header">
            <a href="member.jsp" class="select">成員介紹</a>
            <span class="login">
                <button onclick="document.getElementById('id02').style.display='block'" type="button" class="btn btn-primary">註冊</button>
            </span>
            <div id="id02" class="modal">
      
              <div class="modal-content animate">
                  <div class="imgcontainer">
                    <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="../assets/photos/Logo.png" alt="Avatar" class="avatar">
                </div>
              
              
                  <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="輸入用戶名稱" name="uname" required>
                    
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="輸入email" name="uname" required>
    
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="輸入密碼" name="psw" required>
                    
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="再次輸入密碼" name="psw" required>
                     
                    <br>
                    <button class="loginbtn" type="submit">註冊</button>
                  </div>
                </div>
              </div>
            <script src="../assets/js/login.js"></script>
    
    
            <span class="login">
            <button onclick="document.getElementById('id01').style.display='block'" type="button" class="btn btn-primary">登入</button>
            </span>
            <div id="id01" class="modal">
      
              <div class="modal-content animate">
                  <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
                    <img src="../assets/photos/Logo.png" alt="Avatar" class="avatar">
                  </div>
              
              
                  <div class="container">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="uname" required>
              
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>
                     
                    <label>
                      <input type="checkbox" checked="checked" name="remember"> Remember me
                    </label>
                    <br>
                    <span class="psw">Forgot <a href="#">password?</a></span>
                    <button class="loginbtn" type="submit">Login</button>
                  </div>
                </div>
              </div>
            <script src="../assets/js/login.js"></script>
        </div>
    
    <div class="nav">
        <div class="Logo"><a href="index.jsp" ><img src="../assets/photos/Logo.png"></a></div>
        <div class="search-container">
            <form action="/action_page.php">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="shopping-cart"><a href="shoppingcart.html"><img src="../assets/photos/shopping-cart.png"></a></div>
    </div>
  
    <div class="qbox" >
      <div><img src="../assets/photos/question.png" class="phoneimg"></div>
        <div class="q-title">問題表單</div>
		<form action="add_question.jsp" method="post">
        <div class="information">
            <span>個人資料</span>
           <div class="infobox">
                <div class="phone">電話號碼 : <input type="text" name="tellphone" size="20" ></div>
                <div class="name">姓名 : <input type="text" name="myname" size="25"></div>
                <div class="email">Email : <input type="text" name="email" size="24"></div>
            </div>
            <br>
            <span>有什麼問題?</span><br>
            <textarea class="textbox" name="message" rows="6" cols="50"></textarea>
        </div>
		
        <br>
        <center><div class="btn">
		<input type="submit" name="Submit" value="提交">
        <input type="Reset" name="Reset" value="重設"></div></center>
    </form>
	</div>
</div>
</body>
</html>