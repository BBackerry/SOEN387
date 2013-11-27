package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.ProductMapper;
import domain.Order;
import domain.OrderLine;
import domain.Product;

/**
 * Servlet implementation class ShoppingCart
 */
@WebServlet("/ShoppingCart")
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCart() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		Order o = (Order) request.getSession().getAttribute("shoppingCart");
		if (o == null) { 
			o = new Order(-1);
			request.getSession().setAttribute("shoppingCart", o);
		}
		
		if (action == null) {
			request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		}
		
		else if (action.equals("addOrderLine"))
		{
			ProductMapper productMapper = new ProductMapper();
			List<String> errorMessages = new ArrayList<String>(1);
			int p_id = Integer.parseInt(request.getParameter("p_id"));
			Product p;
			try {
				p = productMapper.find((long)p_id);
				if (p.getP_stock() > 0)
				{
					if (!containsProduct(o, p)) {
						OrderLine ol = new OrderLine(p_id, 1, p.getP_price(), p.getP_price(), p);
						o.getOrderLines().getSource().add(ol);
						request.getSession().setAttribute("shoppingCart", o);
					}
					else {
						for(OrderLine ol : o.getOrderLines().getSource()) {
							if (ol.getP_id() == p.getId()) {
								if (ol.getProduct().getP_stock() > ol.getQuantity()) {
									ol.setQuantity(ol.getQuantity() + 1);
								}
								else {
									errorMessages.add("Sorry but there is not enough items in stock for " + ol.getProduct().getP_title());
								}
							}
						}
					}
				}
				else {
					errorMessages.add("Sorry but there is not enough items in stock for " + p.getP_title());
				}
			} catch (SQLException e) {
				errorMessages.add("There seems to be a connectivity problem. Please try again later");
			}
			o.updateTotal();

			request.setAttribute("errorMessages", errorMessages);
			request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		}
		
		else if (action.equals("updateQty"))
		{
			Map<Integer, Integer> newQty = new HashMap<Integer, Integer>();
			Enumeration<String> allParams = request.getParameterNames();
			List<String> errorMessages = new ArrayList<String>(5);
			try {
				while(allParams.hasMoreElements()) {
					String paramName = (String) allParams.nextElement();
					if (paramName.contains("qty_")) {
						String[] parsedParam = paramName.split("_");
						int p_id = Integer.parseInt(parsedParam[1]);
						int qty = Integer.parseInt(request.getParameter(paramName));
						newQty.put(p_id, qty);
					}
				}
	
				for(OrderLine ol : o.getOrderLines().getSource()) {
					int qty = newQty.get((int)ol.getP_id());
					if (qty <= ol.getProduct().getP_stock()) {
						ol.setQuantity(qty);
					}
					else {
						errorMessages.add("Sorry, but there is not enough items in stock for " + ol.getProduct().getP_title());
					}
				}
				o.updateTotal();

			} catch (SQLException e) {
				errorMessages.add("There seems to be a connectivity problem. Please try again later");
			} catch (NumberFormatException e) {
				errorMessages.add("Sorry, but the quantity you entered doesn't seem to be a number");
			}

			request.setAttribute("errorMessages", errorMessages);
			request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		}
		
		else if (action.equals("emptyCart"))
		{
			try {
				o.getOrderLines().getSource().clear();
				o.updateTotal();

				request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		else if (action.equals("checkout"))
		{
			request.getRequestDispatcher("CheckOut?step=shipAddress").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private boolean containsProduct(Order o, Product p) {
		try {
			for(OrderLine ol : o.getOrderLines().getSource()) {
				if (ol.getP_id() == p.getId())
					return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
