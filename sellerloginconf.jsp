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
%> 
<% 
boolean flag = false; 

String email = request.getParameter ("id"); 
String password = request.getParameter ("password"); 
%>

<% 
 
String sql = "SELECT * from seller_info where email=? And pass=?"; 

try {  
ps = conn.prepareStatement (sql); 
ps.setString (1,email); 
ps.setString (2,password); 
rs = ps.executeQuery (); 
if (rs.next ()) { 
out.println (rs.getString ("email")); 
flag = true; 
session.setAttribute("uname", rs.getString ("name")); 
session.setAttribute("email", rs.getString ("email")); 
session.setAttribute("type","seller"); 
} else { 
request.setAttribute("err", "Seller email or password error!"); 
}

rs.close (); 
ps.close (); 
conn.commit ();

} catch (Exception e) { 
out.println (e); 
} 
%>


<% 

if (flag) { 

%>

<jsp:forward page="loginsuccess.jsp" />

<%

} 
else { 
%>

<jsp:forward page="loginfail.jsp"/> 
<% 
} 
%>
</body>
</html>