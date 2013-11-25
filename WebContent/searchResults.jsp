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
	<jsp:include page="includes/header.jsp" />
	<h1> Search Results </h1>
	<form action = "SearchResults">
		
		
		<c:choose>
			<c:when test="${empty resultMap}">
				<h5>No results found</h5>			
			</c:when>
			<c:otherwise>
				<c:forEach items="${resultMap}" var="resultMap">   		
	    			<input type="radio" name="productSelected" value="${resultMap.key}">${resultMap.value}<br>						
				</c:forEach>		
				<button type="submit" class="btn btn-success">View Details</button>
			</c:otherwise>
		</c:choose>
		
	</form>
</body>
</html>