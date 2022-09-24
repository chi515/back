<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.text.*"%>
<%@include file="config.jsp" %>
<%
    try
    {
        request.setCharacterEncoding("UTF-8");
    
        if(session.getAttribute("username")!=null){
        String username=session.getAttribute("username").toString();
		String payway=request.getParameter("payway");
		String transport=request.getParameter("transport");
		
        sql="select * from buy where username='"+ username+"'";
        ResultSet rs=con.createStatement().executeQuery(sql);
		
        int total=0;
        while(rs.next()){
		java.sql.Date day=new java.sql.Date(System.currentTimeMillis());
        String no=rs.getString("no");
        String m= rs.getString("num");
	    int num=Integer.parseInt(m);
        String g=rs.getString("no");
        String itemid=rs.getString("itemid");
        String sqlProduct="select * from allproduct where itemid='"+itemid+"'";
        ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
        rsProduct.next();
		String q =rsProduct.getString("itemid");
		String t =rsProduct.getString("itemcount");
		int uu = Integer.parseInt(t);
        String p_name= rsProduct.getString("itemname");
        String p_picture=rsProduct.getString("pic");
		
        int p_price= rsProduct.getInt("itemprice");
        total += (p_price*num);
		int king = uu - num ;
 		String w = Integer.toString(king);
		String x = Integer.toString(num);
		
 		sql = "Update `allproduct` Set `itemcount` ='"+w+"' WHERE `itemid` ='"+q+"'"; 
 		con.createStatement().execute(sql);
 		sql="INSERT `order` (payway, transport, username, day, itemid, p_name, p_price, num, total) ";
 		sql+="VALUES ('" + payway+ "', ";
		sql+="'"+ transport+"', ";  
 		sql+="'"+ username+"', ";  
		sql+="'"+ day+"', ";  
 		sql+="'"+ itemid+"', "; 
 		sql+="'"+ p_name+"', ";  
 		sql+="'"+ p_price+"', "; 
		sql+="'"+ x+"', "; 
 		sql+="'"+ total+"')"; 
 		con.createStatement().execute(sql);
 		sql = "DELETE FROM `buy` WHERE `username`='"+username+"'";
		}
 		con.createStatement().execute(sql);
 		con.close();

        }
        out.print("<script>");
        out.print("alert('結帳成功')");
        out.print("</script>");
        response.setHeader("refresh","0;URL=index.jsp");
    }
	
    catch(SQLException s)
    {
        out.print(s.toString());
    }
%>
