package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		
		//request.setAttribute("productCondition", productCondition);
		//request.setAttribute("productType", productType);
		//request.setAttribute("productConsole", productConsole);
		//request.setAttribute("productCategory", productCategory);
		
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
