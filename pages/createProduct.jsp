<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%
try
{
    request.setCharacterEncoding("utf-8");
	
	String itemid=request.getParameter("itemid");
	String itemcount=request.getParameter("itemcount");
	String itemtype=request.getParameter("itemtype");
	String itemprice=request.getParameter("itemprice");
	String itemnote=request.getParameter("itemnote");
	String pic=request.getParameter("pic");
	String itemname=request.getParameter("itemname");

	
	sql="INSERT allproduct (itemid, itemcount, itemtype, itemprice, itemnote, pic, itemname)";
	sql+="VALUES ('" + itemid+ "', ";
	sql+="'"+ itemcount+"', "; 
	sql+="'"+ itemtype+"', "; 
	sql+="'"+ itemprice+"', "; 
	sql+="'"+ itemnote+"', ";  
	sql+="'"+"../assets/photos/"+pic+".jpg"+"', ";  
	sql+="'"+ itemname+"')";
				
	con.createStatement().execute(sql);	 //執行SQL
	con.close();						 //關閉連線
	out.print("<script>alert('商品新增成功！');</script>"); 
	response.setHeader("refresh","0;URL=backstage.jsp");
}
catch ( SQLException e)
{
	out.print(e.toString());
		   
}
%>
</body>
</html>