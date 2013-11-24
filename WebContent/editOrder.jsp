<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	<form action="EditOrder" class="form-horizontal" role="form" method="post">
    					<div class="form-group">
					    <label for="orderID" class="col-sm-3 control-label">Order ID</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="orderID" name="order ID" value="${ordervar.id}" placeholder="${ordervar.id}" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="clientID" class="col-sm-3 control-label">Client ID</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="clientID" name="clientID" value="${ordervar.c_id}" placeholder="client ID" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="date" class="col-sm-3 control-label">Date</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="date" name="date" value="${ordervar.date}" placeholder="date and time" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="total" class="col-sm-3 control-label">Order Total</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="total" name="total" value="${ordervar.total}" placeholder="total" disabled>
					    </div>
					  </div>
					      <br/>
					  <div class="form-group">
					    <label for="paymentType" class="col-sm-3 control-label">Payment Type</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="paymentType" name="paymentType" value="${ordervar.payment_type}" placeholder="Payment Type" disabled>
					    </div>
					    <!-- <select class="form-control" name="productType" id="productType" placeholder="productType">
								    <c:forEach items="${productType}" var="type" varStatus="loop">
							   			   <c:if test="${loop.count eq product.p_type}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${type}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_type}">
							   				    <option value="${loop.count}"><c:out value="${type}" /></option> 
			                               </c:if>
							 		</c:forEach>
							 </select>   -->
					  </div>
					   <br/>
					  <div class="form-group">
					    <label for="creditNumber" class="col-sm-3 control-label">Credit Number</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="creditNumber" name="creditNumber" value="${ordervar.credit_number}" placeholder="Credit Number" disabled>
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="status" class="col-sm-3 control-label">Order Status</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="date" name="date" value="${ordervar.status}" placeholder="order status">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="shippingAddress" class="col-sm-3 control-label">Shipping Address</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="shippingAddress" name="shippingAddress" value="${ordervar.shipping_address}" placeholder="Shipping Address">
					    </div>
					  </div>
					  <br/>
					  <div class="form-group">
					    <label for="billingAddress" class="col-sm-3 control-label">Billing Address</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="billingAddress" name="billingAddress" value="${ordervar.billing_address}" placeholder="Billing Address">
					    </div>
					  </div>
					
        
        </form>
        </div>
	</div>
</div>
</body>
</html>
        