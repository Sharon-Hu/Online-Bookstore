<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Info.</title>
</head>
<body>

	<%@page import="java.util.ArrayList" %>
	<%@page import="java.util.Date" %>
	<%@page import="bookstore.*" %>
	<%
		ArrayList<Book> books = (ArrayList<Book>)session.getAttribute("foundBooks");
		int numBooks = books.size();
	%>
	<h3 >Student Name:HU Ying <br> Student ID:14123204D</h3>
	<center>The time now is: <%= new Date() %></center>
	
	<table align="center" border=1  >
	<tr>
		<th>ISBN</th>
		<th>Title</th>
		<th>Author</th>
		<th>Edition Number</th>
		<th>Publisher</th>
		<th>Copyright</th>
		<th>         </th>
	</tr>

	<% for (int i=0; i<numBooks; i++) { %>
	<tr>
		<th><% out.println(books.get(i).getIsbn());%></th>
		<th><% out.println(books.get(i).getTitle());%></th>
		<th><% out.println(books.get(i).getAuthor());%></th>
		<th><% out.println(books.get(i).getEdition());%></th>
		<th><% out.println(books.get(i).getPublisher());%></th>
		<th><% out.println(books.get(i).getCopyright());%></th>
		<th><a href="OrderServlet?selectedBook=<%= i %>">Add to Cart</a> 
	</tr>
	<% } %>
</table>
<center><A href="SearchBook.html">Home</A></center>
</body>
</html>