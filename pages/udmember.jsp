<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("password") != "" && request.getParameter("name") != "" && request.getParameter("username") != ""&& request.getParameter("email") != ""&& request.getParameter("phone") != ""&& request.getParameter("address") != "")
	{	
		String xx = request.getParameter("confirm");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		sql = "UPDATE `user` SET `address` = '"+address+"',`password` = '"+password+"', `name` = '"+name+"', `username` = '"+username+"', `email` ='"+email+"', `phone` ='"+phone+"' WHERE `id` ='"+xx+"'";
		con.createStatement().execute(sql);
		con.close();
		out.print("<script>alert('修改成功');</script>");
	    response.setHeader("refresh","0;URL=memberinfo.jsp") ;
	}
	else
	{
		out.println("<script>alert('修改失敗');</script>");
	    response.setHeader("refresh","0;URL=memberinfo.jsp") ;
	}
%>