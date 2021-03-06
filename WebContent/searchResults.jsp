<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script  type="text/javascript"  src="http://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script  type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<title> Search Results </title>
</head>
<body>


<div class="container">

        <jsp:include page="includes/header.jsp" />
	
		<div class="row">
		        
		  <!-- Include the side bar-->
		  <jsp:include page="includes/sidebar.jsp"/>
		      
		  <div class="col-md-9" role="main">
		        
				
			<div class="hero-unit">
				<h3> Search Results </h3>
			</div>
			
			
			
	
              
				<table class="table table-hover">
				<thead>
					<tr>
						<th>Title</th>
						<th>Price</th>
						<th>Release Date</th>
						<th>Stock</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="product" items="${product}">
						<c:if test="${product.p_status == 'ACTIVE'}">
							<tr>
								<td>
									<form class="form-inline" role="form" action=${pageContext.request.contextPath}/BrowseProducts>
										<input type="hidden" name="p_id" value="${product.id}" />
										<button type="submit" name="action" value="viewProduct" class="btn btn-link"><c:out value="${product.p_title}"/></button>
									</form>
								</td>
								<td><fmt:formatNumber value="${product.p_price}" type="currency"/></td>
								<td><fmt:formatDate value="${product.p_release_date}" type="date" /></td>
								<td><c:out value="${product.p_stock}"/></td>
								<td>
									<form class="form-inline" role="form" action=${pageContext.request.contextPath}/ShoppingCart>
										<input type="hidden" name="p_id" value="${product.id}" />
										<button type="submit" name="action" value="addOrderLine" class="btn btn-success">Add to Cart</button>
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
				
			</div>
			
		</div>
</div>
</body>
</html>