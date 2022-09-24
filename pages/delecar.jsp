<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%
	String username=session.getAttribute("username").toString();
	String dno=request.getParameter("don");


	sql="DELETE FROM `buy` WHERE  `no`='"+ dno+"' ";
	con.createStatement().execute(sql);	 //執行SQL
	con.close();	
	out.print("<script>alert('刪除成功!'); self.location=document.referrer; </script>"); 
	   

%>