<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
<script language="JavaScript">
<!--Check whether text fields are filled-->
function isBlank(s){
	var i
	for (i=0; i<s.length; i++){
		if (s.charAt(i)!=" ")
			return false
}
   return true
}

function validate(fieldName, fieldValue) {
	if(isBlank(fieldValue)) {
		return false
	}
	return true
}

function formvalidate() {
	if (validate("customerName",document.checkout.customerName.value) &&  validate("cardNumber",document.checkout.cardNumber.value))
		{		
		return true
		}
		else
			{		
			alert("Please input both information")
			return false
			}
}


</script>
</head>
<body>
<%@page import="bookstore.*" %>
<%@page import="java.util.ArrayList" %>

	<%
		// Get the ShoppingCart object through the session object.
		// Put your code here
		ShoppingCart cart = (ShoppingCart)session.getAttribute("bookstore.cart");
		// Compute the total price of all books in the shopping cart
		double total = cart.getTotalPrice();
	%>
	Your total purchase is: <%=total %> <p></p>
	To purchase the item in your shopping cart, please provide us the following information:
	
	<form name="checkout" method="post" action="ReceiptServlet" onsubmit="return formvalidate()">
	<b>Name: </b> <input type="text" name="customerName" size=20 value="HU Ying"><br>
	<b>Credit Card Number</b><input type="text" name="cardNumber" size=16 value="14123204D"> <br>
	<input type="submit" value="Submit Information"> &nbsp; &nbsp; 
	<input type="button" value="Cancel" onClick="JavaScript:window.location='show-order.jsp';">
	</form>	
	
</body>
</html>