<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			      <div>    
			          <!-- Nav tabs -->  
			          <ul class="nav nav-tabs">
			              <li class="active"><a href="#browseProduct" data-toggle="tab">Browse product</a></li>
			              <li><a href="#searchProduct" data-toggle="tab">Search product</a></li>	              
						  <li><a href="#createProduct" data-toggle="tab">Create product</a></li>
						  <li><a href="#editProduct" data-toggle="tab">Edit product</a></li>
					  </ul>		
					  <!-- Tab panes -->
						<div class="tab-content">
						  <div class="tab-pane active" id="browseProduct">
						    <br/>
						    <h4>Select the product category to browse</h4>
						    <div class="col-md-4">
							    <ul class="list-gorup">
							     	<li class="list-group-item"> <a href="" >Console</a></li>
							  		<li class="list-group-item"> <a href="" class="list-group-item-text">Video Game</a></li>
							  	</ul>
						    </div>
						  </div>
						  
						  
						  
						  <div class="tab-pane" id="searchProduct">
						     <form role="form">
						     <br/>
						     
						     <div class="radio">
								  <label>
								    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
								    Search By Product ID
								  </label>
							 </div>
							 <div class="radio">
								  <label>
								    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
								    Search By Product Name
								  </label>
							 </div>
														     
						     
						     <div class="form-group">
							    <label for="searchString" class="col-sm-2">Input the search value:</label>
							    <div class="col-sm-6">
							      <input type="text" class="form-control" id="searchString" name="searchString" placeholder="searchString">
							    </div>
							 </div>
						     
						     <button type="submit" class="btn btn-default">Submit</button>
						     
						     </form>
						  
						  </div>
						  
						  
						  
						  <div class="tab-pane" id="createProduct">
						    <br/>
						    <h4>Select the product category to create</h4>
						    <div class="col-md-4">
							    <ul class="list-gorup">
							     	<li class="list-group-item"> <a href="CreateProduct?productCategory=CONSOLE" >Console</a></li>
							  		<li class="list-group-item"> <a href="CreateProduct?productCategory=GAME">Video Game</a></li>
							  		<li class="list-group-item"> <a href="CreateProduct?productCategory=ACCESSORY">Accessory</a></li>
							  	</ul>
						    </div>
						  
						  
						  
						  </div>
						  <div class="tab-pane" id="editProduct">
						 	<br/>
						    <h4>Select the product category to edit:</h4>
						    <div class="col-md-4">
							    <ul class="list-gorup">
							     	<li class="list-group-item"> <a href="EditProduct?productCategory=console" >Console</a></li>
							  		<li class="list-group-item"> <a href="EditProduct?productCategory=videoGame">Video Game</a></li>
							  	</ul>
						    </div> 
						  
						 </div>
						</div>          
				  </div>
		       
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
			              <li class="active"><a href="editOrder" data-toggle="tab">Edit order</a></li>
			              <li><a href="#deleteOrder" data-toggle="tab">Delete order</a></li>	              
					  </ul>		
					  <!-- Tab panes -->
						<div class="tab-content">
						  <div class="tab-pane active" id="editOrder">
						
						     <!-- Put content for inventory management here -->
						
						  </div>
						  
						  
						  
						  <div class="tab-pane" id="deleteOrder">
						     <form role="form">
						     
						     
						     </form>
						  
						  </div>
						  					
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
          
          
          
        
         
         
         
          
        </div>
    
    </div> <!-- /row -->
    
   
   
</div> <!-- /container -->
    

  
   
   
   
   
   
   
   
   
</body>
</html>