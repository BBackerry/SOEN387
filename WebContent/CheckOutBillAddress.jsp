
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

		<%
			Customer c = (Customer) request.getSession().getAttribute("customer");
			ArrayList<Address> addressList = (ArrayList<Address>) request.getAttribute("addressList");
		%>
		<% if(c != null) {%>
		
	   <div class="hero-unit">
       	    <h3>Select a billing address</h3>
       </div>
			
	
		<% if(request.getAttribute("msg") != null){ %>
			<div>
				<p style=" color:#00a305;"><%= request.getAttribute("msg") %></p>
			</div>
		<% } %>
		<hr/>
		<% for(Address a : addressList) { %>
			<div>
				<%= a.getStreet() %><br/>
				<% if(a.getApt_suite_unit() != null) { %>
						<%= "apt/Suite/Unit:" + a.getApt_suite_unit() %><br/>
				<% } %>
				<%= a.getCity()%>,&nbsp;<%=a.getPostal_code()%><br/>
				<%= Province.values()[a.getProvince()-1]+", "+ Country.values()[a.getCountry()-1] %><br/>
				
				<div class="btn-group">	
					<a  class="btn btn-default" href="CheckOut?step=payment&billAddress=<%=a.getId()%>">Bill to  this address</a> <br/>
					<a  class="btn btn-default" href="CheckOut?step=editBillAddress&address=<%=a.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
					<a  class="btn btn-default" href="CheckOut?step=deleteBillAddress&address=<%=a.getId()%>">Delete </a>
			    </div>
			
				<hr/>
			</div>
		<% } %>
		
		<% request.setAttribute("type", "addBillAddress"); %>
		<%@ include file="includes/CheckOutAddressForm.jsp" %>
		
		<% } %>

<% request.setAttribute("type", "addBillAddress"); %>
<%@ include file="includes/CheckOutAddressForm.jsp" %>

<% } %>



       </div>
    </div>
</div>
</body>
</html>