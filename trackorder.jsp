<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>My Orders</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
</head>

<body>
<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<% String email=(String)session.getAttribute("email");
	String type=(String)session.getAttribute("type");
%>
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
               <%if(type.equals("user")){%> <b><font color="magenta">User :</font><%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p> <b>Orders Status:</b></p>
<table width="auto" border="1" cellspacing="0">
  <tr>
    <td width="180" align="center"><strong>Product Name &amp; Model</strong></td>
    <td width="200" align="center"><strong>Current Location</strong></td>
    <td width="320" align="center"><strong>Estimated Arrival</strong></td>
    <td width="66" align="center"><strong>Consignment Number</strong></td>
    <td width="130" align="center"><strong>Delivery Status</strong></td>
  </tr>
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");
	String consignment=request.getParameter("consignment");
      
         Statement st=conn.createStatement();
		 String sql = "SELECT * from payment where pay_id=?"; 
		 ps = conn.prepareStatement (sql);
		 ps.setString(1,consignment);
	 rs = ps.executeQuery (); 
	 if(rs.next())
	 {
%>


  <tr>
    <td height="75" align="center"><%=rs.getString(3)%></td>
    <td align="center"><%=rs.getString(14)%></td>
    <td align="center"><%=rs.getString(15)+" days"%></td>
    <td align="center"><%=consignment%></td>
    <td align="center"><%=rs.getString(16)%></td>
  </tr>

<%}%>
</table>
<br><Br>
<a href="#" onclick="history.back()"><img src="images/go_back.gif" width="170" height="40"/></a>
<%
	ps.close();
	rs.close();
	conn.commit();
		
%>
</body>
</html>