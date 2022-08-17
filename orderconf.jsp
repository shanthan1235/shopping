<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {	text-align: right;
}
</style>
</head>

<body>
<%@ page language="java" %>
    <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");
	String email=(String)session.getAttribute("email");
      
         Statement st=conn.createStatement();
		 String sql = "SELECT * from mtable where prod_id=?"; 
		 ps = conn.prepareStatement (sql);
		 ps.setString(1,(String)session.getAttribute("product"));
	 rs = ps.executeQuery (); 
	 while(rs.next())
	 {
%>
<p> <b>Order Confirmed:</b></p>
<table width="992" border="1" cellspacing="0">
  <tr>
    <td width="66" align="center"><strong>Item ID</strong></td>
    <td width="354" align="center"><strong>Product Name &amp; Model</strong></td>
    <td width="153" align="center"><strong>Brand</strong></td>
    <td width="148" align="center"><strong>Shipping Charges</strong></td>
    <td width="237" align="center"><strong>Total Cost</strong></td>
  </tr>
  <tr>
    <td height="75" align="center"><%=rs.getString(1)%></td>
    <td align="center"><%=rs.getString(2)%></td>
    <td align="center"><%=rs.getString(3)%></td>
    <td align="center">Rs. 10</td>
    <td align="center">Rs. <%=(	Integer.parseInt(rs.getString(4))+10)%></td>
  </tr>
</table>
<%}
ps = conn.prepareStatement ("SELECT max(pay_id) from payment where user_email=?");
	ps.setString(1,email);	
	rs=ps.executeQuery();
	rs.next();
	String consignment=rs.getString(1);

	ps.close();
	rs.close();
	conn.commit();
		
%>
<p><strong>Your Consignment Number is : <font color="red"><%=consignment%></font> </strong></p>
<p>Use it to track your product order.</p>
<p> Thanks for shopping with us. Your item will be delivered within 2-3 days.</p>
<p><strong> Happy Shopping! </strong></p>
<p><strong> <form action="main.jsp"><input type="image" src="images/Continue_Shopping.png"></form> </strong></p>
</body>
</html>