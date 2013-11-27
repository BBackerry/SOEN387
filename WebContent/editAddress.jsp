<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="includes/import.jsp" %>
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
       <% Address a = (Address)request.getAttribute("address"); %>
       
       <div class="col-md-9" role="main">
			<form class="form-horizontal" action="EditAccount?step=updateAddress" method="post">
				<input type="hidden" name="a_id" value="<%= a.getId() %>"/>
				<div class="hero-unit">
		        	<h3>Update Address:</h3>
		        </div>
				<br/>
				<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label" data-validate="required">Street:</label>
		           <div class="col-sm-5">
		    	    <input type="text" id="street" name="street" value='<%= a.getStreet() %>'/>
		    	   </div>
		    	</div>
				<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label">Apt/Suite/Unit:</label>
		           <div class="col-sm-5">
		    	    <input type="text" id="aptSuiteUnit" name="aptSuiteUnit" value="<%= a.getApt_suite_unit() %>"/>
		    	   </div>
		    	</div>
				<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label" data-validate="required">City:</label>
		           <div class="col-sm-5">
		    	    <input type="text" id="city" name="city" value="<%= a.getCity() %>"/>
		    	   </div>
		    	</div>
				<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label" data-validate="regex([a-zA-Z][0-9][a-zA-Z]/s+[0-9][a-zA-Z][0-9],Must be a valid postal code">Postal Code:</label>
		           <div class="col-sm-5">
		    	    <input type="text" id="postal" name="postal" value="<%= a.getPostal_code() %>"/>
		    	   </div>
		    	</div>
				<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label">Province:</label>
		           <div class="col-sm-5">
		    	    <select id="province" name="province">
						<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
							<option value="<%=i+1%>" 
								<%if(a.getProvince()== i+1){%>
									selected
								<%}%>>
								<%= enumTables.Province.values()[i] %>
							</option>
						<% } %>
					</select>
		    	   </div>
		    	</div>
		    	<div class="form-group">
		    	   <label for="name" class="col-sm-3 control-label">Country:</label>
		           <div class="col-sm-5">
		    	    <select id="country" name="country">
						<% for(int i = 0; i < enumTables.Country.values().length; i++){ %>
							<option value="<%=i+1%>"
								<%if(a.getProvince()== i+1){%>
									selected
								<%}%>>
								<%= enumTables.Country.values()[i] %>
							</option>
						<% } %>
					</select>
		    	   </div>
		    	</div>
				<br/>
				<br/>
				<br/>
				<button type="submit" class="btn btn-success" >Update Address</button>	
			</form>
       </div>
    </div>
</div>

</body>
</html>