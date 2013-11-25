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
       	<h3>Your shopping cart:</h3>
       </div>
       
       <div>
       <form role="form">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Qty</th>
						<th>Product</th>
						<th>Total Price</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="orderLine" items="${shoppingCart.getOrderLines().getSource()}">
					<tr>
						<td><input name="qty_${orderLine.product.id}" type="text" value="${orderLine.quantity}"/></td>
						<td><c:out value="${orderLine.product.p_title}"/></td>
						<td><c:out value="${orderLine.line_total}"/></td>
					</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<c:set var="orderTotal" value="${shoppingCart.getTotal()}" />
						<td><fmt:formatNumber value="${orderTotal}" type="currency"/></td>
					</tr>
				</tbody>
			</table>
			<button type="submit" name="action" value="updateQty" class="btn btn-default">Update Qty</button>
			<button type="submit" name="action" value="checkout" class="btn btn-default">Checkout</button>
	   </form>
       </div>
       
       </div>
    </div>
</div>

</body>
</html>