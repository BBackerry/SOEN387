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
		Connection connection;
		if(request.getSession().getAttribute("connection") == null){
			SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
			connection = sshSession.getConnection();
			request.getSession().setAttribute("connection", connection);
		}
		else{
			connection = (Connection)request.getSession().getAttribute("connection");
		}
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
		cal.set(bYear, bMonth, bDay);
		birthday = cal.getTime();
		
		String province = request.getParameter("provinceChoice");
		int provinceNum = 1;
		
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
		newCustomer = new Customer(fname, lname, birthday, email, username, password, "Customer");
		AddressMapper am = new AddressMapper(connection);
		CustomerMapper cm = new CustomerMapper(connection);
		try {
			System.out.println(newCustomer.getCategory()+newCustomer.getEmail());
			long newCID = cm.insert(newCustomer);
			System.err.println("createdCustomer");
			long newAID = am.insert(newAddress);
			//am.insertCustomerAddress( newAID, newCID);
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
				
//		try{
//			SSHjdbcSession sshSession = JdbcUtilViaSSH.getConnection();
//			Connection connection = sshSession.getConnection();			
//			String insertNewCustomer = "INSERT INTO Customer "+
//"(`first_name`,`last_name`,`dob`,`email`,`last_modified`,`username`,`password`,`category`) "+
//"VALUES(\""+fname+"\",\""+lname+"\",\""+birthday+"\",\""+email+"\",NOW(),\""+username+"\",\""+password+"\",\"customer\")";
//		    
//			
//			String recentCustomerKey = "SELECT last_insert_id()";
//			String insertCustomerAddress = "INSERT INTO Address "+
//					"(`street`,`postal_code`,`province`,`country`,`apt_suite_unit`,`last_modified`,`city`) "+
//					"VALUES("+
//					"\""+street+"\",\""+pcode+"\",\""+provinceNum+"\",\"1\",\""+aptNum+"\",NOW(),\""+city+"\""+
//					")";
//			
//			System.out.println("Inserting records into the table...");
//
//			newCustomerStatement = connection.createStatement();
//			newCustomerStatement.executeUpdate(insertNewCustomer);
//			
//			System.out.println("Inserted records into the table...");
//			connection.close();
//			request.getRequestDispatcher("index.jsp").forward(request, response);
//
//			
//			
//		}
//		
//		catch(Exception e){
//			e.printStackTrace();
//			throw new ServletException("SQL Error");
//		}
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
