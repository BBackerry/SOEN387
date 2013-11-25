package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
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
		Product prod = null;
		ProductMapper pm = new ProductMapper();

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
			request.setAttribute("selectedProduct", prod);
			forward("viewProduct.jsp", request, response);
			return;
		}
		Map<Integer, String> productResults = new HashMap<Integer, String>();

		System.err.println("searchQuery: "+searchResults);
		String[] splitSearch = searchResults.split("\\s+");
		for(int i=0; i<splitSearch.length;i++){
		System.err.println(splitSearch[i]);
		productResults = pm.getAllProductsByName(splitSearch[i]);

		}
				
		Iterator i = productResults.entrySet().iterator();
	    while(i.hasNext()){
	        System.err.println(i.next());
	    }
	    
		request.setAttribute("resultMap", productResults);
	    forward("searchResults.jsp", request, response);
	    
		
		
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
