package controller;

import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.AddressMapper;
import dataMapper.OrderMapper;
import dataMapper.ProductMapper;
import domain.Address;
import domain.Order;

/**
 * Servlet implementation class OrderManagement
 */
@WebServlet("/OrderManager")
public class OrderManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderMapper om;
		AddressMapper am;
		//get sessions product mapper if it exists
		if(request.getSession().getAttribute("orderMapper") == null){
			om = new OrderMapper();
			request.getSession().setAttribute("orderMapper", om);
		} else {
			om = (OrderMapper) request.getSession().getAttribute("orderMapper");
		}
		//get sessions product mapper if it exists
		if(request.getSession().getAttribute("addressMapper") == null){
			am = new AddressMapper();
			request.getSession().setAttribute("addressMapper", am);
		} else {
			am = (AddressMapper) request.getSession().getAttribute("addressMapper");
		}
		String order_id = request.getParameter("orderId");
		String c_id = request.getParameter("clientId");
		Date order_date = new Date(0);
		String total = request.getParameter("purchaseTotal");
		String credit_number = request.getParameter("creditNumber");
		if (credit_number.isEmpty()){ credit_number = "0";}
		String payment_type = request.getParameter("paymentType");
		String status = request.getParameter("status");
		String shipping_street = request.getParameter("shippingStreet");
		String shipping_postal_code = request.getParameter("shippingPCode");
		String shipping_province = request.getParameter("shippingProvince");
		String shipping_country = request.getParameter("shippingCountry");
		String shipping_appt = request.getParameter("shippingApt");
		if (shipping_appt.isEmpty()){shipping_appt = "None";}
		String shipping_city = request.getParameter("shippingCity");
		String billing_street = request.getParameter("billingStreet");
		String billing_postal_code = request.getParameter("billingPostalCode");
		String billing_province = request.getParameter("billingAddressProvince");
		String billing_country = request.getParameter("billingAddressCountry");
		String billing_appt = request.getParameter("billingApt");
		Date date = new Date();
		Timestamp currentClock = new Timestamp(date.getTime());
		String billing_city = request.getParameter("billingCity");
		String ship_id = request.getParameter("shippingId");
		String bill_id = request.getParameter("billingId");
		
		
		Address shippingAddress = new Address(Long.valueOf(ship_id),
				shipping_street,
				shipping_postal_code, 
				Integer.parseInt(shipping_province),
				Integer.parseInt(shipping_country),
				shipping_appt, 
				currentClock,
				shipping_city);
		
		Address billingAddress = new Address(Long.valueOf(bill_id),
				billing_street,
				billing_postal_code,
				Integer.parseInt(billing_province),
				Integer.parseInt(billing_country),
				billing_appt,
				currentClock,
				billing_city);
		
		
		Order updateOrder = new Order(Long.parseLong(order_id), 
				Integer.parseInt(c_id), 
				Double.parseDouble(total), 
				currentClock,
				Integer.valueOf(status),
				shippingAddress,
				billingAddress,
				Integer.valueOf(payment_type),
				credit_number);
		
		try {
			
			int updateResult = om.update(updateOrder);
			
			
			int updateBillAdrs = am.update(billingAddress);
			int updateShipAdrs = am.update(shippingAddress);
			
			if(updateResult > 0 && updateBillAdrs > 0 && updateShipAdrs >0){
				request.setAttribute("msg", "The order has been successfully updated.");
			} else {
				request.setAttribute("msg", "The order has not updated. Please try again later.");
			}
			
			request.setAttribute("orderId", order_id);
			request.getRequestDispatcher("orderEditConfirm.jsp").forward(request, response);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
