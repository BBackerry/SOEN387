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
import enumTables.*;
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
		if(request.getParameter("createAccount")!=null){
			request.setAttribute("country", Country.values());
			request.setAttribute("province", Province.values());
			request.getRequestDispatcher("createAccount.jsp").forward(request, response);
			return;
		}
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
				
				request.getSession().setAttribute("customer", c);
				
				if(request.getParameter("redirect") != null  && !request.getParameter("redirect").equals("null")) {
					String redirect = (String)request.getParameter("redirect");
					request.getRequestDispatcher(redirect).forward(request, response);
				}
				else if(c.getCategory().compareToIgnoreCase("manager")==0){
					request.getSession().setAttribute("user", c);
					request.getSession().setAttribute("country", Country.values());
					request.getSession().setAttribute("province", Province.values());
					request.getSession().setAttribute("paymentType", PaymentType.values());
					request.getSession().setAttribute("productCategory", ProductCategory.values());
					request.getSession().setAttribute("productCondition", ProductCondition.values());
					request.getSession().setAttribute("productConsole", ProductConsole.values());
					request.getSession().setAttribute("productType", ProductType.values());
					request.getSession().setAttribute("status", Status.values());
					request.getRequestDispatcher("administration.jsp").forward(request, response);
					
				}else{
					//set customer to session
					request.getSession().setAttribute("customer", c);
					request.getSession().setAttribute("productCategory", ProductCategory.values());
					request.getSession().setAttribute("productCondition", ProductCondition.values());
					request.getSession().setAttribute("productConsole", ProductConsole.values());
					request.getSession().setAttribute("productType", ProductType.values());
					//Customer log in successfully, transfer to customer account page
					//request.getRequestDispatcher("account.jsp").forward(request, response);
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
				}
				
			}else{
				request.setAttribute("error", "Passoword is not correct");
				if(request.getParameter("redirect") != null && !request.getParameter("redirect").equals("null")) {
					String redirect = (String)request.getParameter("redirect");
					request.getRequestDispatcher(redirect).forward(request, response);
				}
				request.getRequestDispatcher("/includes/login.jsp").forward(request, response);
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
