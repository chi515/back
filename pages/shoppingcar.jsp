<%@ page import = "java.sql.*, java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <link rel="stylesheet" href="../assets/css/shopping-cart.css">
    <link rel="stylesheet" href="../assets/js/count2.js">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="body">
    <div class="header">
        <a href="" class="select">熱門榜</a>
        <a href="" class="select">商品選項</a>
        <a href="member.html" class="select">成員介紹</a>
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
    <div class="shopping-cart"><a onclick="location.href='shoppingcar.jsp'"><img src="../assets/photos/shopping-cart.png"></a></div>
</div>

<div class="list">
	<div class="info">
		<%String user = (String)session.getAttribute("username");%>
        <span><%out.print(user);%></span>
        <span>購物車</span>
    </div>
	<div class="shopping-list">
	<%
        if(session.getAttribute("username")!=null){
        String username=(String)session.getAttribute("username");
        sql="select * from buy where username='"+ username+"'";
        ResultSet rs=con.createStatement().executeQuery(sql);
        int total=0;
        while(rs.next()){
        String no=rs.getString("no");
        String m= rs.getString("num");
	    int num=Integer.parseInt(m);
        String g=rs.getString("no");
        String x=rs.getString("itemid");
        String sqlProduct="select * from allproduct where itemid='"+x+"'";
        ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
        rsProduct.next();
        String p_name= rsProduct.getString("itemname");
        String p_picture=rsProduct.getString("pic");
        int p_price= rsProduct.getInt("itemprice");
        total += (p_price*num);
    %>
    
    
        <div class="product">
            <div class="img"><img src="<%=p_picture%>"></div>
            <div class="pname"><%=p_name%></div>
            <div class="price">$<%=p_price%></div>
            <div class="amount">數量: <%=num%> </div>
			<form  action="delecar.jsp" method="post" >
				<input type="hidden" name="don" value="<%=g%>">
				<button type="submit" style="position:relative;top:30px;">刪除</button>
			</form>
        </div>
		<%}%>
		
		<div class="t-price">
          <span>總價:$<%=total%></span>
          <span class="total"></span>
		  <br>
		  
        </div>
		<br>
		<%}
		else
		{%>
		<script>alert('請先登入會員喔！');document.location ='index.jsp'</script>
		<%}%>
		<form action="order.jsp" method="POST">
        <div class="sell">
          <div class="pay">
              <span>付款方式:</span>
              <select name="payway" id="pay">
              <option value="貨到付款">貨到付款</option>
              <option value="line pay">line pay</option>
              <option value="apple pay">apple pay</option>
              <option value="銀聯">銀聯</option>
              <option value="visa">Visa</option>
            </select>
          </div>

          <div class="transport">
            <span>運送方式</span>
            <select name="transport" id="transport">
              <option value="7-11超商取貨">7-11超商取貨</option>
              <option value="全家超商取貨">全家超商取貨</option>
              <option value="宅配到府">宅配到府</option>
            </select>
        </div>
		<button type="submit" class="done" style="position:relative;text-align:right;">去買單</button>
    </div>
	</form>
</div>

</div>

</div>
</body>
</html>