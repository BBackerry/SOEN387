<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="includes/import.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script  type="text/javascript"  src="http://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script  type="text/javascript" src="js/bootstrap.min.js"></script>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<title>SOEN387  Project</title>
</head>
<body>

<div class="container">
	<jsp:include page="includes/header.jsp" />
	
    <div class="row">
       <jsp:include page="includes/sidebar.jsp"/>
       
       <div class="col-md-9" role="main">
       
       <div class="hero-unit">
       	<h3>Order Details:</h3>
       </div>
       <% 
    		Order order = (Order) request.getAttribute("order");
    		ArrayList<OrderLine> orderLines =  (ArrayList<OrderLine>) request.getAttribute("orderLines");
    		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
    	%>
    	<% if(order != null && orderLines != null) {%>		
	       <div>
				<table width="100%" border="1">
					<tr>	
						<th width="50%">Date</th>
						<th width="50%">Status</th>
					</tr>
					<tr>
						<td><%= sdf.format(order.getDate()) %></td>
						<td><%= Status.values()[order.getStatus()-1] %></td>
					</tr>
				</table>
				
				<table width="100%" border="1">
					<tr>	
						<th width="50%">Billing Address</th>
						<th width="50%">Shipping Address</th>
					</tr>
					<tr>
						<td>
							<% Address billAddress = order.getBill_address(); %> <br/>
							<%= billAddress.getStreet() %><br/>
							<% if(billAddress.getApt_suite_unit() != null) { %>
								apt/suite/unit:<%= billAddress.getApt_suite_unit() %><br/>
							<% } %>
							<%= billAddress.getCity() %>&nbsp;<%= billAddress.getPostal_code() %><br/>
							<%= Province.values()[billAddress.getProvince()-1] %>&nbsp;<%= Country.values()[billAddress.getCountry()-1] %> 
						</td>
						<td>
							<% Address shipAddress = order.getShip_address(); %><br/>
							<%= shipAddress.getStreet() %><br/>
							<% if(billAddress.getApt_suite_unit() != null) { %>
								apt/suite/unit:<%= billAddress.getApt_suite_unit() %><br/>
							<% } %>
							<%= shipAddress.getCity() %>&nbsp;<%= shipAddress.getPostal_code() %><br/>
							<%= Province.values()[billAddress.getProvince()-1] %>&nbsp;<%= Country.values()[billAddress.getCountry()-1] %> 
						</td>
					</tr>
				</table>
				
				<table width="100%" border="1">
					<tr>	
						<th width="50%">Payment Type</th>
						<th width="30%">Credit Card Number</th>
						<th width="20%">Total</th>
					</tr>
					<tr>
						<td> <%= PaymentType.values()[order.getPayment_type()-1] %></td>
						<td><% if( order.getCredit_number() == null ) { %>
								 N/A
							<% } else { 
							  		String credit = "XXXX-XXXX-XXXX-"+order.getCredit_number().substring(12);
							%>
								<%= credit %>
							<% } %>
						<td><%= order.getTotal() %></td>
					</tr>
				</table>
				
				<table width="100%" border="1">
					<tr>	
						<th>Product Title</th>
						<th>Product Condition</th>
						<th>Product's Console</th>
						<th>Product Quantity</th>
						<th>Product Price</th>
						<th>Line Total</th>
					</tr>
					<% for(OrderLine ol : orderLines) {
						Product p = ol.getProduct();
					%>
					<tr>	
						<td><%= p.getP_title() %></td>
						<td><%= ProductCondition.values()[p.getP_condition()-1] %></td>
						<td><%= ProductConsole.values()[p.getP_console()-1] %></td>
						<td><%= ol.getQuantity() %></td>
						<td><%= ol.getPrice() %></td>
						<td><%= ol.getLine_total() %></td>
					</tr>
					<%} %>
					<tr>	
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>	
						<td>Total:</td>
						<td><%= order.getTotal() %></td>
					</tr>
				</table>
	       </div>
       <% } else { %>
       	   <div>
       	   		<p style="color:red">
					 There is an issue with the server's getting order details.
					 <br/>
					 Please try again or contact the site administrator if the problem persists.
				</p>
       	   </div>
       <% } %>
       </div>
    </div>
</div>

</body>
</html>