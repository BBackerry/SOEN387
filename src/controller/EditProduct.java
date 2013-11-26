package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.ProductMapper;
import domain.Product;
import enumTables.ProductCategory;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProduct() {
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
		
	
		String pCategory = request.getParameter("productCategory"); 
		int pCat = ProductCategory.valueOf(pCategory).ordinal()+1;
		
		
		List<Product> productList = new ArrayList<Product>(); 
		productList = pm.findByProductCategory(pCat);
	
		
		request.setAttribute("productList", productList);
		request.getSession().setAttribute("productList", productList);
		
		//List<Product>
		request.getRequestDispatcher("editProductList.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
