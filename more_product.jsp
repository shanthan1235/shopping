         <%@page import="java.sql.*" %>
<html>
<head>
<title>Online Shopping App</title>
<% String email=(String)session.getAttribute("email");
	String type=(String)session.getAttribute("type");
%>
         <% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");

%> 
<style type="text/css">
.right {
	text-align: right;
}
#form1 {
	text-align: center;
}
.normal {
	text-align: left;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.unormal {
	font-family: Arial, Helvetica, sans-serif;
}
.center1 {	text-align: center;
}
</style>
</head>
<body bgcolor="lightgreen" background="">

<table width="993" height="330" border="0">
  <tr>
    <td width="205" height="89"><img src="head.png" width="249" height="88" alt="Logo" />
    <hr /></td>
    <td width="772"><table width="723" height="88" border="0">
      <tr>
        <td width="713" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> | 
        <% if(session.getAttribute("uname")==null) {
			%>
            <a href="login.jsp">Login</a> | <a href="register.jsp">Signup</a>
            <%} else {
				%>
               <%if(type.equals("user")){%> <b><font color="magenta">User :</font><%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
               
                </td>
      </tr>
<%
	if(type.equals("seller"))
	{
%>
	<tr><td class="right"><a href="sell_category.jsp">Add Product</a> | <a href="manage_product.jsp">Manage Product</a>| <a href="manage_issues.jsp">Manage Issues</a> | <a href="view_order.jsp">View Order</a> | <a href="seller_profile.jsp">Update Profile</a> | <a href="manage_feedback.jsp">Manage Feedback</a></td></tr>
<%
	}
	else if(type.equals("user"))
	{
%>
	<tr><td class="right"><a href="my_order.jsp">My Orders</a> | <a href="my_issue.jsp">My Issues</a> | <a href="user_profile.jsp">Update Profile</a> | <a href="user_feedback.jsp">Feedback</a></td></tr>
<%
	}
%>
<%}%>
      <tr>
        <td><form id="form1" name="form1" method="post" action="search.jsp">
          <input name="search" type="text" id="search" size="60" />
          <label>
            <input type="submit" name="submit" id="button" value="Search" />
          </label>
        </form></td>
      </tr>
    </table>
    <hr /></td>
  </tr>

  <tr>
    <td><table width="251" height="482" border="0">
      <tr>
        <td height="184"><table width="242" height="171" border="0">
          <tr>
            <td class="normal">PRODUCT BRANDS</td>
          </tr>
          <tr style="padding:2% 0 2% 0">
            <td style="padding:2% 0 2% 0"><a href="category.jsp?type=brand&category=Samsung" style="text-decoration:none;font-size:130%;font-weight:bold;">Samsung</a></td>
          </tr>
          <tr style="padding:2% 0 2% 0">
            <td style="padding:2% 0 2% 0"><a href="category.jsp?type=brand&category=Nokia" style="text-decoration:none;font-size:130%;font-weight:bold">Nokia</a></td>
          </tr>
          <tr style="padding:2% 0 2% 0">
            <td style="padding:2% 0 2% 0"><a href="category.jsp?type=brand&category=Sony" style="text-decoration:none;font-size:130%;font-weight:bold">Sony</a></td>
          </tr>
          <tr style="padding:2% 0 2% 0">
            <td style="padding:2% 0 2% 0"><a href="category.jsp?type=brand&category=HTC" style="text-decoration:none;font-size:130%;font-weight:bold">HTC</a></td>
          </tr>
          <tr style="padding:2% 0 2% 0">
            <td style="padding:2% 0 2% 0"><a href="category.jsp?type=brand&category=LG" style="text-decoration:none;font-size:130%;font-weight:bold">LG</a></td>
          </tr>
          <tr>
            <td><form action="more_product_brand.jsp" style="text-align:center">
            <input type="hidden" name="type" value="brand" /><input type="hidden" name="category" value="LG" /><input type="image" src="images/more.png" /></form></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="201"><table width="243" height="180" border="0">
          <tr>
            <td width="233" class="normal">PRODUCT TYPES</td>
          </tr>
          <tr style="padding:3% 0 3% 0">
            <td style="padding:3% 0 3% 0"><a href="category2.jsp?type=mtype&category=and" style="text-decoration:none;font-size:130%;font-weight:bold;">Android Phones</a></td>
          </tr>
          <tr style="padding:3% 0 3% 0">
            <td style="padding:3% 0 3% 0"><a href="category2.jsp?type=mtype&category=sma" style="text-decoration:none;font-size:130%;font-weight:bold;">SmartPhones</a></td>
          </tr>
          <tr style="padding:3% 0 3% 0">
            <td style="padding:3% 0 3% 0"><a href="category.jsp?type=mtype&category=dua" style="text-decoration:none;font-size:130%;font-weight:bold;">Dual Sim Phones</a></td>
          </tr>

        </table></td>
      </tr>
      
    </table></td>
<%
	ps=conn.prepareStatement("select * from mtable order by prod_id");
	rs=ps.executeQuery();
%>
    <td><table width="auto" height="684" border="0">


      <tr class="normal">
        <td height="31">BEST SELLING PRODUCT</td>
      </tr>
      <tr>
<%
	ps=conn.prepareStatement("select * from product_table order by prod_id desc");
	rs=ps.executeQuery();
%>
        <td height="261"><table width="auto" height="258" border="0">
          <tr>
<%
	int count3=0;
	while(rs.next())
	{
		count3++;
		if(count3==5){out.println("<tr></tr>");count3=1;}
		String prod_id=rs.getString(1);
		String model=rs.getString(2);
		String price=rs.getString(4);
		ps=conn.prepareStatement("select pic_name from item_pics where pic_id=?");
		ps.setString(1,prod_id);
		ResultSet rs2=ps.executeQuery();
		rs2.next();
		String pic_name=rs2.getString(1);
%>
            <td width="228" style="padding-left:30px"><table width="120" height="173" border="0" align="center">
              <tr>
                <td><form action="product2.jsp"> 
<input type="hidden" name="product" value="<%=prod_id%>"> 
<input name="buy" type="image" value="grand" src="images/<%=pic_name%>" width="200" height="100"> 
</form></td>
              </tr>
            </table>
              <p class="center1"><%=model%></p>
              <p class="center1">Rs. <%=price%></p>
            </td>
<%
rs2.close();
	}
rs.close();
ps.close();
conn.commit();
%>

          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
