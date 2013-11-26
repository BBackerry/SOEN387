<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script  type="text/javascript"  src="http://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script  type="text/javascript" src="js/bootstrap.min.js"></script>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<title>Create New Account</title>
</head>
<body>

 
<div class="container">

    <!--/headerbar --> 
	<jsp:include page="includes/header.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         
        
        
        <div class="col-md-9" role="main">


				<form class="form-horizontal" action="Account" method="post">
				<div class="hero-unit">
           			 <h3>CREATE NEW ACCOUNT</h3>
                </div>
				<div class="col-md-9">
				<h4>Account Information</h4>
				<div class="col-md-offset-1">    
			    	
				    	<div class="form-group">
				    	   <label for="name" class="col-sm-2 control-label">Username:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="username" id="name">
				    	   </div>
				    	</div>
			    	
				
			   
				    	<div class="form-group">
				    	   <label for="password" class="col-sm-2 control-label">Password:</label>
				           <div class="col-sm-6">
				    	    <input type="password"  class="form-control" name="password" id="password">
				    	   </div>
				    	</div>
			    	

			    </div>
			    </div>
			    
			    <div class="col-md-9">
					<h4>Personal Information</h4>
			        <div class="col-md-offset-1">
			      
				    	<div class="form-group">
				    	   <label for="firstname" class="col-sm-2 control-label">FirstName:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="firstname"" id="firstname"">
				    	   </div>
				    	</div>
			    	
				
			
				    	<div class="form-group">
				    	   <label for="lastname" class="col-sm-2 control-label">LastName:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="lastname" id="lastname">
				    	   </div>
				    	</div>
			    	
				
					
				    	<div class="form-group">
				    	   <label for="dob" class="col-sm-2 control-label">DateofBirth</label>
				           <div class="controls  form-inline">
				            <div class="col-sm-1"> <input type="text"  class="input" name="bday" id="dob" placeholder="day"></div>
				    	   
				    	    <div class="col-sm-1"><input type="text"  class="input" name="bmonth" id="dob" placeholder="month"></div>
				    	    <div class="col-sm-1"><input type="text"  class="input" name="byear" id="dob" placeholder="year"></div>
				    	   </div>
				    	</div>
			    
				
				
				 	
				    	<div class="form-group">
				    	   <label for="email" class="col-sm-2 control-label">Email:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="email" id="email">
				    	   </div>
				    	</div>
			    	</div>
				
				</div>
					
	            <div class="col-md-9">
					<h4>Address</h4>
					<div class="col-md-offset-1">
						<div class="form-group">
					    	   <label for="street" class="col-sm-2 control-label">Street:</label>
					           <div class="col-sm-6">
					    	    <input type="text"  class="form-control" name="street" id="street">
					    	   </div>
					    </div>
					    <div class="form-group">
				    	   <label for="postalcode" class="col-sm-2 control-label">PostalCode</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="postalcode" id="postalcode">
				    	   </div>
				        </div>
				          <div class="form-group">
				    	   <label for="province" class="col-sm-2 control-label">Province:</label>
				           <div class="col-sm-6">
				              <select class="form-control" name="provinceChoice" id="province">
								<c:forEach var = "province" items="${province}">
									<option selected="selected">${province}</option>
								</c:forEach>	 
							  </select>
				   
				    	   </div>
				        </div>
				        
				        <div class="form-group">
				    	   <label for="apt" class="col-sm-2 control-label">Apt number:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="apt" id="apt">
				    	   </div>
				        </div>
				        <div class="form-group">
				    	   <label for="city" class="col-sm-2 control-label">City:</label>
				           <div class="col-sm-6">
				    	    <input type="text"  class="form-control" name="city" id="city">
				    	   </div>
				        </div>
				        
				        <div class="form-group">
				    	   <label for="province" class="col-sm-2 control-label">Country: </label>
				           <div class="col-sm-6">
				              <select class="form-control" name="country" id="country">
								<c:forEach var = "country" items="${country}">
									<option selected="selected">${country}</option>
								</c:forEach>	 
							  </select>
				   
				    	   </div>
				        </div>
			
					
					</div>
					</div>
				<div class="col-md-9">
					<button type="submit" class="btn btn-success">Create Account</button>
				</div>
				</form>
			
		</div>
	</div>
</div>
				
</body>
</html>