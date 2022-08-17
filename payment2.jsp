<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%
	String type=(String)session.getAttribute("type");
	String email1=(String)session.getAttribute("email");
	String uname=(String)session.getAttribute("uname");
	String seller=(String)session.getAttribute("seller");

%> 
<html>
<HEAD>
<link href="italics.css" rel="stylesheet" type="text/css" />
<!--Applying styles for the page. -->
<SCRIPT language=Javascript>
<!--Verifying the fields that are left blank in the page.-->
function validation()
{
if(!((document.form1.optPaymentType[0].checked)||(document.form1.optPaymentType[1].checked)))
{
alert("Please Select the type of Payment you would like to go for.")
return false;
} 
if(document.form1.optPaymentType[1].checked)
{


if(document.form1.optPaymentType.value=="")
{
alert('Please select your payment method')
document.form1.optPaymentType.focus()
return false
}
else
{
return true
}
}
}
<!--Verifying the pincode field in the customer registration form for alphabets.-->
function checkno(t)
{
var s = t.value
if(isNaN(s))
{
alert('The pin code cannot have alphabets. Please type the numbers only.')
t.focus()
t.select()
}
return false
}
<!--Verifying the phone number field in the customer registration form for alphabets.-->
function checkphoneno(t)
{
var s = t.value
for(i=0;i<s.length;i++)
{
if((s.charCodeAt[i]>=65 && s.charCodeAt(i)<=91) || (s.charCodeAt(i)>=96 && s.charCodeAt(i)<=123))
{
alert('The phone number cannot have alphabets.')
t.focus()
t.select()
break
}
}
return false
}
<!--Verifying the payment mode field in the Payment Method form. -->
function checkpayment(t)
{
if(document.form1.optPaymentType[1].checked)
{
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
}

<!--Enabling the focus on certain fields, if the payment mode is cash. -->
if (t.value=="cash")
{
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is credit card. -->
if (t.value=="card")
{
document.form1.card_name.value=""
document.form1.card_name.disabled=false
document.form1.card_number.value=""
document.form1.card_number.disabled=false
document.form1.card_type[0].disabled=false
document.form1.card_type[1].disabled=false
document.form1.card_type[2].disabled=false
document.form1.card_type[3].disabled=false
document.form1.sl_month.disabled=false
document.form1.sl_year.disabled=false
}
}
<!--Verfying for the leap year. -->
function isLeapYear(Year) 
{
if(((Year%4)==0 ) && (((Year%100)!=0) || ((Year%400)==0)))
{
return (true);
}
else
{
return(false)
}
}

</SCRIPT>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" height="102" border="0">
  <tr>
    <td width="251" height="96"><img src="head.png" width="251" height="88" alt="Logo" /></td>
    <td width="726" class="right">24X7 Customer Support - <a href="contact.jsp">Contact us</a> | <a href="main.jsp">Home</a> |
      <% if(session.getAttribute("uname")==null) {
			%>
      <a href="login.jsp">Login</a>
      <%} else {
				%>
               <%if(type.equals("user")){%> User :<%=email1%><%}else{%><b><font color="red">Seller Account :</font></b><%=email1%> | <a href="sell_category.jsp">SELL</a> <%}%>  | <a href="logout.jsp">Logout</a>
      <%}%></td>
  </tr>
</table>



<table align=center border=0 cellpadding=0 cellspacing=0 width="98%" dwcopytype="CopyTableRow">
<tbody> 
<tr> 
<td colspan=2 valign=top> 
      <hr color=#c0003b size=1>
</td>
</tr>
<!-- Top hyperlink row ends. --> </tbody> 
</table>
<%

	
String name=uname;


%> <br>
<!--Designing the layout for the Payment Method form. -->
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Dear Customer <b><%=name%></b></font></div>
    	</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">
	<%
out.println("Your EmailId is <b>" +email1+"</b>");
out.println(".Please use Your Email id for further transactions.");
	%>
</font></div>
</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Please Choose Mode Of Payment of your choice:</font></div>
</td>
</tr>
</tbody> 
</table>
<br>
<form name="form1" action="order_submit2.jsp" method="post" >
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#c0003b"> 
<td colspan=2 height=2><font face="Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Payment Method</font></b> </font>
</td>
</tr>
<tr align=middle valign=top> 
<td colspan=2><font face="Arial, Helvetica, sans-serif" size="2"> 
<!--Designing the radio buttons for the payment mode in the Payment Method form. -->


<input name=optPaymentType onClick="return checkpayment(this)" type="radio" value="cash">Cash On Delivery
<input CHECKED name=optPaymentType onClick="return checkpayment(this)"  type="radio" value="card" >Credit/Debit Card</font></td>
<tr>  
</font></td>
<tr> 
<td align=right height=2 valign=center><font face="Arial, Helvetica, sans-serif" size="2">To :</font></td>
<td height=2> <font face="Arial, Helvetica, sans-serif" size="2"> 
      <input maxlength=43 name=gtl size=42 
      value="Seller: <%=seller%>">
      <script language=JavaScript>
document.form1.gtl.disabled=true
</script>
      </font></td>
<tr> 


<tr> 
<td align=right height=2 valign=bottom><font face="Arial, Helvetica, sans-serif"                    size=2> Cardholders Name </font></td>
<td height=2 valign=bottom> 
<input type="text"    name="card_name" size=18 required><font face=verdana size=1> As it appears on the card</font></td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                                 size=2>Card Number&nbsp;</font></td>
<td height=2 valign=bottom> 
<input  type="text" maxlength=16 name="card_number" size=18>
</td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                               size=2>Card Type</font></td>
<td height=2 valign=bottom> 
<input CHECKED name="card_type" type=radio value=VISA>
<font face="Arial, Verdana" size=2>Visa </font> 
<input name=card_type type=radio value=MC>
      <font face="Arial, Verdana" size=2>Master 
<input name=card_type type=radio      value=Amex>Amex 
<input name=card_type type=radio value=Diners>Diners</font></td>
</tr>
<tr> 
<td align=right height=2 valign=top><font                                face="Arial, Helvetica, sans-serif"                 size=2>Expiry Date </font></td>
<td height=2 valign=bottom><font face= "Arial, Helvetica, sans-serif" size="2"> 
      <select name="sl_month">
      <option selected value=1>1</option>
<option value=2>2</option>
      <option value=3>3</option>
      <option value=4>4</option>
<option value=5>5</option>
      <option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>
      <select name="sl_year">
<option selected      value=2004>2004</option>
<!—Providing the values for the field, sl_year. -->
      <option value=2005>2005</option>
<option value=2006>2006</option>

<option value=2025>2025</option>
      <option value=2026>2026</option>
</select>
      <br>
<font size="1">&nbsp; MM &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YY</font> </font></td>
<script language=JavaScript>
<!—Providing the default values for the Payment Method form. -->
document.form1.Payableat.value="Delhi"
document.form1.Location.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
</script>
</tr>
<tr> 
<td align=right height=2 valign=bottom colspan="2"><div align="center"><font color=#000099 face=Verdana,Arial size=-1> 
<input name=cmdSubmit onClick="return validation()" type=submit value="Submit Order" class=bu>
<input type=reset value=Reset name="reset" class=bu></font></div>
</td>
</tr>
</tbody> 
</table>
<hr color=#c0003b size=1>
</form>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<tbody> 
<tr> 
<td align=left valign=center height="35"> 
<p align=center><font face="Arial" size="1"> | <a class=copyright href="home.htm">HOME</a>&nbsp;| 
<a class=copyright href="mailto:info@investmentz.com">Contact us</a> &nbsp;| 
<a class=copyright href=privacy.htm>Privacy Policy</a> &nbsp;| 
<a class=copyright href="http://www.sebi.gov.in/">SEBI</a> &nbsp;| 
<a class=copyright 
href="http://www.nse-india.com/">NSE</a> | <br>Investmentz.com - Your currency for online trading &amp; e-broking in        India 
</font></p>
</td>
</tr>
</tbody> 
</table>
</body>
</html>
