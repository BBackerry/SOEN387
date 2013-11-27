<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="includes/import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script  type="text/javascript"  src="http://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script  type="text/javascript" src="js/bootstrap.min.js"></script>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<title>SOEN387  Project</title>
<%
	Customer c = (Customer) request.getSession().getAttribute("customer");
	if(c==null || !c.getCategory().equals("manager")){
		response.sendRedirect("index.jsp?error='You do not have access to the administration page.");
	}
%>

</head>
<body>
 

 
<div class="container">

    <!--/headerbar --> 
	<jsp:include page="includes/header.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         
        
        
        <div class="col-md-9" role="main">
        
            <!-- Main hero unit for a primary marketing message or call to action -->
          <div class="hero-unit">
            <h3>Welcome to administrator!</h3>
            <p>Please select the function for order management and inventory management.</p>
            <!-- <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>  -->
          </div>
          
          
            
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
		          Inventory Management
		        </a>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse">
		    
		      <div class="panel-body">  
			        
			          <!-- Nav tabs -->  
			          <ul class="nav nav-tabs">   
			              <li><a href="#searchProduct" data-toggle="tab">Search product</a></li>	              
						  <li><a href="#createProduct" data-toggle="tab">Create product</a></li>
						  <li><a href="#editProduct" data-toggle="tab">Edit product</a></li>
					  </ul>		
					  <!-- Tab panes -->
					 <div class="tab-content">			  
						  
						  <div class="tab-pane active" id="searchProduct">
						    <br/>
						     <form action="SearchResults" role="form">
						   
						     <div class="form-group">
							    <label for="searchString" class="col-sm-2">Input the Product ID:</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="adminSearch" name="adminSearch" placeholder="searchString">
							    </div>
							    <button type="submit" class="btn btn-default">Search</button>
							 </div>
						     
						     
						     
						     </form>
						  
						  </div>
						  
						  
						  
						  <div class="tab-pane" id="createProduct">
						    <br/>
						    <div class="col-sm-offset-2 col-md-8">Select the product category to create a new product</div>
						    <div class="col-sm-offset-2 col-md-4">
							    <ul class="list-group">
							     	<li class="list-group-item"> <a href="createProduct.jsp?pc=CONSOLE" >Console</a></li>
							  		<li class="list-group-item"> <a href="createProduct.jsp?pc=GAME">Video Game</a></li>
							  		<li class="list-group-item"> <a href="createProduct.jsp?pc=ACCESSORY">Accessory</a></li>
							  	</ul>
						    </div>
						  
						  
						  
						  </div>
						  <div class="tab-pane" id="editProduct">
						 	<br/>
		
						    <div class="col-sm-offset-2 col-md-8">Select the product category to edit:</div>
						    <div class="col-sm-offset-2 col-md-4">
							    <ul class="list-group">
							     	<li class="list-group-item"> <a href="EditProduct?productCategory=CONSOLE" >Console</a></li>
							  		<li class="list-group-item"> <a href="EditProduct?productCategory=GAME">Video Game</a></li>
							  		<li class="list-group-item"> <a href="EditProduct?productCategory=ACCESSORY">Accessory</a></li>
							  	</ul>
						    </div> 
						  
						 </div>
						 
						</div>  <!-- End of Tab-content -->        
				 
		       
		      </div>
		    </div>
		  </div>
          
          
                 
		  <div class="panel panel-default">
		    <div class="panel-heading">
		      <h4 class="panel-title">
		        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
		          Order Management
		        </a>
		      </h4>
		    </div>
		    <div id="collapseOne" class="panel-collapse collapse">
		    
		      <div class="panel-body">  
			      	<div>    
			          <!-- Nav tabs -->  
			          <ul class="nav nav-tabs">
			              <li class="list-group-item"><a href="ViewOrders">Manage Orders</a></li>           
					  </ul>	
					  <br/>	  					
					</div>          
				  </div>
		       
		     </div>
		   </div>
		  </div>
          
          
    
          
          <!--
     
          <div class="">
              <h4>News:</h4>
              <br/><br/><br/><br/><br/><br/>
           
          </div>
          
          <div >
              <h4>Table Example</h4>
              <br/><br/><br/><br/><br/><br/>
           
          </div>
            -->
          
    
    </div> <!-- /row -->
    
   
   
</div> <!-- /container -->
    

  
   
   
   
   
   
   
   
   
</body>
</html>