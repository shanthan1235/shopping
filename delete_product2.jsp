<%@ page import="java.sql.*"%>
<%
	String pid=request.getParameter("pid");
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("delete product_table where prod_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
  
       	ps=con.prepareStatement("delete item_pics where pic_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
  

	response.sendRedirect("manage_product.jsp");
%>