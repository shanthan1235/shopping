<html>
<head>
<title>Online Shopping App</title>
<% String email=(String)session.getAttribute("email");
	String type=(String)session.getAttribute("type");
%>
<style type="text/css">
.right {
	text-align: right;
}
#form1 {
	text-align: center;
}
.normal {
	text-align: left;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.unormal {
	font-family: Arial, Helvetica, sans-serif;
}
.center1 {	text-align: center;
}
</style>
</head>
<body>

<%@ page import="java.sql.*"%>
<center>
<table width="auto" height="auto" border="0">
  <tr>
    <td width="205" height="89"><img src="head.png" width="249" height="88" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="auto" height="88" border="0">
      <tr>
        <td width="713" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> | 
        <% if(session.getAttribute("uname")==null) {
			%>
            <a href="login.jsp">Login</a> | <a href="register.jsp">Signup</a>
            <%} else {
				%>
               <%if(type.equals("user")){%> <b><font color="magenta">User :</font><%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
               
                </td>
      </tr>
<%
	if(type.equals("seller"))
	{
%>
	<tr><td class="right"><a href="sell_category.jsp">Add Product</a> | <a href="manage_product.jsp">Manage Product</a>| <a href="manage_issues.jsp">Manage Issues</a> | <a href="view_order.jsp">View Order</a> | <a href="seller_profile.jsp">Update Profile</a></td></tr>
<%
	}
	else if(type.equals("user"))
	{
%>
	<tr><td class="right"><a href="my_order.jsp">My Orders</a> | <a href="my_issue.jsp">My Issues</a> | <a href="user_profile.jsp">Update Profile</a> | <a href="user_feedback.jsp">Feedback</a></td></tr>
<%
	}
%>
<%}%>

</table><hr/></td></tr>

</table>
</body>
</center
</html>