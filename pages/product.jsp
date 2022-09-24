<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file= "config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/production.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <link rel="stylesheet" href="../assets/css/rating.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <link rel="stylesheet" href="../assets/js/count2.js">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
    <title>所有商品</title>
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
    <%
		String pid = request.getParameter("page");
		session.setAttribute("new_pid",pid);
		String sql3="SELECT * FROM allproduct WHERE itemid = '"+pid+"'";
		ResultSet rs = con.createStatement().executeQuery(sql3);
		while(rs.next())
		{
	%>
    <div class="nav">
        <div class="Logo"><a href="index.jsp" ><img src="../assets/photos/Logo.png"></a></div>
        <div class="search-container">
            <form action="search.jsp">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="shopping-cart"><a onclick="location.href='shoppingcar.jsp'"><img src="../assets/photos/shopping-cart.png"></a></div>
    </div>

    <div class="all">
        <div class="leftbox">
            <div class=image><img src="<%=rs.getString(6)%>"></div>
            <div class="share">
              <span>分享:</span>
              <a href="#" class="fa fa-facebook"></a>
              <a href="#" class="fa fa-twitter"></a>
              <a href="#" class="fa fa-instagram"></a>
            </div>
        </div>
		
        <div class="rightbox">
            <div class="title" style="width:100%;"><%=rs.getString(7)%></div>
                <div class="P-price">$<%=rs.getString(4)%></div>
				<form method="get" action="toorder.jsp">
                <ul class="btn-numbox">
                <li><span class="number">數量</span></li>
                <li>
                    <ul class="count">
                        <li><input type="text" name="number" value="1"></li>
                    </ul>
                </li>
                </ul> 
				
                <div class="boxes">
                    <form action="toorder.jsp">
					<button type="submit" class="add-SC">
                        <i class="fas fa-cart-plus"></i>
                        <span>加入購物車</span>
                    </button>
                    </form>
                </div>
		</form>
				
        </div>
    </div>
	
    <div class="product-intro">
        <div class="intro-title">商品介紹</div>
        <div class="title1">
          <span>簡介</span>
          <div class="int"><%=rs.getString(5)%></div>
        </div>
        
        <div class="title1">
            <span>分類</span>
            <div class="sort"><%=rs.getString(3)%></div>
        </div>
        
        <div class="title1">
            <span>商品數量</span>
            <div class="amount">剩餘:<%=rs.getString(2)%></div>
        </div>
    </div>
		<%}%>
	  
	  <br>
	<div class="comment-title" style="font-weight:bold;font-size:20px">用戶評價</div>
	<form action="add_board.jsp" method="post">
	<div class="input"><textarea rows="5" cols="50" name="content"></textarea></div>
	<input type="hidden" name="add_board" value="userid">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="送出">
	&nbsp;&nbsp;&nbsp;&nbsp;<input type="Reset" name="Reset" value="重新填寫">
	</form>
	  <p>
		<%
		String sql4="SELECT * FROM board WHERE pid='"+(String)session.getAttribute("new_pid")+"'";
		ResultSet rs4=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql4);
		rs4.last();//算出共幾筆留言
		int total_content=rs4.getRow();
		out.println("共"+total_content+"筆留言<p>");
		%>
        
		<%
		String sql5="SELECT * FROM board WHERE pid='"+(String)session.getAttribute("new_pid")+"'";
		ResultSet rs5=con.createStatement().executeQuery(sql5);
		while(rs5.next())
		{
	    %>


    <div class="comment2">
      <div class="user" name="userid">
        <span><%out.print(rs5.getString(2));%></span><br>
          
        <div class="commentbox2">
		<div name="content">
			<%out.print(rs5.getString(3));%>
		</div>
		<%out.print(rs5.getString(4));%><hr>
		</div>
		
      </div>
      
		
	<%}%>
	</p>
	  
	</div>
	
</body>
</html>