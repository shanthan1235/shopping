<jsp:include page="header.jsp"/>
<html>
<head>
<title>Online Shopping App</title>
<% String email=(String)session.getAttribute("email");
%>
</head>
<body>

<%@ page import="java.sql.*"%>
<div  style="color:white">
<%
	String msg="";
	msg=(String)session.getAttribute("msg");
if(msg==null) msg="";
%>
<p style="text-align:center"> <b><font color="blue"><%=msg%></font></b></p>
<%
session.setAttribute("msg","");
%>

</div>
<%
	
        Connection con=(Connection)application.getAttribute("connection");
        PreparedStatement ps=con.prepareStatement("select * from seller_info where email=?",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
  
      	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
  
	rs.next();
	String name=rs.getString(1);
	String dob=rs.getString(4);
	String add=rs.getString(5);
	String mobile=rs.getString(6);
	String location=rs.getString(7);
%>

<div id="wrapper"> 

  <div id="page_content"> 

    <div class="clear">

        <div style="margin:1px 200px 50px 500px; height: 500px; width:350px; border:2px solid white; background:grey;padding-top:0px">



           <h1 style="text-align:center"> My Profile<br />
               </h1>
<form action="seller_profile_update.jsp" method="post">
           <div style="text-align:center; height: 146px;">
  <div style="color:yellow">  	Email :</div><div style="display:inline;text-align:right"><input id="Text1" type="text" name="email" value="<%=email%>" readonly/><br /><br /></div>
    <div style="color:yellow">   Name:</div><div style="display:inline"><input type="text" name="name" value="<%=name%>" required/><br /></div><br />
    <div style="color:yellow">   Contact :</div><div style="display:inline"><input type="text" name="mobile" value="<%=mobile%>" required/><br /></div><br />
    <div style="color:yellow">   Date Of Birth :</div><div style="display:inline"><input type="text" name="dob" value="<%=dob%>" required/><br /></div><br />
    <div style="color:yellow">   Address :</div><div style="display:inline"><input type="text" name="add" value="<%=add%>" required/><br /></div><br />
    <div style="color:yellow">   Buisness Location :</div><div style="display:inline"><input type="text" name="location" value="<%=location%>" required/><br /></div><br />
         <br /><input id="Submit1" type="image" src="images/update.png" width="80" value="Update" />

		 
		<br />

           </div>
</form>        
      </div>
    
 
  </div>

</div>

</body></html>