package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.ProductMapper;
import domain.Product;

/**
 * Servlet implementation class InventoryManager
 */
@WebServlet("/InventoryManager")
public class InventoryManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id = request.getParameter("pid");
		System.out.println("The id is " + id);
		String productCategory = request.getParameter("productCategory");
		String productName = request.getParameter("productName");
		String productCondition = request.getParameter("productCondition");
		String productConsole = request.getParameter("productConsole");
		System.out.println("The console is " + productConsole);
		String productType = request.getParameter("productType");
		String productQuantity = request.getParameter("productQuantity");
		String productPrice = request.getParameter("productPrice");
		String releaseDate = request.getParameter("productRelease");
		System.out.println("The release date is " + releaseDate);
		String version = request.getParameter("productVersion"); 
		System.out.println("The version is " + version);
		
		
		ProductMapper pm;
		//get sessions product mapper if it exists
		if(request.getSession().getAttribute("productMapper") == null){
			pm = new ProductMapper();
			request.getSession().setAttribute("productMapper", pm);
		} else {
			pm = (ProductMapper) request.getSession().getAttribute("productMapper");
		}
		
		
		Product updateProduct = new Product(Long.valueOf(id), productName, Integer.valueOf(productCategory), 
				Integer.valueOf(productType),Integer.valueOf(productCondition),Integer.valueOf(productConsole),
				Integer.valueOf(productQuantity), Double.valueOf(productPrice), releaseDate, Integer.valueOf(version));
		
		try {
			int updateResult = pm.update(updateProduct);
			System.out.println("The update result is " + updateResult);
			
			if(updateResult==0){
				Product correctProduct =  pm.find(Long.valueOf(id));
				request.setAttribute("correctProduct", correctProduct);
			}
			request.setAttribute("updateOK", updateResult);
			request.getRequestDispatcher("editProductDetail.jsp").forward(request, response);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
