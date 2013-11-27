package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Product;
import dataMapper.ProductMapper;
/**
 * Servlet implementation class SearchResults
 */
@WebServlet("/SearchResults")
public class SearchResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResults() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String selectedProduct = request.getParameter("productSelected");
		String searchResults = request.getParameter("customerSearch");
		String adminSearch = request.getParameter("adminSearch");
		Product prod = null;		
		ProductMapper pm;
		//get sessions product mapper if it exists
		if(request.getSession().getAttribute("productMapper") == null){
			pm = new ProductMapper();
			request.getSession().setAttribute("productMapper", pm);
		} else {
			pm = (ProductMapper) request.getSession().getAttribute("productMapper");
		}
	
		if(selectedProduct!=null){
			System.err.println(selectedProduct);
			try {
				prod = pm.find(Long.parseLong(selectedProduct));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("product", prod);
			forward("viewProduct.jsp", request, response);
			//return;
		}
		
		if(adminSearch!=null){
			System.err.println("Admin search query"+adminSearch);
			try {
				prod =pm.find(Long.valueOf(adminSearch));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("product", prod);
		    forward("viewProduct.jsp", request, response);
			
			
		}
		
		if(searchResults!=null){
			
			List<Product> productResults = null;	

			String[] splitSearch = searchResults.split("\\s+");
			for(int i=0; i<splitSearch.length;i++){
			System.err.println(splitSearch[i]);
			productResults = pm.getAllProductsByName(splitSearch[i]);
			}
			
			request.setAttribute("product", productResults);
		    forward("searchResults.jsp", request, response);
		    
			}
		
	}
	
	private void forward(String target, HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher(target);
		dispatcher.forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
