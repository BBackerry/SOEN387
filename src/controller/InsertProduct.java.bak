package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.CustomerMapper;
import dataMapper.ProductMapper;
import domain.DomainObject;
import domain.Product;
import enumTables.ProductCategory;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/InsertProduct")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pCategory = request.getParameter("productCategory");
		String pName = request.getParameter("productName");
		String pType = request.getParameter("productType");
		String pConsole = request.getParameter("productConsole");
		String pCondition = request.getParameter("productCondition");
		String pQty = request.getParameter("productQuantity");
		String pPrice = request.getParameter("productPrice");
		Date date=new Date();
		Timestamp currentclock=new Timestamp(date.getTime());
		
		Product newProduct;
		
		int pCat = ProductCategory.valueOf(pCategory).ordinal()+1;
		if(pType==null)
			newProduct = new Product(pCat, pName, currentclock, 0, Integer.parseInt(pCondition), Integer.parseInt(pConsole),
					 Integer.parseInt(pQty),Double.parseDouble(pPrice));
		else{
			newProduct = new Product(pCat, pName, currentclock, Integer.parseInt(pType), Integer.parseInt(pCondition), Integer.parseInt(pConsole),
					 Integer.parseInt(pQty),Double.parseDouble(pPrice));
		}
		
	    ProductMapper mapper = new ProductMapper();
	    long newID;
	    try {
			newID = mapper.insert(newProduct) ;
			
			if(newID>0)
			    request.setAttribute("newID", newID);
			//System.out.println(newID);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    request.getRequestDispatcher("createProduct.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
