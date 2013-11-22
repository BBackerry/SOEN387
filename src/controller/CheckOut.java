package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Address;
import domain.Customer;
import domain.Order;
import domain.OrderLine;
import domain.Product;
import dataMapper.AddressMapper;
import dataMapper.CustomerMapper;
import dataMapper.ProductMapper;

/**
 * Servlet implementation class ViewOrders
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerMapper cm = (CustomerMapper) getMapper(request,"customerMapper");
		AddressMapper am = (AddressMapper) getMapper(request,"addressMapper");
		ProductMapper pm = (ProductMapper) getMapper(request, "productMapper");
		try {
			if(request.getSession().getAttribute("customer") == null){
				request.setAttribute("redirect", "CheckOut");
				forward("/includes/login.jsp",request, response);
			}else {
				Customer c = (Customer) request.getSession().getAttribute("customer");
				//generate some Order
				Order o = new Order(c.getId());	
				ArrayList<OrderLine> orderLines = (ArrayList<OrderLine>) o.getOrderLines().getSource();
				Product p1 = pm.find((long)1);
				Product p2 = pm.find((long)2);
				Product p3 = pm.find((long)3);
				orderLines.add( new OrderLine(1, 1, p1.getP_price(), p1.getP_price()*1, p1));
				orderLines.add( new OrderLine(2, 5, p2.getP_price(), p2.getP_price()*5, p2));
				orderLines.add( new OrderLine(3, 9, p3.getP_price(), p3.getP_price()*9, p3));
				o.updateTotal();
				request.getSession().setAttribute("order", o);
				
				ArrayList<Address> address = (ArrayList<Address>) am.getAddressByCustomerID(c.getId());
				request.setAttribute("address", address);
				forward("CheckOutViewOrder.jsp", request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "viewOrders");
			forward("CheckOutViewOrder.jsp", request, response);
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
		doGet(request, response);
	}

	protected Object getMapper(HttpServletRequest request, String name){
		if(request.getSession().getAttribute(name) == null){
			createMapper(request, name);
		}
		return request.getSession().getAttribute(name);
	}

	private void createMapper(HttpServletRequest request, String name) {
		if(name.equals("customerMapper")){
			CustomerMapper cm = new CustomerMapper();
			request.getSession().setAttribute("customerMapper", cm);
		}
		else if(name.equals("addressMapper")){
			AddressMapper am = new AddressMapper();
			request.getSession().setAttribute("addressMapper", am);
		}
		else if(name.equals("productMapper")){
			ProductMapper pm = new ProductMapper();
			request.getSession().setAttribute("productMapper", pm);
		}
	}
}
