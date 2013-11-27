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
       

		<%@include file="includes/import.jsp" %>
		<%@include file="includes/error.jsp" %>
			
       
       <div class="hero-unit">
       	<h3>Select a Payment Method:</h3>
       </div>
       







		
		<hr/>
		<div id="CreditCard">
			<form class="form-horizontal" action="CheckOut" method="post">
				<input type="hidden" name="step" value="confirmOrder">
				<input type="hidden" name="method" value="credit">
				<div> Enter your credit card information:</div>
				<br/>
				<table>
					<tr>
						<th>Payment Type</th>
						<th>Name on card</th>
						<th>Card Number</th>
						<th>Expiration date (MM/YYYY)</th>
					</tr>
					<tr>
						<td>
							<select name="creditType" id="creditType">
								<% for(int i = 0; i<PaymentType.values().length-1; i++){ %>
									<option value="<%= i %>"><%=PaymentType.values()[i]%></option>
								<% } %>
							</select>
						</td>
						<td><input type="text" id="cardName" name="cardName" data-validate="required"></input></td>
						<td><input type="text" id="cardNumber" name="cardNumber" data-validate="required,number,size(16)" ></input></td>
						<td>
					        <div class="form-inline">
					            <div class="col-md-4">
								 <input type="text" class="form-control small"  id="cardMonth" name="cardMonth" maxlength="2" data-validate="required,number,rangeVal(1,12)"></input> &nbsp;
								</div>
								 
								<div class="col-md-4">
+								 <input type="text" class="form-control small" id="cardYear" name="cardYear" maxlength="4" data-validate="required,number,rangeVal(2013,3000)"></input>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<br/>
				<button type="submit" class="btn btn-success" name="selectCreditPayment">Pay with this credit card</button>	
			</form>
		</div>
		<hr/>
		<br/>
		<form action="CheckOut" method="post">
			<input type="hidden" name="step" value="confirmOrder">
			<input type="hidden" name="method" value="paypal">
		    <input type="submit" value="Pay With PayPal">
		</form>




       </div>
    </div>
</div>

</body>
</html>