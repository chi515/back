<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<html>
<head>
<title>add</title>
</head>
<body>
<%

		   request.setCharacterEncoding("utf-8");
           //�q���ǻ�������Ʈw, �����ϥ�getBytes("ISO-8859-1")�s�X
           String name=request.getParameter("name");
		   String username=request.getParameter("username");
           String address=request.getParameter("address");
		   String password=request.getParameter("password");
		   String phone=request.getParameter("phone");
		   String email=request.getParameter("email");

//Step 4: ���� SQL ���O	
           sql="insert user (name,username,password,address,phone,email) ";
           sql+="value ('" + name + "', ";
		   sql+="'"+ username + "', ";
		   sql+="'"+ password +"', ";
		   sql+="'"+ address+"', ";
		   sql+="'"+ phone+"',";
           sql+="'"+ email+"') ";
           con.createStatement().execute(sql);
		   
//Step 6: �����s�u
           con.close();
			response.sendRedirect("index.jsp") ;
    

%>
</body>
</html>
