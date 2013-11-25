<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><link href="css/bootstrap.min.css" rel="stylesheet">
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
			
			
			<div class="col-md-6 col-md-offset-1">
			
			 <form action = "SearchResults">
              
				<c:choose>
					<c:when test="${empty resultMap}">
						<h5>No results found</h5>			
					</c:when>
					<c:otherwise>
						<c:forEach items="${resultMap}" var="resultMap">  
						
						
						    <div class="input-group">
						      <span class="input-group-addon">
						        <input type="radio" name="productSelected" value="${resultMap.key}">
						      </span>
						      <input type="text" class="form-control" value="${resultMap.value} " disabled>
						    </div><!-- /input-group -->
						
						 		
			    		<!--  	<input type="radio" name="productSelected" value="${resultMap.key}">${resultMap.value}<br>	-->					
						</c:forEach>		
						<br/>
						<button type="submit" class="btn btn-success">View Details</button>
					</c:otherwise>
				</c:choose>
				
			</form>
			</div>
			</div>
			
		</div>
</div>
</body>
</html>