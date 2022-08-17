<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
	String type=(String)session.getAttribute("type");
	String email=(String)session.getAttribute("email");
	String category=(String)session.getAttribute("category");
%>
<style type="text/css">
.name {
	font-weight: bold;
	font-size: 36px;
}
.gnrl {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.center1 {
	text-align: center;
}
.center1 table {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	font-weight: bold;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-family: Arial, Helvetica, sans-serif;
}
.right {
	text-align: right;
}
.norm {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
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
               <%if(type.equals("user")){%> User :<%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>

<p class="name" style="text-align:center;font-family:arial">Product Description(<%=category%>) </p>

</p>
<form action="insert_item_description.jsp" enctype="multipart/form-data" method="post">
<table width="997" height="auto" border="0">
  <tr>
    <td width="358" class="center1">Select a Pic: <input type="file" name="logo" required/> </td>

    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><input type="text" name="model" required></td>
      </tr>
      <tr>
        <td class="center1">Brand :</td>
        <td><input type="text" name="brand" required></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><input type="text" name="price" required></td>
      </tr>
      <tr>
        <td class="center1">Company :</td>
        <td><input type="text" name="company" required></td>
      </tr>
      <tr>
        <td class="center1">Color :</td>
        <td><input type="text" name="color" required></td>
      </tr>
      <tr>
        <td class="center1">Specification :</td>
        <td><textarea name="specification" rows=5 cols=33 required></textarea></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<br><Br>
<div style="text-align:center;"><input type="image" src="images/submit.jpg" width="200" height="50" alt="click to submit"></div>
</form>
</body>
</html>