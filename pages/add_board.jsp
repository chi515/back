<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%!
	String newline(String str){
		int index = 0;
		while((index=str.indexOf("\n"))!=-1)
			str = str.substring(0, index)+"<br>"+str.substring(index+1) ;
		return(str);
	}
%>

<%
    try 
    {
		if(session.getAttribute("username")==null)
        {
			out.print("<script>alert('請先登入會員!');</script>");
			response.setHeader("refresh","0;URL=index.jsp");
		}
	
		else
		{
		request.setCharacterEncoding("utf-8");  
		String new_user = (String) session.getAttribute("username");
        String new_pid = (String)session.getAttribute("new_pid");
        String new_content=request.getParameter("content");
        java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
        
		new_content = newline(new_content);
        sql="INSERT board (userid, Content, Putdate, pid) ";
        sql+="VALUES ('" +new_user+"', ";
        sql+="'"+new_content+"', ";
        sql+="'"+new_date+"', ";
        sql+="'"+new_pid+"')";
	
        con.createStatement().execute(sql);
        con.close();      
		response.sendRedirect("product.jsp?page="+new_pid);
		}
    }
    catch (SQLException sExec) 
    {
        out.println("SQL錯誤"+sExec.toString());
    }
%>
</body>
</html>
