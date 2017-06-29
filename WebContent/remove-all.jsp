<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove All Items</title>
</head>
<body>
<%@page import="bookstore.*" %>
<%@page import="java.util.ArrayList" %>

	<%
		// Get the ShoppingCart object through the session object
		// Put your code here
        ShoppingCart cart=(ShoppingCart)session.getAttribute("bookstore.cart");
		// Remove all books in the shopping cart
		// Put your code here
       cart.clear();
	%>
	<jsp:forward page="show-order.jsp"/>

</body>
</html>