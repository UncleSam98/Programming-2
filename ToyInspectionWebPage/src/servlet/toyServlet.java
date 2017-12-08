package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class toyServlet
 */
@WebServlet("/toyServlet")
public class toyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public toyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	   // String base = "/jsp/";
	    String url = "/index.jsp";
	  //  String action = request.getParameter("action");
	/*    if (action != null) {
	        switch (action) {
	        case "search":
	          url = base + "SearchOutcome.jsp";
	          break;
	        case "selectCatalog":
	          url = base + "SelectCatalog.jsp";
	          break;
	        case "bookDetails":
	          url = base + "BookDetails.jsp";
	          break;
	        case "checkOut":
	          url = base + "Checkout.jsp";
	          break;
	        case "orderConfirmation":
	          url = base + "OrderConfirmation.jsp";
	          break;
	        default:
	          if (action.matches("(showCart|(add|update|delete)Item)"))
	            url = base + "ShoppingCart.jsp";
	          break;
	        }
	      }*/
	    RequestDispatcher requestDispatcher =
	      getServletContext().getRequestDispatcher(url);
	    requestDispatcher.forward(request, response);
	    }
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
