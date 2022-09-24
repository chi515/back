<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ include file="config.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
    if(request.getParameter("udname") != "" && request.getParameter("udprice") != "" && request.getParameter("udtext") != ""&& request.getParameter("udcount") != "")
	{
		String xx = request.getParameter("confirm");
		String udname = request.getParameter("udname");
		String udprice =request.getParameter("udprice");
        String udtext = request.getParameter("udtext");
		String udcount = request.getParameter("udcount");
		String udtype = request.getParameter("udtype");
		
		sql = "Update `allproduct` Set `itemcount` = '"+udcount+"',`itemtype` = '"+udtype+"', `itemname` ='"+udname+"', `itemnote` ='"+udtext+"', `itemprice` ='"+udprice+"' WHERE `itemid` ='"+xx+"'"; 
        con.createStatement().executeUpdate(sql);	
        con.close();
		out.print("<script>alert('修改成功！'); </script>");
		response.setHeader("refresh","0;URL=backstage.jsp") ;
    }
    else
	{
		out.println("<script>alert('修改失敗！');</script>");
		response.setHeader("refresh","0;URL=backstage.jsp") ;
	}
%>
