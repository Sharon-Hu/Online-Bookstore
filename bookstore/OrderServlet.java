package bookstore;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/show-order.jsp";
		ShoppingCart cart;
		ArrayList<Book> books;
		
		// Get the session object, making sure that the user cannot access this servlet directly
		// If the user attempts to accesses this servlet directly, forward the user to he/she
		// SearchBook.html.
		HttpSession session = request.getSession(false);
		if (session == null) {
			System.out.println("Forward to SearchBook.html");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SearchBook.html");
			dispatcher.forward(request, response);
			System.out.println("Forwarded to SearchBook.html; note that doGet() is still running");
			return;			// Need to return doGet() to prevent the codes below this line from running
		}  	
		
		// Get the ShoppingCart object (namely cart) from the session object. 
		// If cart is null, create a new ShoppingCart object and create an
		// association between the String "bookstore.cart" and the newly created object.
		// Put your code here
        cart = (ShoppingCart)session.getAttribute("bookstore.cart");
        if (cart == null)
        {
        	cart = new ShoppingCart();
        	session.setAttribute("bookstore.cart", cart);
        }
		// Get the ArrayList object (namely books) from the session object. This ArrayList
		// object, which was created in QueryServlet.class, contains the book objects that
		// match the search criteria specified in SearchBook.html
		// Put your code here
        books = (ArrayList<Book>)session.getAttribute("foundBooks");
        
		
		// Get the index of the selected book from BookInfo.jsp
        int i = Integer.parseInt(request.getParameter("selectedBook"));
		// Add the the selected book object to the Shopping cart 
		// Put your code here
			cart.addBook(books.get(i));
			session.setAttribute("bookstore.cart", cart);
		// Forward the control to either show-order.jsp or SearchBook.html
		// Put your code here
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/show-order.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
