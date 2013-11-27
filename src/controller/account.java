package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Calendar;

import jdbcUtil.JdbcUtilViaSSH;
import jdbcUtil.SSHjdbcSession;
import domain.Address;
import domain.Customer;
import dataMapper.AddressMapper;
import dataMapper.CustomerMapper;
/**
 * Servlet implementation class account
 */
@WebServlet("/Account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		//Statement newCustomerStatement = null;
		
		Address newAddress;
		Customer newCustomer;
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String fname=request.getParameter("firstname");
		String lname=request.getParameter("lastname");
		String email=request.getParameter("email");
		int bYear = Integer.parseInt(request.getParameter("byear"));
		int bMonth = Integer.parseInt(request.getParameter("bmonth"));
		int bDay = Integer.parseInt(request.getParameter("bday"));
		Date birthday;
		Calendar cal = Calendar.getInstance();
		cal.set(bYear, bMonth-1, bDay);
		birthday = cal.getTime();
		
		String province = request.getParameter("provinceChoice");
		int provinceNum = 0;
		
		if (province.equalsIgnoreCase("alberta")) {
			provinceNum = 1;
		}
		else if (province.equalsIgnoreCase("british_columbia")) {
			provinceNum = 2;
		}
		else if (province.equalsIgnoreCase("ontario")) {
			provinceNum = 3;
		}
		else if (province.equalsIgnoreCase("quebec")) {
			provinceNum = 4;
		}
		else if (province.equalsIgnoreCase("nova_scotia")) {
			provinceNum = 5;
		}
		else if (province.equalsIgnoreCase("newfoundland_and_labrador")) {
			provinceNum = 6;
		}
		else if (province.equalsIgnoreCase("new_brunswick")) {
			provinceNum = 7;
		}
		else if (province.equalsIgnoreCase("prince_edward_island")) {
			provinceNum = 8;
		}
		else if (province.equalsIgnoreCase("manitoba")) {
			provinceNum = 9;
		}
		else if (province.equalsIgnoreCase("yukon_territory")) {
			provinceNum = 10;
		}
		else if (province.equalsIgnoreCase("northwest_territories")) {
			provinceNum = 11;
		}
		else if (province.equalsIgnoreCase("nunavut")) {
			provinceNum = 12;
		}
		else if (province.equalsIgnoreCase("saskatchewan")) {
			provinceNum = 13;
		}
		
		String street = request.getParameter("street");
		String pcode = request.getParameter("postalcode");
		String aptNum = request.getParameter("apt");
		String city = request.getParameter("city");
		
		newAddress = new Address(street, pcode, provinceNum, '1', aptNum, city);
		newCustomer = new Customer(fname, lname, birthday, email, username, password, "customer");
		AddressMapper am;
		CustomerMapper cm;
		if (request.getSession().getAttribute("addressMapper") == null){
			am = new AddressMapper();
			request.getSession().setAttribute("addressMapper", am);
		} else {
			am = (AddressMapper) request.getSession().getAttribute("addressMapper");
		}
		if (request.getSession().getAttribute("customerMapper") == null){
			cm = new CustomerMapper();
			request.getSession().setAttribute("customerMapper", cm);
		} else {
			cm = (CustomerMapper) request.getSession().getAttribute("customerMapper");
		}
		
		try {
			System.out.println(newCustomer.getCategory()+newCustomer.getEmail());
			long newCID = cm.insert(newCustomer);
			long newAID = am.insert(newAddress);
			if(newCID >0 && newAID>0){
				if(am.insertCustomerAddress( newAID, newCID)){
					request.setAttribute("msg", "The Account has been successfully created.");
				} else {
					request.setAttribute("error", "The Account was not created. Please try again later.");
				}
			} else {
				request.setAttribute("error", "The Account was not created. Please try again later.");
			}		
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
