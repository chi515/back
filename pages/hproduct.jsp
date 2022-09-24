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
    <title>全部商品</title>
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
        <div class="shopping-cart"><a onclick="location.href='shoppingcar.jsp'"><img src="../assets/photos/shopping-cart.png"></a></div>
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
          <span><a href="hproduct.jsp?itemtype=車用手機架">車用手機架</a></span>
        </div>
      <div class="lb-title">付款方式</div>
      <div class="choice">
        <span><input type="checkbox">信用卡</span>
        <span><input type="checkbox">貨到付款</span>
      </div>
	  <div class="lb-title">配送方式</div>
      <div class="choice">
        <span><input type="checkbox">店到店</span>
        <span><input type="checkbox">超商取貨</span>
        <span><input type="checkbox">宅配到府</span>
        <span><input type="checkbox">免運費</span>
        <span><input type="checkbox">固定運費</span>
      </div>
	  <%
		Random ran1=new Random();
		String sql1="SELECT * FROM `ad`";
        ResultSet rss=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY).executeQuery(sql1);
        rss.last();
        int n1 = rss.getRow(); 
        int current_adid=ran1.nextInt(n1)+1;
        sql1="SELECT * FROM `ad` WHERE `adid`= " + current_adid;
        rss=con.createStatement().executeQuery(sql1);
        if(rss.next()){
	%>
		<div>
		<img src="../assets/photos/ad/<%=rss.getString(2)%>.jpg" style="width:150px;height:150px;" alt="<%=rss.getString(3)%>">
		</div>
	<%}%>
      </div>
	  
	  <div class="box">
		<div class="box-title">所有商品</div>
		<div class="flex-container1">
	  <%
		request.setCharacterEncoding("utf-8");
		String itemtype=request.getParameter("itemtype");
		String cable=new String("充電線");
		String cablepro=new String("充電線保護套");
		String phonestand=new String("手機支架");
		String carps=new String("車用手機架");
		String phonecase=new String("手機殼");
		String sprotect=new String("手機膜");
		if(itemtype.equals(cable))
		{
			String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+cable+"'";
			ResultSet rs2 = con.createStatement().executeQuery(sql2);
		
	
			while(rs2.next())
		{
		%>


      <a href="product.jsp?page=cable0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	<%}%>
	<%}
	else if(itemtype.equals(phonecase))
	{
		String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+phonecase+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next())
	{%>
	<a href="product.jsp?page=case0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	  <%}%>
	<%}
	else if(itemtype.equals(phonestand))
	{
		String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+phonestand+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next())
	{%>
	<a href="product.jsp?page=stand0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	  <%}%>
	<%}
	else if(itemtype.equals(carps))
	{
		String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+carps+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next())
	{%>
	<a href="product.jsp?page=carps0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	  <%}%>
	<%}
	else if(itemtype.equals(cablepro))
	{
		String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+cablepro+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next())
	{%>
	<a href="product.jsp?page=cablepro0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	  <%}%>
	<%}
	else if(itemtype.equals(sprotect))
	{
		String sql2 = "SELECT * FROM allproduct WHERE itemtype='"+sprotect+"'";
		ResultSet rs2 = con.createStatement().executeQuery(sql2);

		while(rs2.next())
	{%>
	<a href="product.jsp?page=sp0<%out.print(rs2.getString("itemnum"));%>">
      <div class="product">
        <div class=img><img src="<%out.print(rs2.getString("pic"));%>"></div></a>
          <div class="Introduction"><%out.print(rs2.getString("itemname"));%></div>
          <div class="price">$<%out.print(rs2.getString("itemprice"));%></div>
        
      </div> 
	  <%}%>
	<%}%>
	</div>
</div>
</div>

</div>
</body>
</html>