<%@ page import="java.sql.*,java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Contact us</title>
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
<hr/>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
<%!
	public String getDate()
	{
		SimpleDateFormat df=new SimpleDateFormat("dd-MMM-YYYY");
		String date=df.format(new java.util.Date()); 
		return date;
	}
%>
<%
        String m=null, mn=null;
	String email=(String)session.getAttribute("email");
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String issue=request.getParameter("issue");
	String date=getDate();

        PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        con=(Connection)application.getAttribute("connection");
       
          ps= con.prepareStatement("insert into user_issues values (?,?,?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setString(3,issue);
            ps.setString(4,date);
            ps.setString(5,"received");
            ps.setString(6,email);


             int insertResult = ps.executeUpdate();
             if (insertResult!=0)
            {
		out.println("<b><h4>Contact Us</h4></b><br><br>");
                 out.println("Thanks For Submitting Your Query. We'll Respond to You within 2 hours.");
            }          
        %>
</body>
</html>