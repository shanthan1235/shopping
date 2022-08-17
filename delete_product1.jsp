<%@ page import="java.sql.*"%>
<%
	String pid=request.getParameter("pid");
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("delete mtable where prod_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
  
       	ps=con.prepareStatement("delete pics where pic_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
  
       	ps=con.prepareStatement("delete gnrl_specs where gs_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete platform where plat_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete display where disp_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete camera where cam_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete dimension where dim_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete battery where bat_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete memory where mem_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete netnconn where net_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete multimedia where media_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
       	ps=con.prepareStatement("delete others where other_id=?");
  
      	ps.setString(1,pid);
	ps.executeUpdate();
 
	response.sendRedirect("manage_product.jsp");
%>