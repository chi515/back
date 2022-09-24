<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%
    String id=request.getParameter("userid");
    sql="SELECT *FROM `allproduct`;";
    ResultSet rs=con.createStatement().executeQuery(sql);
    rs.next();	
try
{
	sql = "DELETE FROM `allproduct` WHERE `itemid`='"+id+"'";
    con.createStatement().execute(sql);
	con.close();
    out.print("<script>alert('刪除成功');</script>");
	response.setHeader("refresh","0;URL=backstage.jsp") ;
}
catch(SQLException e)
{
	out.print("<script>alert('刪除失敗');</script>");
	response.setHeader("refresh","0;URL=backstage.jsp") ;
}
%>
