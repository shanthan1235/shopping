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
        String consignment=request.getParameter("consignment");
        String location=request.getParameter("location");
        String arrival=request.getParameter("arrival");
        String status=request.getParameter("status");
        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        con=(Connection)application.getAttribute("connection");
      
         Statement st=con.createStatement();
       
          ps= con.prepareStatement("update payment set CURRENT_LOCATION=?,ESTIMATED_ARRIVAL=?,STATUS=? where pay_id=?");
            ps.setString(1,location);
            ps.setString(2,arrival);
            ps.setString(3,status);
            ps.setString(4,consignment);
               int insertResult = ps.executeUpdate();
            if (insertResult>0)
            {
                 //out.println("Seller Account Created Successfully");
		session.setAttribute("msg","Order Status Updated Successfully");
		response.sendRedirect("update_order_status_form.jsp?consignment="+consignment);
            }    
		else
		{
			session.setAttribute("msg","Could not update order status");
			response.sendRedirect("update_order_status_form.jsp?consignment="+consignment);
		}      
        %>
</body>
</html>