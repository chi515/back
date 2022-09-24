<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	if(request.getParameter("uname") !=null && request.getParameter("psw") != null)
{
	sql = "SELECT * FROM user WHERE username=? AND password=?";
	PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("uname"));
    pstmt.setString(2,request.getParameter("psw"));

	ResultSet paperrs = pstmt.executeQuery();
	if(request.getParameter("uname").equals("phone") && request.getParameter("psw").equals("1234"))
	{
	  session.setAttribute("username",request.getParameter("uname"));
      response.sendRedirect("index.jsp") ;
	}
    
    else if(paperrs.next())
	{            
        session.setAttribute("username",request.getParameter("uname"));
        out.print("<script>alert('登入成功');</script>"); 
		response.setHeader("refresh","0;URL=index.jsp");
    }
    else
	{
		out.print("<script>alert('密碼錯誤');</script>"); 
		response.setHeader("refresh","0;URL=index.jsp");
	}
}
%>
