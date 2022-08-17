<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%String type=(String)session.getAttribute("type");%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
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
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>
  <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%
		String pid=request.getParameter("product");
		String hname="Grand";
		 PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        con=(Connection)application.getAttribute("connection");
      
         Statement st=con.createStatement();
		ps=con.prepareStatement("select * from product_table where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
<p class="name"><%=rs.getString(3).toUpperCase()%> <%=rs.getString(2).toUpperCase()%> </p>
         <%}
		 ps=con.prepareStatement("select * from item_pics where pic_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
</p>
<table width="997" height="450" border="0">
  <tr>
    <td width="358" class="center1"><img src=<%="images/"+rs.getString(2)%> width="200" height="300" alt=hname/></td>
    <%}
    ps=con.prepareStatement("select * from product_table where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
    <td width="623" class="center1"><table width="466" height="20" border="0">
      <tr style="background:#DDDDDD">
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><%=rs.getString(2)%></td>
      </tr>
      <tr style="background:#DDDDDD">
        <td class="center1">Brand :</td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr style="background:#DDDDDD">
        <td class="center1">Price :</td>
        <td><%=rs.getString(4)%></td>
      </tr>
      <tr style="background:#DDDDDD">
        <td width="179" class="center1">Company :</td>
        <td width="277" class="normal"><%=rs.getString(5)%></td>
      </tr>
      <tr style="background:#DDDDDD">
        <td width="179" class="center1">Color :</td>
        <td width="277" class="normal"><%=rs.getString(6)%></td>
      </tr>
      <tr style="background:#DDDDDD">
        <td width="179" class="center1">Specification :</td>
        <td width="277" class="normal" style="background:yellow"><%=rs.getString(7)%></td>
      </tr>
 <%
}
ps.close();
rs.close();
con.commit();%>
    </table>
<%if(type!=null && type.equals("seller"))
	{
%>
<input type="image" formaction="#" src="images/buy_not.png"> 
<%
	}
else
{
%>
    <form action="buy2.jsp"> 
<input type="hidden" name="name" value=<%=pid%>> 
<input type="image" src="tel-domain-buy-logo.jpg" name="buy" value="grand"> 
<%}%>
</form></p></td>
  </tr>
</table>
</body>
</html>