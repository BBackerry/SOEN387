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

import dataMapper.OrderMapper;
import domain.Order;

/**
 * Servlet implementation class EditOrder
 */
@WebServlet("/EditOrder")
public class EditOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOrder() {
        super();
    }

		private void forward(String target, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				RequestDispatcher dispatcher;
				dispatcher = request.getRequestDispatcher(target);
				dispatcher.forward(request, response);
			}
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String orderID = request.getParameter("orderID");
			OrderMapper om;
			if (request.getSession().getAttribute("orderMapper") == null){
				om = new OrderMapper();
				request.getSession().setAttribute("orderMapper", om);
			} else {
				om = (OrderMapper) request.getSession().getAttribute("orderMapper");
			}
			try{
				Order o = new Order();
				//Get orders from lazy load
				o = om.find(Long.valueOf(orderID));
				//Set attribute for view orders
				request.setAttribute("order", o);
				forward("editOrder.jsp", request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "editOrders");
				forward("editOrder.jsp", request, response);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
