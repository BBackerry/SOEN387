package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.ProductMapper;
import domain.Product;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ProductMapper pm;
		//get sessions product mapper if it exists
		if(request.getSession().getAttribute("productMapper") == null){
			pm = new ProductMapper();
			request.getSession().setAttribute("productMapper", pm);
		} else {
			pm = (ProductMapper) request.getSession().getAttribute("productMapper");
		}
		
		String productID = request.getParameter("pid");
		long id = Long.valueOf(productID); 
		
		
	
		int updateResult = pm.delete(id);
		
		request.setAttribute("deleteID", id);
		request.setAttribute("updateOK", updateResult);
		request.getRequestDispatcher("editProductList.jsp").forward(request, response);
		
		
		
		
	    
	
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doGet(request,response);
	}

}
