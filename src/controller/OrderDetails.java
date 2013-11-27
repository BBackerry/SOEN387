package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Customer;
import domain.Order;
import domain.OrderLine;
import dataMapper.CustomerMapper;

/**
 * Servlet implementation class OrderDetails
 */
@WebServlet("/OrderDetails")
public class OrderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerMapper cm;
		//get sessions customermapper if it exists
		if(request.getSession().getAttribute("customerMapper") == null){
			cm = new CustomerMapper();
			request.getSession().setAttribute("customerMapper", cm);
		} else {
			cm = (CustomerMapper) request.getSession().getAttribute("customerMapper");
		}
		try {
			//get customer in session
			Customer c =(Customer)request.getSession().getAttribute("customer");
			//get orderlist through lazy load
			ArrayList<Order> orderList = (ArrayList<Order>) c.getOrders().getSource();
			
			//get the id of order being displayed
			long orderID = Long.parseLong(request.getParameter("o_id"));
			Order order = null;
			for(Order o: orderList){
				if (o.getId() == orderID){
					order = o;
					break;
				}
			}
			//get orderLines by order id
			ArrayList<OrderLine> orderLines = (ArrayList<OrderLine>) order.getOrderLines().getSource();
			
			//set attributes for OrderDetails page
			request.setAttribute("order", order);
			request.setAttribute("orderLines", orderLines);
			
			forward("orderDetails.jsp", request, response);
		} catch (Exception e) {
			request.setAttribute("error", "orderDetails");
			forward("orderDetails.jsp", request, response);
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

}
