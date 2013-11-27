<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="includes/import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<%
	Customer c = (Customer) request.getSession().getAttribute("customer");
	if(c==null || !c.getCategory().equals("manager")){
		response.sendRedirect("index.jsp?error='You do not have access to the administration page.");
	}
%>

<div class="container">

    <!--/headerbar --> 
	<jsp:include page="includes/header.jsp" />
    <div class="row">
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
    	<div class="col-md-9" role="main">
    	<form action="OrderManager" class="form-horizontal" role="form" method="post">
			<input type="hidden" id="shippingId" name="shippingId" value="${order.ship_address.id}"/>
		    <input type="hidden" id="billingId" name="billingId" value="${order.bill_address.id}"/>
		    <input type="hidden" class="form-control" id="orderId" name="orderId" value="${order.id}">
		    <input type="hidden" class="form-control" id="clientId" name="clientId" value="${order.c_id}">
		    <input type="hidden" class="form-control" id="purchaseTotal" name="purchaseTotal" value="${order.total}">
    		<table>
    			<tr>
    				<td>
    					<label for="orderID" >Order ID</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="orderID" name="orderID" value="${order.id}" disabled>
    				</td>
    				<td><div style="width:200px"></div></td>
    				<td>
    					 <label for="orderID" >Client ID</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="clientID" name="clientID" value="${order.c_id}" disabled>
    				</td>
    			</tr>
    		</table>
    		<br/>
    		<br/>
    		<table width="80%">
    			<tr>
    				<td>
					    <label for="status" class="col-sm-6 control-label">Order Status</label>
					  </div>
    				</td>
    				<td>
					    <select class="form-control" name="status" id="status">
					    	<c:forEach items="${status}" var="stat" varStatus="loop">
					    	    <c:if test="${loop.count eq order.status}">
				   				    <option value="${loop.count}" selected="selected"><c:out value="${stat}"  /></option> 
                               </c:if>
                               <c:if test="${loop.count ne order.status}">
				   				    <option value="${loop.count}"><c:out value="${stat}" /></option> 
                               </c:if>
				 			</c:forEach>
				 		</select> 
    				</td>
    			</tr>
    		</table>
    		<br/>
    		<br/>
    		<table width="80%">
    			<tr>
    				<td>
    					<label for="date" class="col-sm-6 control-label">Date</label>
    				</td>
    				<td>
    					
    					  <input type="text" class="form-control" id="date" name="date" value="${order.date}" disabled>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="total" class="col-sm-6 control-label">Order Total</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="total" name="total" value="${order.total}" disabled>
    				</td>
    			</tr>
    		</table>
    		<br/>
    		<br/>	
    		<table width="80%">
    			<tr>
    				<td>
    					<label for="paymentType" class="col-sm-6 control-label">Payment Type</label>
    				</td>
    				<td>
   					 	<select class="form-control" name="paymentType" id="paymentType">
				    	<c:forEach items="${paymentType}" var="payment_type" varStatus="loop">
				    	    <c:if test="${loop.count eq order.payment_type}">
			   				    <option value="${loop.count}" selected="selected"><c:out value="${payment_type}"  /></option> 
                              </c:if>
                              <c:if test="${loop.count ne order.payment_type}">
			   				    <option disabled value="${loop.count}"><c:out value="${payment_type}"/></option> 
                              </c:if>
			 			</c:forEach>
			 			</select>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="creditNumber" class="col-sm-6 control-label">Credit Number</label>
    				</td>
    				<td>
    					 <input type="text" class="form-control" id="creditNumber" name="creditNumber" value="${order.credit_number}">
    				</td>
    			</tr>
    		</table>		
			<br/>
			<br/>
			 <%Order order = (Order)request.getAttribute("order"); %>
			<h1>Shipping Address</h1>
			<table width="80%">
    			<tr>
    				<td>
    					<label for="shippingStreet" class="col-sm-6 control-label">Street</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="shippingStreet" name="shippingStreet" value="${order.ship_address.street}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="shippingApt" class="col-sm-6 control-label">Apartment Suite Unit</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="shippingApt" name="shippingApt" value="${order.ship_address.apt_suite_unit}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="shippingCity" class="col-sm-6 control-label"> City</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="shippingCity" name="shippingCity" value="${order.ship_address.city}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					 <label for="shippingPostalCode" class="col-sm-6 control-label">Postal Code</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="shippingPCode" name="shippingPCode" value="${order.ship_address.postal_code}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="shippingProvince" class="col-sm-6 control-label">Province</label>
    				</td>
    				<td>
    					<select id="shippingProvince" name="shippingProvince" class="form-control">
							<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
								<option value="<%=i+1%>" 
									<%if(order.getShip_address().getProvince()== i+1){%>
										selected
									<%}%>>
									<%= enumTables.Province.values()[i] %>
								</option>
							<% } %>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="shippingCountry" class="col-sm-6 control-label">Country</label>
    				</td>
    				<td>
    					<select id="shippingCountry" name="shippingCountry" class="form-control">
							<% for(int i = 0; i < enumTables.Country.values().length; i++){%>
								<option value="<%=i+1%>" 
									<%if(order.getShip_address().getCountry()== i+1){%>
										selected
									<%}%>>
									<%= enumTables.Country.values()[i] %>
								</option>
							<% } %>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					 <label for="shippingLastModified" class="col-sm-6 control-label">Last Modified</label>
    				</td>
    				<td>
    					 <input type="hidden" class="form-control" id="shippingLastModified" name="shippingLastModified" value="${order.ship_address.last_modified}" >
					      <input type="text" class="form-control" id="shippingModifiedDate" name="shippingModifiedDate" value="${order.ship_address.last_modified}" disabled>
    				</td>
    			</tr>	
    		</table>
    		<br/>
    		<br/>		 
			<h1>Billing Address</h1>		 
			<table width="80%">
    			<tr>
    				<td>
    					<label for="billingStreet" class="col-sm-6 control-label">Street</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="billingStreet" name="billingStreet" value="${order.bill_address.street}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="billingApt" class="col-sm-6 control-label">Apartment Suite Unit</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="billingApt" name="billingApt" value="${order.bill_address.apt_suite_unit}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="billingCity" class="col-sm-6 control-label">City</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="billingCity" name="billingCity" value="${order.bill_address.city}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="billingPostalCode" class="col-sm-6 control-label">Postal Code</label>
    				</td>
    				<td>
    					<input type="text" class="form-control" id="billingPostalCode" name="billingPostalCode" value="${order.bill_address.postal_code}">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="billingAddressProvince" class="col-sm-6 control-label">Province</label>
    				</td>
    				<td>
    					 <select id="billingAddressProvince" name="billingAddressProvince" class="form-control">
							<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
								<option value="<%=i+1%>" 
									<%if(order.getBill_address().getProvince()== i+1){%>
										selected
									<%}%>>
									<%= enumTables.Province.values()[i] %>
								</option>
							<% } %>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label for="billingAddressCountry" class="col-sm-6 control-label">Country</label>
    				</td>
    				<td>
    					<select id="billingAddressCountry" name="billingAddressCountry" class="form-control">
							<% for(int i = 0; i < enumTables.Country.values().length; i++){%>
								<option value="<%=i+1%>" 
									<%if(order.getBill_address().getCountry()== i+1){%>
										selected
									<%}%>>
									<%= enumTables.Country.values()[i] %>
								</option>
							<% } %>
						</select>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					 <label for="billingLastModified" class="col-sm-6 control-label">Billing Last Modified</label>
    				</td>
    				<td>
    					 <input type="hidden" class="form-control" id="billingLastModified" name="billingLastModified" value="${order.bill_address.last_modified}" >
					      <input type="text" class="form-control" id="billingModifiedDate" name="billingModifiedDate" value="${order.bill_address.last_modified}" disabled>
    				</td>
    			</tr>	
    		</table>
    		<br/>
    		<br/>			
			<div class="form-group">
			    <div class="col-sm-offset-3 col-sm-10">
			      <button type="submit" class="btn btn-primary">Save</button>
			    </div>
			</div>
        </form>
        </div>
	</div>
</div>
</body>
</html>
        