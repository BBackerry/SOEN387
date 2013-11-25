package controller;

import java.io.IOException;
import java.sql.SQLException;
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
import dataMapper.OrderLineMapper;
import dataMapper.OrderMapper;
import dataMapper.ProductMapper;
import enumTables.PaymentType;

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
		AddressMapper am = (AddressMapper) getMapper(request,"addressMapper");
		ProductMapper pm = (ProductMapper) getMapper(request, "productMapper");
		OrderMapper om = (OrderMapper) getMapper(request, "orderMapper");
		OrderLineMapper olm = (OrderLineMapper) getMapper(request, "orderLineMapper");
		try {
			if(request.getSession().getAttribute("customer") == null){
				request.setAttribute("redirect", "CheckOut?step=shipAddress");
				forward("/includes/login.jsp",request, response);
			}else {
				Customer c = (Customer) request.getSession().getAttribute("customer");
				
				if(request.getSession().getAttribute("order") == null){
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
				}
				
				if(request.getParameter("step").equals("billAddress")){
					retrieveCustomerAddress(request, am, c);
					
					if(request.getParameter("shipAddress") != null){
						Order order = (Order)request.getSession().getAttribute("order");
						Address shipAddress = am.find(Long.parseLong(request.getParameter("shipAddress")));
						order.setShip_address(shipAddress);
						request.getSession().setAttribute("order", order);
					}
					
					forward("CheckOutBillAddress.jsp",request, response);
				}
				else if(request.getParameter("step").equals("shipAddress")){
					retrieveCustomerAddress(request, am, c);
					forward("CheckOutShipAddress.jsp",request, response);
				}
				else if(request.getParameter("step").equals("payment")){
					if(request.getParameter("billAddress") != null){
						Order order = (Order)request.getSession().getAttribute("order");
						Address billAddress = am.find(Long.parseLong(request.getParameter("billAddress")));
						order.setBill_address(billAddress);
						request.getSession().setAttribute("order", order);
					}
					
					forward("CheckOutPayment.jsp",request, response);
				}	
				else if(request.getParameter("step").equals("confirmOrder")){
					Order order = (Order)request.getSession().getAttribute("order");
					
					if(request.getParameter("method").equals("paypal")){
						order.setPayment_type(PaymentType.valueOf("PAYPAL").ordinal()+1);
					} else {
						order.setPayment_type(Integer.parseInt(request.getParameter("creditType"))+1);
						order.setCredit_number(request.getParameter("cardNumber"));
					}
					request.getSession().setAttribute("order", order);
					request.setAttribute("cardName", request.getParameter("cardName"));
					request.setAttribute("cardMonth", request.getParameter("cardMonth"));
					request.setAttribute("cardYear", request.getParameter("cardYear"));
					
					forward("CheckOutViewOrder.jsp", request, response);
				}
				else if(request.getParameter("step").equals("processOrder")){
					Order order = (Order)request.getSession().getAttribute("order");
					Long o_id = om.insert(order);
					for(OrderLine ol : order.getOrderLines().getSource()){
						ol.setId(o_id);
						olm.insert(ol);
					}
					forward("CheckOutComplete.jsp", request, response);
				}
				else if(request.getParameter("step").equals("addShipAddress")){
					Address shipAddress = createAddressFromForm(request);
					Long id = am.insert(shipAddress);
					am.insertCustomerAddress(id, c.getId());
					shipAddress.setId(id);
					
					Order order = (Order)request.getSession().getAttribute("order");
					order.setShip_address(shipAddress);
					request.getSession().setAttribute("order", order);
					retrieveCustomerAddress(request, am, c);
					
					forward("CheckOutBillAddress.jsp", request, response);
				}
				else if(request.getParameter("step").equals("editShipAddress")){
					Long a_id = Long.parseLong(request.getParameter("address"));
					Address address = am.find(a_id);
					request.setAttribute("address", address);
					request.setAttribute("type", "doEditShipAddress");
					forward("includes/CheckOutAddressForm.jsp", request, response);
				}
				else if(request.getParameter("step").equals("doEditShipAddress")){
					retrieveCustomerAddress(request, am, c);
					
					Address shipAddress = createAddressFromForm(request);
					long a_id = Long.parseLong(request.getParameter("a_id"));
					shipAddress.setId(a_id);
					
					am.update(shipAddress);
					
					request.setAttribute("msg", "The Address has been edited.");
					retrieveCustomerAddress(request, am, c);
					forward("CheckOutShipAddress.jsp", request, response);
				}
				else if(request.getParameter("step").equals("deleteShipAddress")){
					Long a_id = Long.parseLong(request.getParameter("address"));
					if(am.deleteCustomerAddress(a_id, c.getId())){
						System.err.println(a_id);
						am.delete(a_id);
					}
					
					retrieveCustomerAddress(request, am, c);
					request.setAttribute("msg", "The Address has been deleted.");
					forward("CheckOutShipAddress.jsp", request, response);
				}
				else if(request.getParameter("step").equals("addBillAddress")){
					Address billAddress = createAddressFromForm(request);
					Long id = am.insert(billAddress);
					am.insertCustomerAddress(id, c.getId());
					billAddress.setId(id);
					
					Order order = (Order)request.getSession().getAttribute("order");
					order.setBill_address(billAddress);
					request.getSession().setAttribute("order", order);
					retrieveCustomerAddress(request, am, c);
					
					forward("CheckOutBillAddress.jsp", request, response);
				}
				else if(request.getParameter("step").equals("editBillAddress")){
					Long a_id = Long.parseLong(request.getParameter("address"));
					Address address = am.find(a_id);
					request.setAttribute("address", address);
					request.setAttribute("type", "doEditBillAddress");
					forward("includes/CheckOutAddressForm.jsp", request, response);
				}
				else if(request.getParameter("step").equals("doEditBillAddress")){
					Address billAddress = createAddressFromForm(request);
					long a_id = Long.parseLong(request.getParameter("a_id"));
					billAddress.setId(a_id);
					
					am.update(billAddress);
					request.setAttribute("msg", "The Address has been edited.");
					retrieveCustomerAddress(request, am, c);
					forward("CheckOutBillAddress.jsp", request, response);
				}
				else if(request.getParameter("step").equals("deleteBillAddress")){
					Long a_id = Long.parseLong(request.getParameter("address"));
					if(am.deleteCustomerAddress(a_id, c.getId())){
						am.delete(a_id);
					}
					
					retrieveCustomerAddress(request, am, c);
					request.setAttribute("msg", "The Address has been deleted.");
					forward("CheckOutBillAddress.jsp", request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "viewOrders");
			forward("CheckOutViewOrder.jsp", request, response);
		}
	}

	private void retrieveCustomerAddress(HttpServletRequest request,
			AddressMapper am, Customer c) throws SQLException {
		ArrayList<Address> address = (ArrayList<Address>) am.getAddressByCustomerID(c.getId());
		request.setAttribute("addressList", address);
	}

	private Address createAddressFromForm(HttpServletRequest request) {
		String street = request.getParameter("street");
		String aptSuiteUnite = request.getParameter("aptSuiteUnit");
		String city = request.getParameter("city");
		String postal = request.getParameter("postal");
		int province = Integer.parseInt(request.getParameter("province"));
		int country = Integer.parseInt(request.getParameter("country"));
		
		Address billAddress = new Address (street, postal, province, country, aptSuiteUnite, city);
		return billAddress;
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
		else if(name.equals("orderMapper")){
			OrderMapper om = new OrderMapper();
			request.getSession().setAttribute("orderMapper", om);
		}
		else if(name.equals("orderLineMapper")){
				OrderLineMapper olm = new OrderLineMapper();
				request.getSession().setAttribute("orderLineMapper", olm);
		}
	}
}
