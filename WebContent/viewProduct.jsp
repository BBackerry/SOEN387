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
	<jsp:include page="includes/header.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         
        
        
        <div class="col-md-9" role="main">
        
            <!-- Main hero unit for a primary marketing message or call to action -->
          <div class="hero-unit">
            <!-- <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>  -->
          </div>
                   
	                   
	      <div class="col-md-offset-1">
	        <table>
	        	<tr><th colspan><h2 style= "color:#008000;" >${product.p_title}</h2></th>
	        	<th><div style="width:325px">&nbsp;</div></th>
			 	<th><h2 style ="color:red">$${product.p_price}</h2></th></tr>
			</table>
	      

			    
		    <div>
		         
			<form action="" class="form-horizontal" role="form" method="post">
			<!-- 
				 <div class="form-group">
				    <label for="productID" class="col-sm-3 control-label">Product ID</label>
				    <div class="col-sm-5">
				      <input type="text" class="form-control" id="productID" name="productID" value="${product.id }" placeholder="productID" disabled>
				    </div>
				  </div>
			-->
					
		<!--  
					  <div class="form-group">
					    <label for="productCategory" class="col-sm-2 control-label">Product Category</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" id="productCat" name="productCat" value="${product.p_category }" placeholder="productCat" >
					    </div>
					  </div>
		-->
		
		<!-- The form-control class cannot pass value to servlet, so pass to servlet with below -->
		      <input type="hidden"  id="pid" name="pid" value="${product.id }" />
		      <input type="hidden"  name="productRelease"  id="productRelease"  value="${product.p_release_date}"  />
		      <input type="hidden"  id="productVersion" name="productVersion" value="${product.p_version }" />
		
		
					<div class="form-group">
			 	 	<label for="productCategory" class="col-sm-3 control-label">Product Category</label>
		 			<div class="col-sm-5">
		 				<c:forEach items="${productCategory}" var="categoryType" varStatus="loop">
					    	   
					    	 <c:if test="${loop.count eq product.p_category}">
				   				   <input type="text" class="form-control" id="productCategory" name="productCategory" value="${categoryType}" disabled>
                              </c:if>
                               
				 	  </c:forEach>
				 	  
		 			
		 			
		 				
			    	</div>
					</div>
		
		
		 <!--
					<div class="form-group">
					    <label for="productName" class="col-sm-3 control-label">Product Name</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productName" name="productName" value="${product.p_title }" placeholder="productName" disabled>
					    </div>
					</div>
					  -->
					<div class="form-group">
					    <label for="quantity" class="col-sm-3 control-label">Product Quantity</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="quantity" name="productQuantity" value="${product.p_stock }" placeholder="productQuantity" disabled>
					    </div>
					</div>
					 <!--  
					<div class="form-group">
					    <label for="productPrice" class="col-sm-3 control-label">Product Price</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productPrice" name="productPrice" value="${product.p_price }" placeholder="productPrice" disabled>
					    </div>
					</div>
					  -->
		
		
					<div class="form-group">
						    <label for="productType" class="col-sm-3 control-label">Product Type</label>
						    <div class="col-sm-5">
						     
								  
							
								<c:forEach items="${productType}" var="type" varStatus="loop">
					    	   
						    	  <c:if test="${loop.count eq product.p_type}">
					   				   <input type="text" class="form-control" id="productType" name="productType" value="${type}" disabled>
	                              </c:if>
                               
				 				 </c:forEach>
		 			
							
							
						    </div>
				    </div>
		
		
		
		
					<div class="form-group">
						    <label for="productCondition" class="col-sm-3 control-label">Product Condition</label>
						    <div class="col-sm-5">
					 	       
						    	<c:forEach items="${productCondition}" var="conditionType" varStatus="loop">
								    	   
								    	 <c:if test="${loop.count eq product.p_condition}">
							   				   <input type="text" class="form-control" id="productCondition" name="productCondition" value="${conditionType }" disabled>
			                             </c:if>
			                               
							 	 </c:forEach>
					
						    </div>
				    </div>
		
		
				     <div class="form-group">
					    <label for="productConsole" class="col-sm-3 control-label">Console Type</label>
					    <div class="col-sm-5">
					      
					           	<c:forEach items="${productConsole}" var="consoleType" varStatus="loop">
					    	   
								    	 <c:if test="${loop.count eq product.p_console}">
							   				   <input type="text" class="form-control" id="productConsole" name="productConsole" value="${consoleType}" disabled>
			                              </c:if>
			                               
							 	</c:forEach>
		 			
								
					   </div>
					  </div>
					  
					 <div class="form-group">
					    <label for="productStatus" class="col-sm-3 control-label">Status</label>
					    <div class="col-sm-5">
					      
					           <input type="text" class="form-control" id="productStatus" name="productStatus" value="${product.p_status}"  disabled>
						</div>		
					 </div>
		
		    		<c:set var="editlink" value="editProductDetail.jsp?pid=${product.id}"></c:set>
			 		<c:set var="deletelink" value="DeleteProduct?pid=${product.id}"></c:set>
			  
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-10">
					      <c:choose>
						       <c:when test="${not empty user}">
						           
				                  <a class="btn btn-primary btn-sm"   href="${editlink}">Edit</a>
	   				              <a class="btn btn-warning btn-sm"   href="${deletelink}">Delete</a>
						      
						      </c:when>
						      <c:otherwise>
						          <a class="btn btn-primary btn-sm"   href="ShoppingCart">Add to Cart</a>
						           
						      
						      </c:otherwise>
					      </c:choose>
					    </div>
					  </div>
					</form>
					     
         
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