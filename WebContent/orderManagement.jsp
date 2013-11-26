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
	<jsp:include page="includes/header.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         <div class="col-md-9" role="main">
        
<!-- Put content for inventory management here -->
					<div>
						<h4>Select the order to manage</h4>		
									    
						    <table class="table">
								<tr>
    								<th>Order ID</th>
    								<th>Customer ID</th>
    								<th>Order Total</th>
    								<th>Date and Time</th>
    								<th>Status</th>
    								<th>Payment Type</th>
 								</tr>
 								<c:forEach items="${order}" var="ordervar" varStatus="loop">
 								<c:set var="editlink" value="EditOrder?orderID=${ordervar.id}"></c:set>
 								<c:set var="deletelink" value="DeleteOrder?orderID=${ordervar.id}"></c:set>
 							
							    <tr>
							    	<td>${ordervar.id}</td>
							    	<td>${ordervar.c_id}</td>
							    	<td>${ordervar.total}</td>
							    	<td>${ordervar.date}</td>
							    	<c:choose>
							    	<c:when test="${ordervar.status=='1'}"><td>Pending</td></c:when>
							    	<c:when test="${ordervar.status=='2'}"><td>Cancelled</td></c:when>
							    	<c:when test="${ordervar.status=='3'}"><td>Back Ordered</td></c:when>
							    	<c:when test="${ordervar.status=='4'}"><td>Shipped</td></c:when>
							    	</c:choose>
							    	<c:choose>
							    	<c:when test="${ordervar.payment_type=='1'}"><td>VISA</td></c:when>
							    	<c:when test="${ordervar.payment_type=='2'}"><td>MASTERCARD</td></c:when>
							    	<c:when test="${ordervar.payment_type=='3'}"><td>AMERICAN EXPRESS</td></c:when>
							    	<c:when test="${ordervar.payment_type=='4'}"><td>PAYPAL</td></c:when>
							    	</c:choose>
							    	<td><a href="${editlink}">Edit</a></td>
							    	<td><a href="${deletelink}">Delete</a></td>
							    	
							    </tr>
								</c:forEach>
 							</table>
						  </div>
		</div>
		</div>
</div>
						  
</body>
</html>