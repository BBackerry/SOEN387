package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dataMapper.CustomerMapper;
import domain.Customer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		CustomerMapper cm;
		//get sessions customermapper if it exists
		if(request.getSession().getAttribute("customerMapper") == null){
			cm = new CustomerMapper();
			request.getSession().setAttribute("customerMapper", cm);
		} else {
			cm = (CustomerMapper) request.getSession().getAttribute("customerMapper");
		}
		try {
			//get the first customer
			//Customer c = cm.find(1);
			Customer c = cm.findByAccount(username);
			
			if(c.getPassword().compareTo(password)==0){
				
				if(c.getCategory().compareToIgnoreCase("manager")==0){
					request.getSession().setAttribute("user", c);
					
					request.getRequestDispatcher("administration.jsp").forward(request, response);
					
				}else{
					//set customer to session
					request.getSession().setAttribute("customer", c);
					//Customer log in successfully, transfer to customer account page
					request.getRequestDispatcher("account.jsp").forward(request, response);
				}
				
			}else{
				request.setAttribute("error", "Passoword is not correct");
				
			}
		
		
		} catch (Exception e) {
			request.setAttribute("error", "customerInfo");
			//forward("CustomerInfo.jsp", request, response);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
