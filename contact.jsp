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
<link href="italics.css" rel="stylesheet" type="text/css" />
</head>

<body background="images/bg9.jpg">
<%
	String type=(String)session.getAttribute("type");
	String email=(String)session.getAttribute("email");
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
               <%if(type.equals("user")){%> User :<%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />

<p>
<form action="contactsub.jsp" style="display:inline;width:50%">
<table width="450" height="142" border="0" style="display:inline">
<tr><td><b><h4>Contact Us</h4></b></td></tr>
<tr><td colspan=2>Have a Question? or a complaint? We Have 24X7 Customer Service.</td></tr>
<tr><td colspan=2>For any kind of issues related to Our Shopping Site. Please Enter Your :</td></tr>
  <tr>
    <td width="92" height="33" align="right">Name:</td>
    <td width="342"><input type="text" name="name" size="30" required/></td>
  </tr>
  <tr>
    <td height="32" align="right">Phone No.</td>
    <td><input type="text" name="phone" size="20" required/></td>
  </tr>
  <tr>
    <td height="60" align="right">Issue(s):</td>
    <td><textarea name="issue" cols=40 rows=6 required></textarea></td>
  </tr>
<tr><td colspan=2 style="text-align:center"><input type="submit" name="submit" value="Submit Issues" /></td></tr>
</table>

</form>
</p>
<div style="margin-left:50%;margin-top:5px;width:50%">
<pre>
<b>Call Us:</b>
Pick up the phone and call us on 1800876567 or 1800652837
We Are Available 24 hours a day, 7 days a week.
</pre>
</div>
</body>
</html>