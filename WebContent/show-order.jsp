<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Order</title>
</head>
<body>

<%@page import="bookstore.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>

	<h3 >Student Name:HU Ying <br> Student ID:14123204D</h3>
	<center>The time now is: <%= new Date() %></center>
	<%
		// Get the shopping cart object. From the cart object, get the number of books
		// Put your code here
       ShoppingCart cart=(ShoppingCart)session.getAttribute("bookstore.cart");
	   int numBooks=cart.size();
	%>
	<p style="text-align: center;">
		You have <%= numBooks %> item(s) in your shopping cart <br> 
	</p>
	<% if (numBooks > 0) { %>	
		<table align="center" border=1  >
		<tr>
			<th></th>
			<th>Title</th>
			<th>Price</th>
		</tr>
		<% for (int i=0; i<numBooks; i++) { %>
				<tr>
					<td><%=i+1 %></td> 
					<!-- Get the title and price of the i-th book in the shopping cart -->
					<!-- Put your code here -->
					<td><% out.println(cart.getBook(i).getTitle()); %></td>
					<td><% out.println(cart.getBook(i).getPrice()); %></td>
				</tr>
		<% } %>
		<tr>
			<td></td>
			<td>Total:</td>
			<!-- Get the total price -->
			<!-- Put your code here -->
			<td><% out.println(cart.getTotalPrice()); %></td>
		</table>
	<% } %>	
	<center>
		<input type="button" value="Back" onClick="JavaScript:window.location='BookInfo.jsp';">
		<input type="button" value="Check Out" onClick="JavaScript:window.location='check-out.jsp';"> &nbsp; &nbsp;
		<input type="button" value="Remove All" onClick="JavaScript:window.location='remove-all.jsp';">
	</center>
	
	
</body>
</html>