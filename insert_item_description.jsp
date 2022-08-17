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
<%
	String email=(String)session.getAttribute("email");
	String category=(String)session.getAttribute("category");
%>
<%@ page language="java" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,java.sql.*,java.io.*,java.text.*" %> 
         <%@ page import="java.sql.DriverManager.*" %>
         <% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");
	conn.setAutoCommit(false);

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
      <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>
<%!
	public String getDate()
	{
		SimpleDateFormat df=new SimpleDateFormat("dd-MMM-YYYY");
		String date=df.format(new java.util.Date());
		return date;
	}
%>
<%
String date=getDate();
String path=application.getRealPath("/");
MultipartRequest mrequest= new MultipartRequest(request, path+"/images",8000000);
String pic_name=mrequest.getOriginalFileName("logo");
	String model=mrequest.getParameter("model");
	String brand=mrequest.getParameter("brand");
	String price=mrequest.getParameter("price");
	String company=mrequest.getParameter("company");
	String color=mrequest.getParameter("color");
	String specification=mrequest.getParameter("specification");

%>
<%
try{
	ps=conn.prepareStatement("insert into product_table(model,brand,price,company,color,specification,seller,category,prod_date) values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,model);
	ps.setString(2,brand);
	ps.setString(3,price);
	ps.setString(4,company);
	ps.setString(5,color);
	ps.setString(6,specification);
	ps.setString(7,email);
	ps.setString(8,category);
	ps.setString(9,date);
	ps.executeUpdate();

	ps=conn.prepareStatement("select max(prod_id) from product_table where seller=?");
	ps.setString(1,email);
	rs=ps.executeQuery();
	rs.next();
	String prod_id=rs.getString(1);
	ps=conn.prepareStatement("insert into item_pics values(?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,pic_name);
	ps.executeUpdate();

	rs.close();
	ps.close();
	conn.commit();
	//conn.setAutoCommit(true);
	response.sendRedirect("success.jsp");
}
catch(Exception e)
{
	out.println(e);
	conn.rollback();
}
%>
</body>
</html>