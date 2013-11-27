<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="includes/import.jsp" %>
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
       	<h3>Order History:</h3>
       </div>
       
       <div>
			<% ArrayList<Order> orderList =  (ArrayList<Order>) request.getAttribute("order");
	
			if(orderList != null){ 
				SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				DecimalFormat df = new DecimalFormat("'$'0.00");
			%>
				<table border="1">
					<tr>	
						<th width="200px">Date</th>
						<th width="100px">Status</th>
						<th width="200px">Payment Type</th>
						<th width="200px">Total</th>
					</tr>
					<%for(Order o : orderList) {%>
					<tr>
						<% String url = request.getContextPath()+"/OrderDetails?o_id="+o.getId(); %>
						<td><a href="<%=url%>"> <%= sdf.format(o.getDate()) %> </a></td>
						<td><%= Status.values()[o.getStatus()-1] %></td>
						<td><%= PaymentType.values()[o.getPayment_type()-1] %></td>
						<td><%= df.format(o.getTotal()) %></td>
					</tr>
					<% } %>
				</table>
			<% } %>
       </div>
       
       </div>
    </div>
</div>

</body>
</html>