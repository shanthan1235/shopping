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
	String form=mrequest.getParameter("form");
	String sim_type=mrequest.getParameter("sim_type");
	String touch_screen=mrequest.getParameter("touch_screen");
	String keypad=mrequest.getParameter("keypad");
	String sales_package=mrequest.getParameter("sales_package");
	String os=mrequest.getParameter("os");
	String java=mrequest.getParameter("java");
	String processor=mrequest.getParameter("processor");
	String type=mrequest.getParameter("type");
	String size=mrequest.getParameter("size");
	String resolution=mrequest.getParameter("resolution");
	String colors=mrequest.getParameter("colors");
	String primary=mrequest.getParameter("primary");
	String secondary=mrequest.getParameter("secondary");
	String flash=mrequest.getParameter("flash");
	String video_recording=mrequest.getParameter("video_recording");
	String other_features=mrequest.getParameter("other_features");
	String dim_size=mrequest.getParameter("dim_size");
	String weight=mrequest.getParameter("weight");
	String battery_type=mrequest.getParameter("battery_type");
	String capacity=mrequest.getParameter("capacity");
	String internal=mrequest.getParameter("internal");
	String ram=mrequest.getParameter("ram");
	String expandable=mrequest.getParameter("expandable");
	String gprs=mrequest.getParameter("gprs");
	String edge=mrequest.getParameter("edge");
	String threeG_4G=mrequest.getParameter("3g_4g");
	String wifi=mrequest.getParameter("wifi");
	String usb_connectivity=mrequest.getParameter("usb_connectivity");
	String tethering=mrequest.getParameter("tethering");
	String navigation=mrequest.getParameter("navigation");
	String bluetooth=mrequest.getParameter("bluetooth");
	String audio_jack=mrequest.getParameter("audio_jack");
	String dlna=mrequest.getParameter("dlna");
	String music_player=mrequest.getParameter("music_player");
	String video_player=mrequest.getParameter("video_player");
	String fm=mrequest.getParameter("fm");
	String sar_value=mrequest.getParameter("sar_value");
	String sensors=mrequest.getParameter("sensors");
	String additional_features=mrequest.getParameter("additional_features");
%>
<%
try{
	ps=conn.prepareStatement("insert into mtable(model,brand,price,company,seller,prod_date) values(?,?,?,?,?,?)");
	ps.setString(1,model);
	ps.setString(2,brand);
	ps.setString(3,price);
	ps.setString(4,company);
	ps.setString(5,email);
	ps.setString(6,date);
	ps.executeUpdate();

	ps=conn.prepareStatement("select max(prod_id) from mtable where seller=?");
	ps.setString(1,email);
	rs=ps.executeQuery();
	rs.next();
	String prod_id=rs.getString(1);
	ps=conn.prepareStatement("insert into pics values(?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,pic_name);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into gnrl_specs values(?,?,?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,form);
	ps.setString(3,sim_type);
	ps.setString(4,touch_screen);
	ps.setString(5,keypad);
	ps.setString(6,sales_package);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into platform values(?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,os);
	ps.setString(3,java);
	ps.setString(4,processor);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into display values(?,?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,type);
	ps.setString(3,size);
	ps.setString(4,resolution);
	ps.setString(5,colors);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into camera values(?,?,?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,primary);
	ps.setString(3,secondary);
	ps.setString(4,flash);
	ps.setString(5,video_recording);
	ps.setString(6,other_features);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into dimension values(?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,dim_size);
	ps.setString(3,weight);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into battery values(?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,battery_type);
	ps.setString(3,capacity);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into memory values(?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,internal);
	ps.setString(3,ram);
	ps.setString(4,expandable);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into netnconn values(?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,gprs);
	ps.setString(3,edge);
	ps.setString(4,threeG_4G);
	ps.setString(5,wifi);
	ps.setString(6,usb_connectivity);
	ps.setString(7,tethering);
	ps.setString(8,navigation);
	ps.setString(9,bluetooth);
	ps.setString(10,audio_jack);
	ps.setString(11,dlna);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into multimedia values(?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,music_player);
	ps.setString(3,video_player);
	ps.setString(4,fm);
	ps.executeUpdate();
	ps=conn.prepareStatement("insert into others values(?,?,?,?)");
	ps.setString(1,prod_id);
	ps.setString(2,sar_value);
	ps.setString(3,sensors);
	ps.setString(4,additional_features);
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