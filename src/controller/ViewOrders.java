package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import domain.Order;
import domain.OrderLine;
import domain.Product;
import dataMapper.CustomerMapper;
import dataMapper.OrderMapper;
import dataMapper.ProductMapper;
import enumTables.ProductCategory;

/**
 * Servlet implementation class ShowOrders
 */
@WebServlet("/ViewOrders")
public class ViewOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	private void forward(String target, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			RequestDispatcher dispatcher;
			dispatcher = request.getRequestDispatcher(target);
			dispatcher.forward(request, response);
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderMapper om;
		if (request.getSession().getAttribute("orderMapper") == null){
			om = new OrderMapper();
			request.getSession().setAttribute("orderMapper", om);
		} else {
			om = (OrderMapper) request.getSession().getAttribute("orderMapper");
		}
		try{
			if(request.getSession().getAttribute("customer") == null){
				request.setAttribute("redirect", "ViewOrders");
				forward("login.jsp",request, response);
			} else { 
				Customer c = (Customer)request.getSession().getAttribute("customer");
				System.err.println(c.getId());
				
				if(c.getCategory().equals("manager")){
					List<Order> o = om.getAllOrders();
					request.setAttribute("order", o);
					forward("orderManagement.jsp", request, response);
				}
				else{
					List<Order> o = om.getOrdersByCustomerID(c.getId());
					request.setAttribute("order", o);
					forward("viewOrders.jsp", request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "viewOrders");
			forward("orderManagement.jsp", request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
