<%@ page import="java.sql.*"%>
<%
	String email=request.getParameter("email");
	String name=request.getParameter("name");	
	String mobile=request.getParameter("mobile");
	String dob=request.getParameter("dob");
	String add=request.getParameter("add");
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("update register1 set name=?,dob=?,address=?,phone=? where email=?");
  
      	ps.setString(1,name);
      	ps.setString(2,dob);
      	ps.setString(3,mobile);
      	ps.setString(4,add);
      	ps.setString(5,email);
	int i=ps.executeUpdate();
 

	if(i>0)
	{
		session.setAttribute("msg","Profile Updated Successfully");
		response.sendRedirect("user_profile.jsp");
	}
	else
	{
		session.setAttribute("msg","Profile Could not be Updated.");
		response.sendRedirect("user_profile.jsp");
	}
%>