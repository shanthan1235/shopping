<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
	String type=(String)session.getAttribute("type");
	String email=(String)session.getAttribute("email");
%>
<style type="text/css">
.name {
	font-weight: bold;
	font-size: 36px;
}
.gnrl {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.center1 {
	text-align: center;
}
.center1 table {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	font-weight: bold;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-family: Arial, Helvetica, sans-serif;
}
.right {
	text-align: right;
}
.norm {
	font-family: Arial, Helvetica, sans-serif;
}
</style>
</head>

<body>
<table width="993" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
               <%if(type.equals("user")){%> User :<%=email%><%}else{%><b><font color="red">Seller Account :</font></b><%=email%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>
<hr />
<p>

<p class="name" style="text-align:center;font-family:arial">Product Description </p>

</p>
<form action="insert_mobile_description.jsp" enctype="multipart/form-data" method="post">
<table width="997" height="auto" border="0">
  <tr>
    <td width="358" class="center1">Select a Pic: <input type="file" name="logo" required/> </td>

    <td width="623" class="center1"><table width="466" height="200" border="0">
      <tr>
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><input type="text" name="model" required></td>
      </tr>
      <tr>
        <td class="center1">Brand :</td>
        <td><input type="text" name="brand" required></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><input type="text" name="price" required></td>
      </tr>
      <tr>
        <td class="center1">Company :</td>
        <td><input type="text" name="company" required></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<p class="gnrl">GENERAL FEATURES</p>

         <table width="630" border="0" cellspacing="0">
  <tr>
    <td width="127" class="norm">Form</td>
    <td width="493"><input type="text" name="form" required></td>
  </tr>
  <tr>
    <td class="norm">SIM Type</td>
    <td><input type="text" name="sim_type" required></td>
  </tr>
  <tr>
    <td class="norm">Touch Screen</td>
    <td><input type="text" name="touch_screen" required></td>
  </tr>
  <tr>
    <td class="norm">Keypad</td>
    <td><input type="text" name="keypad" required></td>
  </tr>
  <tr>
    <td class="norm">Sales Package</td>
    <td><input type="text" name="sales_package" required></td>
  </tr>
</table>
<p class="gnrl">

PLATFORM</p>
<table width="629" border="0" cellspacing="0">
  <tr>
    <td width="127" class="norm">OS</td>
    <td width="492"><input type="text" name="os" required></td>
  </tr>
  <tr>
    <td class="norm">Java</td>
    <td><input type="text" name="java" required></td>
  </tr>
  <tr>
    <td class="norm">Processor</td>
    <td><input type="text" name="processor" required></td>
  </tr>
</table>
<p class="gnrl">

DISPLAY</p>
<table width="629" border="0" cellspacing="0">
  <tr>
    <td width="127" class="norm">Type</td>
    <td width="492"><input type="text" name="type" required></td>
  </tr>
  <tr>
    <td class="norm">Size</td>
    <td><input type="text" name="size" required></td>
  </tr>
  <tr>
    <td class="norm">Resolution</td>
    <td><input type="text" name="resolution" required></td>
  </tr>
  <tr>
    <td class="norm">Colors</td>
    <td><input type="text" name="colors" required> MM</td>
  </tr>
</table>
<p class="gnrl">

CAMERA</p>
         <table width="628" border="0" cellspacing="0">
  <tr>
    <td width="126" class="norm">Primary</td>
    <td width="492"><input type="text" name="primary" required></td>
  </tr>
  <tr>
    <td class="norm">Secondary</td>
    <td><input type="text" name="secondary" required></td>
  </tr>
  <tr>
    <td class="norm">Flash</td>
    <td><input type="text" name="flash" required></td>
  </tr>
  <tr>
    <td class="norm">Video Recording</td>
    <td><input type="text" name="video_recording" required></td>
  </tr>
  <tr>
    <td class="norm">Other Features</td>
    <td><input type="text" name="other_features" required></td>
  </tr>
</table>
<p>

<span class="gnrl">DIMENSION</span> </p><table width="627" border="0" cellspacing="0">
  <tr>
    <td width="125" class="norm">Dim Size </td>
    <td width="486"><input type="text" name="dim_size" required></td>
  </tr>
  <tr>
    <td class="norm">Weight</td>
    <td><input type="text" name="weight" required></td>
  </tr>
</table>

<p>

<span class="gnrl">BATTERY</span> </p><table width="627" border="0" cellspacing="0">
  <tr>
    <td width="126" class="norm">Battery Type</td>
    <td width="485"><input type="text" name="battery_type" required></td>
  </tr>
  <tr>
    <td class="norm">Capacity</td>
    <td><input type="text" name="capacity" required></td>
  </tr>
</table>

<p>

<span class="gnrl">MEMORY AND STORAGE</span> </p>
<table width="627" border="0" cellspacing="0">
  <tr>
    <td width="125" class="norm">Internal</td>
    <td width="486"><input type="text" name="internal" required></td>
  </tr>
  <tr>
    <td class="norm">RAM</td>
    <td><input type="text" name="ram" required></td>
  </tr>
  <tr>
    <td class="norm">Expandable</td>
    <td><input type="text" name="expandable" required></td>
  </tr>
</table>
<p>

  <span class="gnrl">INTERNET AND CONNECTIVITY</span> 
</p>
</p>
<table width="627" border="0" cellspacing="0">
  <tr>
    <td width="127" class="norm">GPRS</td>
    <td width="484"><input type="text" name="gprs" required></td>
  </tr>
  <tr>
    <td class="norm">EDGE</td>
    <td><input type="text" name="edge" required></td>
  </tr>
  <tr>
    <td class="norm">3G/4G</td>
    <td><input type="text" name="3g_4g" required></td>
  </tr>
  <tr>
    <td class="norm">WiFi</td>
    <td><input type="text" name="wifi" required></td>
  </tr>
  <tr>
    <td class="norm">USB Connectivity</td>
    <td><input type="text" name="usb_connectivity" required></td>
  </tr>
  <tr>
    <td class="norm">Tethering</td>
    <td><input type="text" name="tethering" required></td>
  </tr>
  <tr>
    <td class="norm">Navigation</td>
    <td><input type="text" name="navigation" required></td>
  </tr>
  <tr>
    <td class="norm">Bluetooth</td>
    <td><input type="text" name="bluetooth" required></td>
  </tr>
  <tr>
    <td class="norm">Audio Jack</td>
    <td><input type="text" name="audio_jack" required></td>
  </tr>
  <tr>
    <td class="norm">DLNA</td>
    <td><input type="text" name="dlna" required></td>
  </tr>
</table>

<p>

<span class="gnrl">MULTIMEDIA</span> </p>
<table width="627" border="0" cellspacing="0">
  <tr>
    <td width="127" class="norm">Music Player</td>
    <td width="484"><input type="text" name="music_player" required></td>
  </tr>
  <tr>
    <td class="norm">Video Player</td>
    <td><input type="text" name="video_player" required></td>
  </tr>
  <tr>
    <td class="norm">FM</td>
    <td><input type="text" name="fm" required></td>
  </tr>
</table>
<p>

<span class="gnrl">OTHERS</span> </p>
<table width="627" border="0" cellspacing="0">
  <tr>
    <td width="141" class="norm">SAR value</td>
    <td width="476"><input type="text" name="sar_value" required></td>
  </tr>
  <tr>
    <td class="norm">Sensors</td>
    <td><input type="text" name="sensors" required></td>
  </tr>
  <tr>
    <td class="norm">Additional Features</td>
    <td><input type="text" name="additional_features" required></td>
  </tr>
</table>
<div style="text-align:center;"><input type="image" src="images/submit.jpg" width="200" height="50" alt="click to submit"></div>
</form>
</body>
</html>