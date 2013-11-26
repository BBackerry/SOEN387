<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<jsp:include page="includes/adminHeader.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         

        <div class="col-md-9" role="main">
        <form action="DeleteOrder" class="form-horizontal" role="form" method="post">
            <!-- Main hero unit for a primary marketing message or call to action -->
          <div class="hero-unit">
          
           
            <div class="form-group">
					 <h4>The Order with the order id <c:out value="${param.orderID}"></c:out> has been deleted!</h4>
			</div>

          </div>
          
		</form>    
	      <div class="col-md-6 col-md-offset-3">
		</div>
		</div>
		</div>
		</div>

</body>
</html>