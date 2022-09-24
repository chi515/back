<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
   session.removeAttribute("username");
   out.print("<script>alert('已登出');</script>"); 
   response.setHeader("refresh","0;URL=index.jsp");
   
%>