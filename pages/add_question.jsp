<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use phone";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String a=request.getParameter("myname");
           String b=request.getParameter("tellphone");
		   String c=request.getParameter("email");
		   String d=request.getParameter("message");
		   //舊版MySQL從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼
           //String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
           //String new_subject=new String(request.getParameter("subject").getBytes("ISO-8859-1"),"UTF-8");
           //String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT question (`name`, `tel`, `email`, `msg`,`Putdate`) ";
           sql+="VALUES ('" + a + "', ";
           sql+="'"+b+"\', ";
           sql+="'"+c+"', ";
           sql+="'"+d+"', ";   
           sql+="'"+new_date+"')";      

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
		   out.print("<script>alert('資料成功送出');</script>");
	response.setHeader("refresh","0;URL=question.jsp");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
