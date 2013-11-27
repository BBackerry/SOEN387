<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
       	<h3>Order information</h3>
       </div>
			       
			
			<%@include file="includes/import.jsp" %>
			<%@include file="includes/error.jsp" %>
			
			<%
				Customer c = (Customer) request.getSession().getAttribute("customer");
				Order order = (Order) request.getSession().getAttribute("order");
				ArrayList<OrderLine> orderLines = (ArrayList<OrderLine>) order.getOrderLines().getSource();
				SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				DecimalFormat df = new DecimalFormat("'$'0.00");
			%>
			
			<% if(c != null) {%>
				
			<table width="100%" border="1">
				<tr>	
					<th width="50%">Billing Address</th>
					<th width="50%">Shipping Address</th>
				</tr>
				<tr>
					<td>
						<%= order.getBill_address().getStreet() %><br/>
						<% if(order.getBill_address().getApt_suite_unit() != null) { %>
								<%= "apt/Suite/Unit:" + order.getBill_address().getApt_suite_unit() %><br/>
						<% } %>
						<%= order.getBill_address().getCity()%>,&nbsp;<%=order.getBill_address().getPostal_code()%><br/>
						<%= Province.values()[order.getBill_address().getProvince()-1]+", "+ Country.values()[order.getBill_address().getCountry()-1] %><br/>
						<br/>
						<a href="CheckOut?step=billAddress">Change Billing Address</a>
					</td>
					<td>
						<%= order.getShip_address().getStreet() %><br/>
						<% if(order.getShip_address().getApt_suite_unit() != null) { %>
								<%= "apt/Suite/Unit:" + order.getShip_address().getApt_suite_unit() %><br/>
						<% } %>
						<%= order.getShip_address().getCity()%>,&nbsp;<%=order.getShip_address().getPostal_code()%><br/>
						<%= Province.values()[order.getShip_address().getProvince()-1]+", "+ Country.values()[order.getShip_address().getCountry()-1] %><br/>
						<br/>
						<a href="CheckOut?step=shipAddress">Change Shipping Address</a>
					</td>
				</tr>
			</table>
			
			<table width="100%" border="1">
				<% if(PaymentType.values()[order.getPayment_type()-1] == PaymentType.PAYPAL){ %>
					<tr><th>Payment Type</th></tr>
					<tr><td><%=PaymentType.PAYPAL %></td></tr>
					<tr><td><a href="CheckOut?step=payment">Change Payment Type</a></td></tr>
				<% } else { %>
					<tr>
						<th>Payment Type</th>
						<th>Name on card</th>
						<th>Card Number</th>
						<th>Expiration date</th>
					</tr>
					<tr>
						<td><%=PaymentType.values()[order.getPayment_type()-1] %></td>
						<td><%=request.getAttribute("cardName") %></td>
						<% String cardNumber = (String)order.getCredit_number(); %>
						<td><%="XXXX-XXXX-XXXX-"+cardNumber.substring(cardNumber.length()-4) %></td>
						<th><%=request.getAttribute("cardMonth")+"-"+request.getAttribute("cardYear") %></th>
					</tr>
					<tr><td colspan="3"><a href="CheckOut?step=payment">Change Payment Type</a></td></tr>
				<% } %>
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
					<td><%= df.format(ol.getLine_total()) %></td>
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
					<td><%= df.format(order.getTotal()) %></td>
				</tr>
			</table>
			<form action="CheckOut">
				<input type="hidden" name="step" value="processOrder">
			    <input class="btn btn-success" type="submit" value="Place Order">
			</form>
			<% } %>


       </div>
    </div>
</div>

</body>
</html>
