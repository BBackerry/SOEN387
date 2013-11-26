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

<div class="container">

    <!--/headerbar --> 
	<jsp:include page="includes/adminHeader.jsp" />
    <div class="row">
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
    	<div class="col-md-9" role="main">
    	<form action="OrderManager" class="form-horizontal" role="form" method="post">
    					<div class="form-group">
					    <label for="orderID" class="col-sm-3 control-label">Order ID</label>
					    <div class="col-sm-5">
					    <input type="hidden" id="shippingId" name="shippingId" value="${order.ship_address.id}"/>
					    <input type="hidden" id="billingId" name="billingId" value="${order.bill_address.id}"/>
					    <input type="hidden" class="form-control" id="orderId" name="orderId" value="${order.id}">
					    <input type="hidden" class="form-control" id="clientId" name="clientId" value="${order.c_id}">
					    <input type="hidden" class="form-control" id="creditNum" name="creditNum" value="${order.credit_number}">
					    <input type="hidden" class="form-control" id="purchaseTotal" name="purchaseTotal" value="${order.total}">
					      <input type="text" class="form-control" id="orderID" name="orderID" value="${order.id}" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="clientID" class="col-sm-3 control-label">Client ID</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="clientID" name="clientID" value="${order.c_id}" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="date" class="col-sm-3 control-label">Date</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="date" name="date" value="${order.date}" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="total" class="col-sm-3 control-label">Order Total</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="total" name="total" value="${order.total}" disabled>
					    </div>
					  </div>
					   <br/>
					  <div class="form-group">
					    <label for="creditNumber" class="col-sm-3 control-label">Credit Number</label>
					    <div class="col-sm-5">
					    
					      <input type="text" class="form-control" id="creditNumber" name="creditNumber" value="${order.credit_number}" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="shippingLastModified" class="col-sm-4 control-label">Shipping Last Modified</label>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="shippingLastModified" name="shippingLastModified" value="${order.ship_address.last_modified}" >
					      <input type="text" class="form-control" id="shippingModifiedDate" name="shippingModifiedDate" value="${order.ship_address.last_modified}" disabled>
					    </div>
					    </div>
					  <br/>
					  <div class="form-group">
					    <label for="paymentType" class="col-sm-3 control-label">Payment Type</label>
					    <div class="col-sm-5">
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
					    </div>
					   <br/>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="status" class="col-sm-3 control-label">Order Status</label>
					    <div class="col-sm-5">
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
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="shippingStreet" class="col-sm-3 control-label">Shipping Street</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="shippingStreet" name="shippingStreet" value="${order.ship_address.street}">
					    </div>
					  </div>
					  <br/>
					 	<div class="form-group">
					    <label for="shippingPostalCode" class="col-sm-4 control-label">Shipping Postal Code</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="shippingPCode" name="shippingPCode" value="${order.ship_address.postal_code}">
					    </div>
					 	</div>
					  <br/>
					  	<div class="form-group">
					    <label for="shippingProvince" class="col-sm-4 control-label">Shipping Province</label>
					    <%Order order = (Order)request.getAttribute("order"); %>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="shippingProvince" name="shippingProvince" value="${order.ship_address.province}">
					      <input type="text" class="form-control" id="shippingProvinceName" name="shippingProvinceName" value="<%=enumTables.Province.values()[order.getShip_address().getProvince()-1]%>">
					    </div>
					 	</div>
					  <br/>
						<div class="form-group">
					    <label for="shippingCountry" class="col-sm-4 control-label">Shipping Country</label>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="shippingCountry" name="shippingCountry" value="${order.ship_address.country}">
					      <input type="text" class="form-control" id="shippingCountryName" name="shippingCountryName" value="<%= enumTables.Country.values()[order.getShip_address().getCountry()-1] %>" disabled>
					    </div>
					  </div>
					 <br/>
					  <div class="form-group">
					    <label for="shippingApt" class="col-sm-4 control-label">Shipping Appartment Suite Unit</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="shippingApt" name="shippingApt" value="${order.ship_address.apt_suite_unit}">
					    </div>
					    </div>
					<br/>
					  <div class="form-group">
					    <label for="shippingCity" class="col-sm-4 control-label">Shipping City</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="shippingCity" name="shippingCity" value="${order.ship_address.city}">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="billingStreet" class="col-sm-3 control-label">Billing Address Street</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="billingStreet" name="billingStreet" value="${order.bill_address.street}">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="billingPostalCode" class="col-sm-4 control-label">Billing Address Postal Code</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="billingPostalCode" name="billingPostalCode" value="${order.bill_address.postal_code}">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="billingAddressProvince" class="col-sm-4 control-label">Billing Address Province</label>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="billingProvince" name="billingProvince" value="${order.bill_address.province}">
					      <input type="text" class="form-control" id="billingProvinceName" name="billingProvinceName" value="<%=enumTables.Province.values()[order.getBill_address().getProvince()-1]%>">
					    </div>
					 	</div>
					 	<br/>
					  <div class="form-group">
					    <label for="billingAddressCountry" class="col-sm-4 control-label">Billing Address Country</label>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="billingCountry" name="billingCountry" value="${order.bill_address.country}">
					      <input type="text" class="form-control" id="billingCountryName" name="billingCountryName" value="<%= enumTables.Country.values()[order.getBill_address().getCountry()-1] %>">
					    </div>
					 	</div>
					  <br/>
					  <div class="form-group">
					    <label for="billingApt" class="col-sm-4 control-label">Billing Appartment Suite Unit</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="billingApt" name="billingApt" value="${order.bill_address.apt_suite_unit}">
					    </div>
					    </div>
					<br/>
					  <div class="form-group">
					    <label for="billingLastModified" class="col-sm-4 control-label">Billing Last Modified</label>
					    <div class="col-sm-5">
					    <input type="hidden" class="form-control" id="billingLastModified" name="billingLastModified" value="${order.bill_address.last_modified}" >
					      <input type="text" class="form-control" id="billingModifiedDate" name="billingModifiedDate" value="${order.bill_address.last_modified}" disabled>
					    </div>
					    </div>
					<br/>
					  <div class="form-group">
					    <label for="billingCity" class="col-sm-4 control-label">Billing City</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="billingCity" name="billingCity" value="${order.bill_address.city}">
					    </div>
					  </div>
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
        