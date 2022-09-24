<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>瘋起來</title>
    <link rel="stylesheet" href="../assets/css/index.css">
    <link rel="stylesheet" href="../assets/css/login.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <script src="https://kit.fontawesome.com/fd5006d268.js" crossorigin="anonymous"></script>
</head>

<body>
	
    <div class="body">
    <div class="header">

    <%
	int count = 0;
	String countStr;
	try {
	if(con.isClosed())
		out.println("連線建立失敗");
	else{
		sql="select * from count" ;
		ResultSet rs1=con.createStatement().executeQuery(sql);

		if (rs1.next()){
			countStr = rs1.getString(1);
			count = Integer.parseInt(countStr);

			if (session.isNew())
			{
				count=count + 1;
				countStr = String.valueOf(count);
				//寫回資料庫
				sql="update count set count = '" + countStr + "'";
				con.createStatement().execute(sql);
			}
		}

		con.close();
    }
	}
	catch(Exception err)
	{
		out.println(err);
	}
	%>
	<div style="position:absolute; width:130px;left:170px;top:20px;color:white">網站瀏覽人數：<%out.print(count);%></div>
		<a href="question.jsp">聯絡我們</a>
        <a href="member.jsp">成員介紹</a>
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
            <form method="POST" action="add.jsp">
            <div class="modal-content animate">
              <div class="imgcontainer">
                <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
                <img src="../assets/photos/Logo.png" alt="Avatar" class="avatar">
            </div>
              <div class="container">
			  
                <label for="uname"><b>Name</b></label>
                <input type="text" placeholder="輸入用戶姓名" name="name" required>
				
				<label for="uname"><b>Username</b></label>
                <input type="text" placeholder="輸入帳號" name="username" required>
				
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="輸入密碼" name="password" required>
            		
				<label for="address"><b>Address</b></label>
                <input type="text" placeholder="輸入地址" name="address" required>

				<label for="phone"><b>Phone</b></label>
                <input type="text" placeholder="輸入電話" name="phone" required>    

				<label for="email"><b>Email</b></label>
                <input type="text" placeholder="輸入email" name="email" required>  
                 
                <br>
                <button class="loginbtn" type="submit">註冊</button>
              </div>
            </div>
        </form>
          </div>
		  
        <script src="../assets/js/login.js"></script>

		
        <span class="login">
        <button onclick="document.getElementById('id01').style.display='block'" type="button" class="btn btn-primary">登入</button>
        </span>
        <div id="id01" class="modal">
            <form action="check.jsp" method="post">
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
        </form>
          </div>
        <script src="../assets/js/login.js"></script>
		<%}%>
    </div>

<div class="nav">
    <div class="Logo"><a href="index.jsp"><img src="../assets/photos/Logo.png"></a></div>
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
            <a href="#"><img src="../assets/photos/index/img1.jpg" style="width:100%"></a>
            </div>
        <div class="w3-display-container mySlides">
            <a href="#"><img src="../assets/photos/index/img2.jpg" style="width:100%"></a>
        </div>
        <div class="w3-display-container mySlides">
            <a href="#"><img src="../assets/photos/index/img3.jpg" style="width:100%"></a>
        </div>
    <script src="../assets/js/display-container.js"></script>
</center>
</div>

<div class="box3">
<div class="b3-title">分類</div>
<div class="row">
    <div class="product1">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=充電線保護套">充電線保護套</a>

            </div>
        </div>
    </div>

    <div class="product2">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=手機支架">手機支架</a>

            </div>
        </div>
    </div>

    <div class="product3">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=手機殼">手機殼</a>
        </div>
    </div>
</div>
</div>
<div class="row">
    <div class="product1">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=手機膜">手機膜</a>
            </div>
        </div>
    </div>

    <div class="product2">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=車用手機架">車用手機架</a>
            </div>
        </div>
    </div>

    <div class="product3">
        <div class="column">
            <div class="dropdown">
                <a href="hproduct.jsp?itemtype=充電線">充電線</a>
        </div>
    </div>
</div>
</div>
</div>

<div class="box4">
    <div class="b4-title">熱門商品</div>
    <div class="flex-container">
    <a href="product.jsp?page=cablepro01">
    <div class="b4-product">
        <div class="img"><img src="../assets/photos/cc/cc1.jfif"></div>
        <div class="Introduction">咬咬小動物 iPhone傳輸線/充電線 防斷保護套</div>

    </div>
    </a>

    <a href="product.jsp?page=case01">
    <div class="b4-product">
        <div class="img"><img src="../assets/photos/phonecase/pc1.jpg"></div>
        <div class="Introduction">鬼滅之刃手機殼</div>

    </div>
    </a>
    <a href="product.jsp?page=sp01">
    <div class="b4-product">
        <div class=img>
        <img src="../assets/photos/sp/sp1.jfif">
        </div>
        <div class="Introduction">液態奈米手機膜</div>

    </div>
    </a>
    </div>
</div>

</div>
	

</body>

</html>