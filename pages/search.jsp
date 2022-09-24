<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/cable.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
    <title>搜尋結果</title>
</head>
<body>
    <div class="body">
        <div class="header">
            <a href="question.jsp" class="select">聯絡我們</a>
            <a href="member.jsp" class="select">成員介紹</a>
			<% if(session.getAttribute("username")!=null){%>
		
			<span class="login">
				<button type="button" class="btn btn-primary"><a href="signout.jsp" style="text-decoration:none;color: black;">登出</a></button>
			</span>
			<%if(session.getAttribute("username").equals("phone")){%>	
			<span class="login">
				<button type="button" class="btn btn-primary"><a href="backstage.jsp" style="text-decoration:none;color: black;">後臺管理</a></button>
			</span>
		
			<%}else{%>
			<span class="login">
				<button type="button" class="btn btn-primary"><a href="memberinfo.jsp" style="text-decoration:none;color: black;">會員專區</a></button>
			</span>
		
			<%}%>
			<%}else{%>
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
			<%}%>
        </div>
    
    <div class="nav">
        <div class="Logo"><a href="index.jsp" ><img src="../assets/photos/Logo.png"></a></div>
        <div class="search-container">
            <form action="search.jsp">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="shopping-cart"><a href="../pages/shoppingcart.html"><img src="../assets/photos/shopping-cart.png"></a></div>
    </div>

    <div class="box2">
      <center>
          <div class="w3-content w3-display-container">
              <div class="w3-display-container mySlides">
                  <a href="hproduct.jsp?itemtype=充電線"><img src="../assets/photos/cable/img2.jfif" style="width:100%"></a>
                  </div>
              <div class="w3-display-container mySlides">
                  <a href="hproduct.jsp?itemtype=手機殼"><img src="../assets/photos/phonecase/pc2.jfif" style="width:100%"></a>
              </div>
              <div class="w3-display-container mySlides">
                  <a href="hproduct.jsp?itemtype=手機支架"><img src="../assets/photos/phonestand/ps3.jpg" style="width:100%"></a>
              </div>
          <script src="../assets/js/display-container.js"></script>
      </center>
      </div>

<div class="all">
      <div class="left-box">
        <div class="lb-title">分類</div>
        <div class="choice">
		  <span><a href="hproduct.jsp?itemtype=充電線">充電線</a></span>
          <span><a href="hproduct.jsp?itemtype=手機殼">手機殼</a></span>
          <span><a href="hproduct.jsp?itemtype=充電線保護套">充電線保護套</a></span>
          <span><a href="hproduct.jsp?itemtype=手機支架">手機支架</a></span>
          <span><a href="hproduct.jsp?itemtype=手機膜">手機膜</a></span>
          <span><a href="hproduct.jsp?itemtype=手機架">手機架</a></span>
        </div>
      <div class="lb-title">付款方式</div>
      <div class="choice">
        <span><input type="checkbox">信用卡</span>
        <span><input type="checkbox">貨到付款</span>
      </div>
      </div>
	  <div class="box">
		<div class="box-title">搜尋結果</div>
		<div class="flex-container1">
	  
		<%
		request.setCharacterEncoding("utf-8");
		String searchtext = request.getParameter("search");
		sql = "SELECT * FROM allproduct WHERE `itemname` LIKE '%"+searchtext+"%'";
		ResultSet rss ;
		rss = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		if(rss.next()==false)
		{
		    out.print("<script>alert('查無結果');</script>");
			response.setHeader("refresh","0;URL=index.jsp") ;
		}
		else{
				rss.beforeFirst();
				while(rss.next()){
		%>
		<a href="product.jsp?page=<%=rss.getString(1)%>">
		<div class="product">
			<div class=img><img src="<%=rss.getString(6)%>"></div></a>
			<div class="Introduction"><%=rss.getString(7)%></div>
			<div class="price">$<%=rss.getString(4)%></div>
        
		</div>

		<%}%>
	  <%}%>
	</div>
</div>
</div>

</div>
</body>
</html>