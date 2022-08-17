         <%@page import="java.sql.*" %>
<html>
<head>
<title>Online Shopping App</title>
<% String email=(String)session.getAttribute("email");
	String type=(String)session.getAttribute("type");
%>
         <% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");

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
<body bgcolor="lightgreen" background="images/bg55.jpg">

<table width="993" height="330" border="0">
  <tr>
    <td width="205" height="89"><img src="head.png" width="249" height="88" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="88" border="0">
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
	<tr><td class="right"><a href="sell_category.jsp">Add Product</a> | <a href="manage_product.jsp">Manage Product</a>| <a href="manage_issues.jsp">Manage Issues</a> | <a href="view_order.jsp">View Order</a> | <a href="seller_profile.jsp">Update Profile</a> | <a href="manage_feedback.jsp">Manage Feedback</a></td></tr>
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
      <tr>
        <td><form id="form1" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>

  <tr>
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">PRODUCT BRANDS</td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Samsung" /><input type="image" src="images/sam.png" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Nokia" /><input type="image" src="images/nok.png" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="Sony" /><input type="image" src="images/son.png" /></form></td>
          </tr>
          <tr>
            <td height="22"><form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="HTC" /><input type="image" src="images/htc.png" /></form></td>
          </tr>
          <tr>
            <td><form action="category.jsp">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/lg.png" /></form></td>
          </tr>
          <tr>
            <td><form action="more_product_brand.jsp" style="text-align:center">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/more.png" /></form></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="201"><table width="243" height="180" border="0">
          <tr>
            <td width="233" class="normal">PRODUCT TYPES</td>
          </tr>
          <tr>
            <td><form action="category2.jsp">
            <input type="hidden" name="type" value="mtype" /><input type="hidden" name="category" value="and" /><input type="image" src="images/and.png" /></form></td>
          </tr>
          <tr>
            <td><form action="category2.jsp">
            <input type="hidden" name="type" value="mtype" /><input type="hidden" name="category" value="sma" /><input type="image" src="images/sma.png" /></form></td>
          </tr>
          <tr>
            <td><form action="category2.jsp">
            <input type="hidden" name="type" value="mtype" /><input type="hidden" name="category" value="dua" /><input type="image" src="images/dua.png" /></form></td>
          </tr>

        </table></td>
      </tr>
      
    </table></td>

    <td><table width="auto" height="684" border="0">
      <tr class="normal">
        <td height="30">PRODUCT BRANDS</td>
      </tr>
      <tr>
        <td height="100">
          <tr><td>
<%
	int count1=0;
		count1++;
		ps=conn.prepareStatement("select distinct mtable.company from mtable");
		rs=ps.executeQuery();
		while(rs.next())
		{
		String cname=rs.getString(1);
%>

             <a href="category.jsp?type=brand&category=<%=cname%>" style="background:grey;padding:30%;font-size:200%;margin:10% 0 0 0;text-decoration:none"><%=cname.toUpperCase()%></a><Br><Br><Br><br><Br><br><Br>


<%
	}
rs.close();
ps.close();
conn.commit();
%>

          </tr></td>
        </table></td>
      </tr>

</table>

</body>
</html>
