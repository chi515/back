<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <link rel="stylesheet" href="../assets/css/memberinfo.css">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
    <title>會員專區</title>
</head>
<body>
    <div class="body">
        <div class="header">
            <a href="" class="select">熱門榜</a>
            <a href="" class="select">商品選項</a>
            <a href="" class="select">成員介紹</a>
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
            <form action="/action_page.php">
              <input type="text" placeholder="Search.." name="search">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="shopping-cart"><a onclick="location.href='shoppingcar.jsp'"><img src="../assets/photos/shopping-cart.png"></a></div>
    </div>   
	
	
    
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, '會員資訊')" id="defaultOpen">會員資訊</button>
        <button class="tablinks" onclick="openCity(event, '更改資料')">更改資料</button>
        <button class="tablinks" onclick="openCity(event, '購買紀錄')">購買紀錄</button>
      </div>
	  <form action="udmember.jsp" method="post">
      <%
		sql = "SELECT * FROM user where username ='"+ session.getAttribute("username") + "' ";
		ResultSet rs = con.createStatement().executeQuery(sql);
		while(rs.next())
		{%>
      <div id="會員資訊" class="tabcontent">
        <h3>會員資訊</h3>
        <p>
            <ul>
            <li>會員名稱 : <%=rs.getString(2)%></li> <br> 
            <li>帳號 : <%=rs.getString(3)%></li><br> 
            <li>密碼 : <%=rs.getString(4)%></li><br> 
            <li>地址 : <%=rs.getString(5)%></li><br> 
            <li>手機 : <%=rs.getString(6)%></li><br>  
			<li>Email : <%=rs.getString(7)%></li><br>
        </ul>
        </p>
      </div>
		
      <div id="更改資料" class="tabcontent">
        <h3>更改資料</h3>
        <p>
            <ul>
            <li>會員名稱 : <input type="text" name="name" value="<%=rs.getString(2)%>"></li><br> 
            <li>帳號 : <input type="text" name="username" value="<%=rs.getString(3)%>"></li><br> 
            <li>密碼 : <input type="text" name="password" value="<%=rs.getString(4)%>"></li><br> 
            <li>地址 : <input type="text" name="address" value="<%=rs.getString(5)%>"></li><br> 
            <li>手機 : <input type="text" name="phone" value="<%=rs.getString(6)%>"></li><br> 
			<li>Email : <input type="text" name="email" value="<%=rs.getString(7)%>"></li><br>
			<input type="hidden" name="confirm" value="<%=rs.getString(1)%>">
            <button type="submit">更改</button>
            <button type="button">刪除帳號</button>         
        </ul>
        </p>
      </div>
	<%}%>
	</form>
	
      <div id="購買紀錄" class="tabcontent">
        <h3>購買紀錄</h3>
        <p>
            <div class="table">
                <div class="product">
                    <div class="pname">名稱</div>
                    <div class="price">金額</div>
                    <div class="amount">數量</div>
                </div>
				<%
					String username=(String)session.getAttribute("username");
					sql = "SELECT * FROM `order` where username ='"+ username + "' ";
					ResultSet rss = con.createStatement().executeQuery(sql);

					while(rss.next()){
						String itemid=rss.getString("itemid");
						String sqlProduct="SELECT * FROM `allproduct` where itemid='"+itemid+"'";
						ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
						rsProduct.next();
						String p_picture=rsProduct.getString("pic");
				%>
                    <div class="product">
                        <div class="img"><img src="<%=p_picture%>"></div>
                        <div class="pname"><%=rss.getString(7)%></div>
                        <div class="price">$<%=rss.getString(8)%></div>
                        <div class="amount">數量:<%=rss.getString(10)%></div>
					</div>
					<%}%>
            </div>
        </p>
      </div>
	  
</div>
<script src="../assets/js/backstage.js"></script>
</body>
</html>