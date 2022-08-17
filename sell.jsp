<%
	String category=request.getParameter("category");
	session.setAttribute("category",category);
	if(category.equals("mobile"))
		response.sendRedirect("sell_mobile_description.jsp");
	else
		response.sendRedirect("add_item_description.jsp");
%>