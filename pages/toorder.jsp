<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>
<%

	if(session.getAttribute("username") != null)
	{
		if(request.getParameter("number") !="")
		{
		String no=(String)session.getAttribute("new_pid");
		String x=request.getParameter("number");
		String name=(String)session.getAttribute("username");
		
		sql="INSERT buy (username, itemid, num) ";
		sql+="VALUES ('" + name + "', ";
		sql+="'"+ no +"', ";
		sql+="'"+ x +"' ) ";

		con.createStatement().execute(sql);
		con.close();	 //執行SQL
		out.println("<script>alert('成功加入購物車');</script>");
		response.setHeader("refresh","0;URL=index.jsp") ;
		}
	
		else{
		out.println("<script>alert('請填寫數量');</script>");
	    response.setHeader("refresh","0;URL=index.jsp") ;
		}
	}
	else
	{
		out.print("<script>alert('請先登入會員!');</script>");
		response.setHeader("refresh","0;URL=index.jsp");
	}	

%>
</body>
</html>








		 
