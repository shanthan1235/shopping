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

<body>
 
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

<p>
<form action="sell.jsp" style="display:inline;width:50%">
<table width="450" height="142" border="0" style="display:inline">
<tr><td colspan="2"><b><h2>Tell Us What you're selling: Select Category</h2></b></td></tr>
  <tr>
    <td width="200" height="33" align="right"><h4>Select a Category : </h4></td>
    <td width="342">
	<select name="category">
		<option value="mobile">Mobile</option>
		<option value="pendrive">pen drive</option>
		<option value="powerbank">power bank</option>
		<option value="datacable">data cable</option>
		<option value="speaker">speaker</option>
		<option value="laptop">laptop</option>
		<option value="mouse">mouse</option>
		<option value="keyboard">keyboard</option>
	</select>
</td>
  </tr>

<tr><td colspan=2 style="text-align:center"><input type="submit" name="submit" value="Continue" /></td></tr>
</table>

</form>
</p>

</body>
</html>