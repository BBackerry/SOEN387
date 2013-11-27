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
       
       <div class="col-md-9" role="main">
       
       <jsp:include page="includes/error.jsp"/>
       
       <div class="hero-unit">
       	<h3>Edit Addresses:</h3>
       </div>
       
       <div>
			<% 
				ArrayList<Address> addressList= (ArrayList<Address>)request.getAttribute("addressList");
				for(Address a : addressList) { %>
				<div>
					<%= a.getStreet() %><br/>
					<% if(a.getApt_suite_unit() != null) { %>
							<%= "apt/Suite/Unit:" + a.getApt_suite_unit() %><br/>
					<% } %>
					<%= a.getCity()%>,&nbsp;<%=a.getPostal_code()%><br/>
					<%= Province.values()[a.getProvince()-1]+", "+ Country.values()[a.getCountry()-1] %><br/>
					<br/>
					<a href="EditAccount?step=editAddress&address=<%=a.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="EditAccount?step=deleteAddress&address=<%=a.getId()%>">Delete </a>
					<br/>
					<hr/>
				</div>
			<% } %>
			<br/>
			
			<% Customer c = (Customer)request.getSession().getAttribute("customer"); %>
			<div class="col-sm-9" >
				<form class="form-horizontal" action="EditAccount?step=addAddress" method="post">
					<div class="hero-unit">
			        	<h3>Add A New Address:</h3>
			        </div>
					<br/>
					<div class="form-group">
			    	   <label for="name" class="col-sm-3 control-label" data-validate="required">Street:</label>
			           <div class="col-sm-5">
			    	    <input type="text" id="street" name="street"/>
			    	   </div>
			    	</div>
					<div class="form-group">
			    	   <label for="name" class="col-sm-3 control-label" >Apt/Suite/Unit:</label>
			           <div class="col-sm-5">
			    	    <input type="text" id="aptSuiteUnit" name="aptSuiteUnit"/>
			    	   </div>
			    	</div>
					<div class="form-group">
			    	   <label for="name" class="col-sm-3 control-label" data-validate="required">City:</label>
			           <div class="col-sm-5">
			    	    <input type="text" id="city" name="city"/>
			    	   </div>
			    	</div>
					<div class="form-group">
			    	   <label for="name" class="col-sm-3 control-label" data-validate="regex([a-zA-Z][0-9][a-zA-Z]/s+[0-9][a-zA-Z][0-9],Must be a valid postal code">Postal Code:</label>
			           <div class="col-sm-5">
			    	    <input type="text" id="postal" name="postal"/>
			    	   </div>
			    	</div>
					<div class="form-group">
			    	   <label for="name" class="col-sm-3 control-label">Province:</label>
			           <div class="col-sm-5">
			    	    <select id="province" name="province">
							<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
								<option value="<%=i+1%>">
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
								<option value="<%=i+1%>"> 
									<%= enumTables.Country.values()[i] %>
								</option>
							<% } %>
						</select>
			    	   </div>
			    	</div>
					<br/>
					<br/>
					<br/>
					<button type="submit" class="btn btn-success" >Add a New Address</button>	
				</form>
			</div>
			<div class="col-sm-9">
				<br/>
				<hr/>
				<br/>
				<form class="form-horizontal" action="EditAccount?step=editAccountPassword" method="post">
					<div class="hero-unit">
	           			 <h3>Edit Account Password</h3>
	                </div>
					<div class="col-md-9">
						<div class="col-md-offset-1">    
				   			<div class="form-group">
					    	   <label for="password" class="col-sm-4 control-label" data-validate="required">Enter Old Password:</label>
					           <div class="col-sm-6">
					    	    <input type="password"  class="form-control" name="oldPassword" id="oldPassword">
					    	   </div>
					    	</div>
					    	<div class="form-group">
					    	   <label for="password" class="col-sm-4 control-label" data-validate="min(6)">Enter New Password:</label>
					           <div class="col-sm-6">
					    	    <input type="password"  class="form-control" name="newPassword1" id="newPassword1">
					    	   </div>
					    	</div>
					    	<div class="form-group">
					    	   <label for="password" class="col-sm-4 control-label" data-validate="min(6)">Re-Enter New Password:</label>
					           <div class="col-sm-6">
					    	    <input type="password"  class="form-control" name="newPassword2" id="newPassword2">
					    	   </div>
					    	</div>
					    </div>
				    </div>
				    <div class="col-md-9">
						<button type="submit" class="btn btn-success">Update Password</button>
					</div>
				</form>
			</div>
			<div class="col-sm-9">
				<br/>
				<hr/>
				<br/>
				<form class="form-horizontal" action="EditAccount?step=editAccountDetails" method="post">
					<div class="hero-unit">
	           			 <h3>Edit Personal Information</h3>
	                </div>
				    <div class="col-md-9">
				        <div class="col-md-offset-1">
				      
				      		<div class="form-group">
					    	   <label for="name" class="col-sm-4 control-label">Username:</label>
					           <div class="col-sm-6">
					    	    <input type="text"  class="form-control" name="username" id="username" value="<%=c.getUsername() %>" data-validate="required">
					    	   </div>
					    	</div>
					    	
					    	<div class="form-group">
					    	   <label for="firstname" class="col-sm-4 control-label">FirstName:</label>
					           <div class="col-sm-6">
					    	    <input type="text"  class="form-control" name="firstname" id="firstname" value="<%= c.getF_name() %>">
					    	   </div>
					    	</div>
							<div class="form-group">
					    	   <label for="lastname" class="col-sm-4 control-label">LastName:</label>
					           <div class="col-sm-6">
					    	    <input type="text"  class="form-control" name="lastname" id="lastname" value="<%= c.getL_name() %>">
					    	   </div>
					    	</div>
				    	
					
							<% 
								Calendar calendar = Calendar.getInstance();
								calendar.setTime(c.getDob());
							%>
					    	<div class="form-group">
					    	   <label for="dob" class="col-sm-4 control-label">DateofBirth</label>
					           <div class="controls  form-inline">
					            <div class="col-sm-1"> <input type="text"  class="input" name="bday" id="dob" placeholder="day" value="<%= calendar.get(Calendar.DATE) %>" data-validate="required,rangeVal(1,31)"></div>
					    	   
					    	    <div class="col-sm-1"><input type="text"  class="input" name="bmonth" id="dob" placeholder="month" value="<%= calendar.get(Calendar.MONTH)+1 %>" data-validate="required,rangeVal(1,12)" ></div>
					    	    <div class="col-sm-1"><input type="text"  class="input" name="byear" id="dob" placeholder="year" value="<%= calendar.get(Calendar.YEAR) %>" data-validate="rangeVal(0,9000)"></div>
					    	   </div>
					    	</div>
					 	
					    	<div class="form-group">
					    	   <label for="email" class="col-sm-4 control-label">Email:</label>
					           <div class="col-sm-6">
					    	    <input type="text"  class="form-control" name="email" id="email" value="<%= c.getEmail() %>" data-validate="required,email">
					    	   </div>
					    	</div>
				    	</div>
					
					</div>
				
					<div class="col-md-9">
						<button type="submit" class="btn btn-success">Update Personal Information</button>
					</div>
				</form>
			</div>
       </div>
       </div>
    </div>
</div>
<br/>
<br/>
</body>
</html>