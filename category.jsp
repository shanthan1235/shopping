<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.right {text-align: right;
}
</style>
<link href="center.css" rel="stylesheet" type="text/css" />
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
  String pid=null;
  String category=request.getParameter("category");;
  String type=request.getParameter("type");
		 PreparedStatement ps;
        Connection con;
        ResultSet rs=null,rs1=null,rs2=null;
        con=(Connection)application.getAttribute("connection");
      
         Statement st=con.createStatement();
		if(type.equals("brand"));
		{
		ps=con.prepareStatement("select * from mtable where company=?");
		ps.setString(1,category.toLowerCase());
		}
		/*else if(type=="mtype")
		     {
				 if(category=="and")
				 {
					ps=con.prepareStatement("select * from platform where os like ?");
		ps.setString(1,"%Android%"); 
				 }
				 else if(category=="sma")
				 {
					 ps=con.prepareStatement("select * from mtable where price>=15000");
				 }
				 else if(category=="val")
				 {
					 ps=con.prepareStatement("select * from mtable where price<=10000");
				 }
				 else if(category=="win")
				 {
					 ps=con.prepareStatement("select * from platform where os=?");
		ps.setString(1,"%WP%");
				 }
				 else if(category=="dua")
				 {
					 ps=con.prepareStatement("select * from gnrl_specs where sim_type like ?");
		ps.setString(1,"%Dual%");
				 }
			 }*/
		 rs=ps.executeQuery();
		
		 %>

<p><table width="992" height="179" border="1">

  <%while(rs.next())
		 {%>
         <tr>
    <td width="185" height="173" class="center1">
    <% pid=rs.getString(1);
	ps=con.prepareStatement("select * from pics where pic_id=?");
		 ps.setString(1,pid);
		 rs1=ps.executeQuery();
		 while(rs1.next())
		 {
			 %>
    <table width="120" height="133" border="0" align="center">
              <tr>
                <td><form action="product.jsp"> 
<input type="hidden" name="product" value=<%=rs1.getString("pic_id")%>> 
<input name="buy" type="image" value="Image" src=<%="images/"+rs1.getString(2)%> width="73" height="105"> 
</form></td>
              </tr>
              <%}%>
      </table>
            <%
            ps=con.prepareStatement("select * from mtable where prod_id=?");
		 ps.setString(1,pid);
		 rs2=ps.executeQuery();
		 while(rs2.next())
		 {%>
              
              
                </td>
                <td width="791"><p><%=rs2.getString(3)%> <%=rs2.getString(2)%></p>
		   <p>Rs. <%=rs2.getString(4)%></p><%}%></td></tr><%}%>
                
  
 
  
</table>

</p>
</body>
</html>