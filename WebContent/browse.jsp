<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
       	<h3>Browse our products:</h3>
       </div>
       
       <div>
			<table>
				<c:forEach var="product" items="${allProducts}">
				<tr>
				<td><c:out value="${product.p_title}"/></td>
				<td><c:out value="${product.p_desc}"/></td>
				</tr>
				</c:forEach>
			</table>
       </div>
       
       </div>
    </div>
</div>

</body>
</html>