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
	
	<jsp:include page="includes/error.jsp" />
    <div class="row">
    	<div class="col-md-9" role="main">
			<div class="login" style="border:2px solid; border-color:grey;">
			  <br/>
			  <form class="form-horizontal" action="Login" role="form" method="post">
			  	  <input type="hidden" name="redirect" value="<%= request.getAttribute("redirect")%>">
			      <div class="form-group">
			        <label for="inputName" class="col-sm-2 control-label"> Account </label>
			        <div  class="col-sm-offset-2 col-sm-5" >
			            <input type="text" name="username" class="form-control" id="inputName" placeholder="username">
			        </div>
			      </div>
			       
			      <div class="form-group">
			        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
			        <div class="col-sm-offset-2 col-sm-5">
			           <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
			        </div>
			      </div>
			
			     <div class="form-group">
			       <div class="col-sm-offset-1">
			         <button type="submit" class="btn btn-success">Sign in</button>
				   </div>
			     </div>   
			          
			  </form>
			  <form class="form-horizontal" action="createAccount.jsp" role="form" method="post">
			 	<button type="submit" class="btn btn-link" name="createAccount">Create Account</button>	
			  </form>
			</div>
		</div>
	</div>
</div>


</body>
</html>			            