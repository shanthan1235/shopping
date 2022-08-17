   <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<%!
	public String getDate()
	{
		SimpleDateFormat df=new SimpleDateFormat("dd-MMM-YYYY");
		String date=df.format(new java.util.Date());
		return date;
	}
%>
<body>


<% 
       PreparedStatement ps;
        Connection conn;
        ResultSet rs= null;
        conn=(Connection)application.getAttribute("connection");
      
         Statement st=conn.createStatement();
%> 
<% 
boolean flag = false; 
String pay_mode=request.getParameter("optPaymentType");
String prod_id =(String)session.getAttribute("product"); 
String uname=(String)session.getAttribute("uname"); 
String email=(String)session.getAttribute("email"); 
String seller=(String)session.getAttribute("seller"); 
String address=(String)session.getAttribute("address");
String phone=(String)session.getAttribute("phone");
String current_location=(String)session.getAttribute("location");
String category=(String)session.getAttribute("product_type"); 
String date=getDate();
%>

<% 
 
String sql = "SELECT * from product_table where prod_id=?"; 


ps = conn.prepareStatement (sql); 
ps.setString (1,prod_id); 
rs = ps.executeQuery (); 
if (rs.next ()) { 
flag = true; 
 String model=rs.getString("model");
 String brand=rs.getString("brand");
 String specification=model+" "+brand;//rs.getString("specification");
 String price=rs.getString("price");
	price=""+(Integer.parseInt(price)+10); //10 rs is shipping charge

ps = conn.prepareStatement ("insert into payment(username,user_address,product_name,brand,specification,product_type,pay_amount,pay_mode,pay_date,seller,user_phone,user_email,current_location,ESTIMATED_ARRIVAL,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
ps.setString(1,uname);
ps.setString(2,address);
ps.setString(3,model);
ps.setString(4,brand);
ps.setString(5,specification);
ps.setString(6,category);
ps.setString(7,price);
ps.setString(8,pay_mode);
ps.setString(9,date);
ps.setString(10,seller);
ps.setString(11,phone);
ps.setString(12,email);
ps.setString(13,current_location);
ps.setString(14,"3");
ps.setString(15,"Confirmed. will be shipped soon");
ps.executeUpdate();

rs.close (); 
ps.close (); 
conn.commit ();
response.sendRedirect("orderconf2.jsp");
} else { 
	out.println("something went wrong");
}


%>

</body>
</html>