<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>REG</title>
<style type="text/css">
.right {text-align: right;
}
</style>
</head>

<body>
 <%@ page language="java" %>
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
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
       
<%
        String m=null, mn=null;
        String s=request.getParameter("name");
        String s1=request.getParameter("id");
        String s2=request.getParameter("password");
        String day=request.getParameter("day");
        String month=request.getParameter("month");
        String year=request.getParameter("year");
	String date=day+"-"+month+"-"+year;
        String s4=request.getParameter("address");
		String s5=request.getParameter("phone");
	String location=request.getParameter("location");
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
       Class.forName("oracle.jdbc.driver.OracleDriver");
        con=(Connection)application.getAttribute("connection");
      
         Statement st=con.createStatement();
       
          ps= con.prepareStatement("insert into seller_info values (?,?,?,?,?,?,?)");
            ps.setString(1,s);
            ps.setString(2,s1);
            ps.setString(3,s2);
            ps.setString(4,date);
            ps.setString(5,s4);
           ps.setString(6,s5);
           ps.setString(7,location);
               int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
                 out.println("Seller Account Created Successfully");
            }          
        %>
        <br><hr>
               To Login <a href="seller_login.jsp">Click Here</a>
                <hr>
</body>
</html>