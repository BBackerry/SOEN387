package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataMapper.AddressMapper;
import dataMapper.CustomerMapper;
import dataMapper.OrderMapper;
import domain.Address;
import domain.Customer;
/**
 * Servlet implementation class EditAccount
 */
@WebServlet("/EditAccount")
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerMapper cm;
		AddressMapper am;
		if (request.getSession().getAttribute("customerMapper") == null){
			cm = new CustomerMapper();
			request.getSession().setAttribute("customerMapper", cm);
		} else {
			cm = (CustomerMapper) request.getSession().getAttribute("customerMapper");
		}
		if (request.getSession().getAttribute("addressMapper") == null){
			am = new AddressMapper();
			request.getSession().setAttribute("addressMapper", am);
		} else {
			am = (AddressMapper) request.getSession().getAttribute("addressMapper");
		}

		if(request.getSession().getAttribute("customer") == null){
			request.setAttribute("redirect", "index.jsp");
			forward("login.jsp",request, response);	
		}else {
			Customer c = (Customer)request.getSession().getAttribute("customer");
			try {
				ArrayList<Address> addressList = (ArrayList<Address>)am.getAddressByCustomerID(c.getId());
				request.setAttribute("addressList", addressList);
				String step = request.getParameter("step");
				
				if(step.equals("display")){
					forward("editAccount.jsp", request, response);
				}
				else if(step.equals("addAddress")){
					String street = request.getParameter("street");
					String aptSuiteUnite = request.getParameter("aptSuiteUnit");
					String city = request.getParameter("city");
					String postal = request.getParameter("postal");
					int province = Integer.parseInt(request.getParameter("province"));
					int country = Integer.parseInt(request.getParameter("country"));
					
					Address address = new Address (street, postal, province, country, aptSuiteUnite, city);
					Long a_id = am.insert(address);
					am.insertCustomerAddress(a_id, c.getId());
					
					addressList = (ArrayList<Address>)am.getAddressByCustomerID(c.getId());
					request.setAttribute("addressList", addressList);
					request.setAttribute("msg", "The new address has been added.");
					forward("editAccount.jsp", request, response);
				}
				else if(step.equals("editAddress")){
					long a_id = Long.parseLong(request.getParameter("address"));
					Address address = am.find(a_id);
					request.setAttribute("address", address);
					
					forward("editAddress.jsp", request, response);
				}
				else if(step.equals("updateAddress")){
					String street = request.getParameter("street");
					String aptSuiteUnite = request.getParameter("aptSuiteUnit");
					String city = request.getParameter("city");
					String postal = request.getParameter("postal");
					int province = Integer.parseInt(request.getParameter("province"));
					int country = Integer.parseInt(request.getParameter("country"));
					long a_id = Long.parseLong(request.getParameter("a_id"));
					
					Address address = new Address (street, postal, province, country, aptSuiteUnite, city);
					address.setId(a_id);
					if(am.update(address) > 0){
						request.setAttribute("msg", "The Address has been successfully modified.");
					} else {
						request.setAttribute("error", "The Address was not successfully modified. Please try again later. ");
					}
					
					addressList = (ArrayList<Address>)am.getAddressByCustomerID(c.getId());
					request.setAttribute("addressList", addressList);
					forward("editAccount.jsp", request, response);
				}
				else if(step.equals("deleteAddress")){
					Long a_id = Long.parseLong(request.getParameter("address"));
					if(am.deleteCustomerAddress(a_id, c.getId())){
						if(am.delete(a_id) > 0){
							request.setAttribute("msg", "The Address has been successfully deleted.");
						}else {
							request.setAttribute("error", "The Address was not successfully deleted. Please try again later.");
						}
					}else {
						request.setAttribute("error", "The Address was not successfully deleted. Please try again later.");
					}
					
					addressList = (ArrayList<Address>)am.getAddressByCustomerID(c.getId());
					request.setAttribute("addressList", addressList);
					forward("editAccount.jsp", request, response);
				}
				else if(step.equals("editAccountPassword")){
			    	String oldPass = request.getParameter("oldPassword").trim();
			    	String newPass1 = request.getParameter("newPassword1").trim();
			    	String newPass2 = request.getParameter("newPassword2").trim();
			    	
			    	if(c.getPassword().equals(oldPass)){
			    		if(newPass1.equals(newPass2)){
			    			c.setPassword(newPass2);
			    			if(cm.update(c) >0){
			    				request.setAttribute("msg", "The password was successfully changed.");
			    				request.getSession().setAttribute("customer", c);
			    			}else{
			    				c.setPassword(oldPass);
			    				request.setAttribute("error", "The password was not changed. Please try again later.");
			    			}
			    		}else{
			    			request.setAttribute("error", "The password was not changed. The password was not re-entered correctly.");
			    		}
			    	}else{
			    		request.setAttribute("error", "The password was not changed. The old password is incorrect.");
			    	}
					forward("editAccount.jsp", request, response);
				}
				else if(step.equals("editAccountDetails")){
					String username = request.getParameter("username").trim();
			    	String firstname = request.getParameter("firstname").trim();
			    	String lastname = request.getParameter("lastname").trim();
			    	String bday = request.getParameter("bday").trim();
			    	String bmonth = request.getParameter("bmonth").trim();
			    	String byear = request.getParameter("byear").trim();
			    	String email = request.getParameter("email").trim();
			    
			    	Calendar cal = Calendar.getInstance();
					cal.set(Integer.parseInt(byear), Integer.parseInt(bmonth)-1, Integer.parseInt(bday));
					Date birthday = cal.getTime();
					
					c.setUsername(username);
					c.setF_name(firstname);
					c.setL_name(lastname);
					c.setDob(birthday);
					c.setEmail(email);
					
					if(cm.update(c) > 0){
						request.getSession().setAttribute("customer", c);
						request.setAttribute("msg", "The account information was succcessfully changed.");
					} else {
						c = cm.find(c.getId());
						request.getSession().setAttribute("customer", c);
						request.setAttribute("error", "The account information was not changed. Please try again later.");
					}
					forward("editAccount.jsp", request, response);
				}
				else {
					forward("accountOptions.jsp", request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	private void forward(String target, HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher dispatcher;
		dispatcher = request.getRequestDispatcher(target);
		dispatcher.forward(request, response);
	}
}
