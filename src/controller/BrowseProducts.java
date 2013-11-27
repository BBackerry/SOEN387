package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.ProductMapper;
import domain.Product;
import enumTables.ProductCategory;
import enumTables.ProductCondition;
import enumTables.ProductConsole;
import enumTables.ProductType;

/**
 * Servlet implementation class BrowseProduct
 */
@WebServlet("/BrowseProducts")
public class BrowseProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrowseProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		ProductMapper pm = new ProductMapper();
		
		request.getSession().setAttribute("productCategory", ProductCategory.values());
		request.getSession().setAttribute("productCondition", ProductCondition.values());
		request.getSession().setAttribute("productConsole", ProductConsole.values());
		request.getSession().setAttribute("productType", ProductType.values());
		
		if (action == null) {
			List<Product> allProducts = pm.findAllProducts();
			request.setAttribute("allProducts", allProducts);
			request.getRequestDispatcher("browse.jsp").forward(request, response);
		}
		
		else if (action.equals("viewProduct")) {
			try {
				Product p = pm.find(Long.parseLong(request.getParameter("p_id")));
				request.setAttribute("product", p);
				request.getRequestDispatcher("viewProduct.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}