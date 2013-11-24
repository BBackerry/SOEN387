package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enumTables.ProductCategory;
import enumTables.ProductCondition;
import enumTables.ProductConsole;
import enumTables.ProductType;

/**
 * Servlet implementation class CreateProduct
 */
@WebServlet("/CreateProduct")
public class CreateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String productCategory =  request.getParameter("productCategory");
		
		//ProductTypeMapper pm = new ProductTypeMapper();
		//ProductConditionMapper pcm = new ProductConditionMapper();
		//ProductConsoleMapper pcon = new ProductConsoleMapper();
		
		//List<String> productCondition=pcm.findAllProductCondition();
		//List<String> productType = pm.findAllProductType();
	    //List<String> productConsole = pcon.findAllProductConsole();
		
		//for(int i=0;i<productType.size();i++)
		//	System.out.println("The product type is "+ productType.get(i));
		
		
		//request.setAttribute("productCondition", ProductCondition.values());
		request.getSession().setAttribute("productCondition", ProductCondition.values());
		//request.setAttribute("productType", ProductType.values());
		request.getSession().setAttribute("productType", ProductType.values());
		//request.setAttribute("productConsole", ProductConsole.values());
		request.getSession().setAttribute("productConsole", ProductConsole.values());
		request.setAttribute("productCategory", productCategory);
		request.getSession().setAttribute("pCategory", ProductCategory.values());
	
		request.getRequestDispatcher("createProduct.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
