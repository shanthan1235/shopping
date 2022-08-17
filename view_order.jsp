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
<p> <b>Orders Received : </b></p>
<table width="auto" border="1" cellspacing="0">
  <tr>
    <td width="180" align="center"><strong>Product Name &amp; Model</strong></td>
    <td width="200" align="center"><strong>Brand</strong></td>
    <td width="320" align="center"><strong>Specification</strong></td>
    <td width="66" align="center"><strong>Product Type</strong></td>
    <td width="100" align="center"><strong>Order Date</strong></td>
    <td width="148" align="center"><strong>User</strong></td>
    <td width="137" align="center"><strong>Total Cost</strong></td>
  </tr>
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");
      
         Statement st=conn.createStatement();
		 String sql = "SELECT * from payment where seller=?"; 
		 ps = conn.prepareStatement (sql);
		 ps.setString(1,email);
	 rs = ps.executeQuery (); 
	 while(rs.next())
	 {
%>


  <tr>
    <td height="75" align="center"><%=rs.getString(3)%></td>
    <td align="center"><%=rs.getString(4)%></td>
    <td align="center"><%=rs.getString(5)%></td>
    <td align="center"><%=rs.getString(6)%></td>
    <td align="center"><%=rs.getString(9)%></td>
    <td align="center"><%=rs.getString(13)%></td>
    <td align="center">Rs. <%=rs.getString(7)%></td>
    <td align="center"><a href="update_order_status_form.jsp?consignment=<%=rs.getString(10)%>"><img src="images/update_status.jpg" width="150" height="50"/></a></td>
  </tr>

<%}%>
</table>
<%
	ps.close();
	rs.close();
	conn.commit();
		
%>
</body>
</html>