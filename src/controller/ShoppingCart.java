package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
		
		if (action.equals("addOrderLine"))
		{
			ProductMapper productMapper = new ProductMapper();
			int p_id = Integer.parseInt(request.getParameter("p_id"));
			Product p;
			try {
				p = productMapper.find((long)p_id);
				if (!containsProduct(o, p)) {
					OrderLine ol = new OrderLine(p_id, 1, p.getP_price(), p.getP_price(), p);
					o.getOrderLines().getSource().add(ol);
					request.getSession().setAttribute("shoppingCart", o);
				}
				else {
					for(OrderLine ol : o.getOrderLines().getSource()) {
						if (ol.getP_id() == p.getId())
							ol.setQuantity(ol.getQuantity() + 1);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			o.updateTotal();

			request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		}
		
		if (action.equals("updateQty"))
		{
			Map<Integer, Integer> newQty = new HashMap<Integer, Integer>();
			Enumeration<String> allParams = request.getParameterNames();
			while(allParams.hasMoreElements()) {
				String paramName = (String) allParams.nextElement();
				if (paramName.contains("qty_")) {
					String[] parsedParam = paramName.split("_");
					int p_id = Integer.parseInt(parsedParam[1]);
					int qty = Integer.parseInt(request.getParameter(paramName));
					newQty.put(p_id, qty);
				}
			}
			
			try {
				for(OrderLine ol : o.getOrderLines().getSource()) {
					ol.setQuantity(newQty.get((int)ol.getP_id()));
				}
				o.updateTotal();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("shoppingCart.jsp").forward(request, response);
		}
		
		if (action.equals("checkout"))
		{
			request.getRequestDispatcher("CheckOut.jsp?step=ShippingAddress").forward(request, response);
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
