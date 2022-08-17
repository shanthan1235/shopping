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
		ps=con.prepareStatement("select * from mtable where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
<p class="name"><%=rs.getString(3)%> <%=rs.getString(2)%> </p>
         <%}
		 ps=con.prepareStatement("select * from pics where pic_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
</p>
<table width="997" height="399" border="0">
  <tr>
    <td width="358" class="center1"><img src=<%="images/"+rs.getString(2)%> width="200" height="300" alt=hname/></td>
    <%}
    ps=con.prepareStatement("select * from mtable where prod_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 %>
    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><%=rs.getString(2)%></td>
      </tr>
      <tr>
        <td class="center1">Brand :</td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><%=rs.getString(4)%></td>
      </tr>
      <%}%>
    </table>
    <p>

<%if(type!=null && type.equals("seller"))
	{
%>
<input type="image" formaction="#" src="images/buy_not.png"> 
<%
	}
else
{
%>
    <form action="buy.jsp"> 
<input type="hidden" name="name" value=<%=pid%>> 
<input type="image" src="tel-domain-buy-logo.jpg" name="buy" value="grand"> 
<%}%>
</form></p></td>
  </tr>
</table>
<p class="gnrl">GENERAL FEATURES</p>
<% 
rs.close();
ps=con.prepareStatement("select * from gnrl_specs where gs_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 %>
         <%
          while(rs.next())
		 {
		 %>
         <table width="630" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Form</td>
    <td width="493"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">SIM Type</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Touch Screen</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Keypad</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Sales Package</td>
    <td><%=rs.getString(6)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from platform where plat_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
PLATFORM</p>
<table width="629" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">OS</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Java</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Processor</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from display where disp_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
DISPLAY</p>
<table width="629" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Type</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Size</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Resolution</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Colors</td>
    <td><%=rs.getString(5)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from camera where cam_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
CAMERA</p>
         <table width="628" border="1" cellspacing="0">
  <tr>
    <td width="126" class="norm">Primary</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Secondary</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Flash</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Video Recording</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Other Features</td>
    <td><%=rs.getString(6)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from dimension where dim_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">DIMENSION</span> </p><table width="627" border="1" cellspacing="0">
  <tr>
    <td width="125" class="norm">Size </td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Weight</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from BATTERY where bat_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">BATTERY</span> </p><table width="627" border="1" cellspacing="0">
  <tr>
    <td width="126" class="norm">Type</td>
    <td width="485"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Capacity</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from memory where mem_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MEMORY AND STORAGE</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="125" class="norm">Internal</td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">RAM</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Expandable</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from netNconn where net_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
  <span class="gnrl">INTERNET AND CONNECTIVITY</span> 
</p>
</p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">GPRS</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">EDGE</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">3G</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">WiFi</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">USB Connectivity</td>
    <td><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td class="norm">Tethering</td>
    <td><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td class="norm">Navigation</td>
    <td><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td class="norm">Bluetooth</td>
    <td><%=rs.getString(9)%></td>
  </tr>
  <tr>
    <td class="norm">Audio Jack</td>
    <td><%=rs.getString(10)%></td>
  </tr>
  <tr>
    <td class="norm">DLNA</td>
    <td><%=rs.getString(11)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from MULTIMEDIA where media_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MULTIMEDIA</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="127" class="norm">Music Player</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Video Player</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">FM</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from OTHERS where other_id=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">OTHERS</span> </p>
<table width="627" border="1" cellspacing="0">
  <tr>
    <td width="141" class="norm">SAR value</td>
    <td width="476"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Sensors</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Additional Features</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
</body>
</html>