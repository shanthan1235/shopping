<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
              conn=(Connection)application.getAttribute("connection");
         Statement st=conn.createStatement();
		 String sql = "UPDATE register1 set address=?, phone=? where email=?"; 
		 ps = conn.prepareStatement (sql);
		 ps.setString(3,request.getParameter("mid1"));
		 ps.setString(1,request.getParameter("address"));
		 ps.setString(2,request.getParameter("phone"));
	 ps.executeUpdate (); 
	ps.close();
	conn.commit();	
 %>
     <jsp:forward page="orderconf.jsp"/>
</body>
</html>