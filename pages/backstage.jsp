<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後臺管理</title>
    <link rel="stylesheet" href="../assets/css/backstage.css">
</head>
<body>
    <div class="header">
        <a href="index.jsp"><img src="../assets/photos/Logo.png"></a>
    </div>
    <div class="body">
        <div class="box1">
            <div class="tab">
                <button class="tablinks" onclick="openCity(event, '新增商品')" id="defaultOpen">新增商品</button>
                <button class="tablinks" onclick="openCity(event, '修改商品')">修改商品</button>
				<button class="tablinks" onclick="openCity(event, '刪除商品')">刪除商品</button>
                <button class="tablinks" onclick="openCity(event, '訂單管理')">訂單管理</button>
                <button class="tablinks" onclick="openCity(event, '會員資料管理')">會員資料管理</button>
				<button class="tablinks" onclick="openCity(event, '顧客相關問題')">顧客相關問題</button>
            </div>
            
            <div id="新增商品"  class="tabcontent">
			<form action="createProduct.jsp" method="POST">
                <h3>新增商品</h3>
                <p>
                    <ul>
						<li>商品代號: <input type="text" name="itemid"></li>
                        <li>商品名稱: <input type="text" name="itemname"></li>
                        <li>商品價格: <input type="text" name="itemprice"></li>
                        <li>商品簡介: <input type="text" name="itemnote"></li>
						<li>商品分類: <select name="itemtype" id="pay">
									   <option value="充電線">充電線</option>
										<option value="充電線保護套">充電線保護套</option>
										<option value="車用手機架">車用手機架</option>
										<option value="手機殼">手機殼</option>
										<option value="手機膜">手機膜</option>
										<option value="手機支架">手機支架</option>
										</select>
										</li>
						<li>商品庫存: <input type="text" name="itemcount"></li>
						<li>商品圖片: <input type="text" name="pic"></li>
                    </ul>
                    <button type="submit">新增</button>
                </p>
			</form>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※如第一次使用，需在桌面上建立 C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\ROOT\final\assets\photos 路徑的資料夾(須按照沿<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途路徑建立資料夾)，之後僅需要再資料夾內放入圖片，並打入圖片的名稱(限定.jpg)，即可幫新的商品加入圖片喔~!!!
	
        </div>
			
            <div id="修改商品"  class="tabcontent">
                <h3>修改商品</h3>
                <p>
                    <ul>
					<form action="" method="POST">
					<li>想修改的商品: <input type="text" name="udid">
					<button type="submit">送出</button></li>
					<%
					String id=request.getParameter("udid");
					%>
					</form>
					<form action="udproduct.jsp" method="POST">
					
					<%  
					sql = "SELECT * FROM `allproduct` WHERE `itemid` ='"+id+"'";
					ResultSet rss = con.createStatement().executeQuery(sql);
		
					while(rss.next())
					{%>
						
                        <li>商品名稱: <input type="text" name="udname" value="<%=rss.getString(7)%>"></li>
                        <li>商品價格: <input type="text" name="udprice" value="<%=rss.getString(4)%>"></li>
						<li>商品分類: <input type="text" name="udtype" value="<%=rss.getString(3)%>"></li>
                        <li>商品簡介: <textarea col="50" rows="5" name="udtext"><%=rss.getString(5)%></textarea></li>
						<li>商品庫存: <input type="text" name="udcount" value="<%=rss.getString(2)%>">
						<input type="hidden" name="confirm" value="<%=rss.getString(1)%>">
                        <button type="submit">更改</button>
						
					<%}%>
					</form>
					</li>
                    </ul>
					
                </p>
				<br>
				<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※在上方輸入商品代號(ex.cable01)即可修改商品的詳細內容~~如想知道該商品的代號，可到刪除商品的商品列查看~!!<br>
        </div>
		<div id="刪除商品"  class="tabcontent">
         <h3>刪除商品</h3>
         <p>
	
		
		<%  
	    sql = "SELECT * FROM allproduct";
		ResultSet rs1 = con.createStatement().executeQuery(sql);
		
		while(rs1.next())
		{%>
		<ul>
                <li>商品代號: <%=rs1.getString(1)%></li>
                <li>商品名稱: <%=rs1.getString(7)%></li>
				<li>商品分類: <%=rs1.getString(3)%></li>
				<li>商品價格: <%=rs1.getString(4)%></li>
				<li>商品庫存: <%=rs1.getString(2)%></li>
				<li>商品簡介: <%=rs1.getString(5)%>
				<form method="post" action="delproduct.jsp" >
					<input type="hidden" name="userid" value="<%=rs1.getString(1)%>">
					<button type="submit">刪除商品</button>
				</form>
				</li><hr>
			</ul>	
		<%}%>
        
		
	
		</p>
        </div>
    
<div id="訂單管理"  class="tabcontent">
    <h3>訂單管理</h3>
    <p>
        <table style="width:80%;">
		<tr>
           <td>訂購人</td><td>商品名稱</td><td>數量</td><td>時間</td><td>付款方式</td><td>運送方式</td>
        </tr>
		
			<%  
			sql = "SELECT * FROM `order`";
			ResultSet rf = con.createStatement().executeQuery(sql);
		
			while(rf.next())
			{%>
                
				<tr>
                    <td><%=rf.getString(4)%></td><td><%=rf.getString(7)%></td><td><%=rf.getString(10)%></td><td><%=rf.getString(5)%></td>
					<td><%=rf.getString(2)%></td><td><%=rf.getString(3)%></td>
                </tr>
				<%}%>
            </table>
        
    </p>
</div>

<div id="會員資料管理"  class="tabcontent">
	 
    <h3>會員資料管理</h3>

    <p>
	
        <table style="width:80%">
		<tr>
		<td>姓名</td><td>帳號</td><td>密碼</td><td>手機</td><td>地址</td><td>Email</td>
		</tr>
		<%  
	    sql = "SELECT * FROM user";
		ResultSet rs = con.createStatement().executeQuery(sql);
		
		while(rs.next())
		{%>
			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(7)%></td>
				<td>
				<form method="post" action="delmember.jsp" >
					<input type="hidden" name="userid" value="<%=rs.getString(1)%>">
					<button type="submit">刪除會員</button>
				</form>
				</td>
            </tr>
		<%}%>
        </table>
	
    </p>
	
	
	
</div>
<div id="顧客相關問題"  class="tabcontent">
    <h3>顧客相關問題</h3>
    <p>
	
        <table style="width:80%">
			 <tr>
				<td>姓名</td>
				<td>電話</td>
				<td>Email</td>
				<td>問題</td>
				<td>日期</td>
				
            </tr>
			<%  
			sql = "SELECT * FROM question";
			ResultSet gg = con.createStatement().executeQuery(sql);
		
			while(gg.next())
			{%>
            <tr>
				<td><%=gg.getString(2)%></td>
				<td><%=gg.getString(3)%></td>
				<td><%=gg.getString(4)%></td>
				<td><%=gg.getString(5)%></td>
				<td><%=gg.getString(6)%></td>
				
            </tr>
			<%}%>
        </table>
    </p>
</div>
    </div>
</div>
<script src="../assets/js/backstage.js"></script>
</body>
</html>