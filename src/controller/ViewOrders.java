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
import dataMapper.OrderMapper;

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
			Order o = (Order) request.getSession().getAttribute("order");
			//Get orders from lazy load
			ArrayList<Order> orders = (ArrayList<Order>) o.getOrders().getSource();
			System.out.print(o);
			//Set attribute for view orders
			request.setAttribute("order", orders);
			forward("administration.jsp", request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "viewOrders");
			forward("administration.jsp", request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
