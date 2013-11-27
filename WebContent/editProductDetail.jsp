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
            <h3>Select product to edit:</h3>
            
            <!-- <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>  -->
          </div>
          

         
	                   
	      <div class="col-md-offset-1">
	     <!-- The following condition happen when there is concurrency problem, the following get the updated product info -->
	      <c:choose>
	     
	       <c:when test="${not empty correctProduct }">
	       <c:set var="product" value="${correctProduct}"></c:set>
	 
		        <div>
		         
					<form action="InventoryManager" class="form-horizontal" role="form" method="post">
					
					 <div class="form-group">
					    <label for="productID" class="col-sm-3 control-label">Product ID</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productID" name="productID" value="${product.id }" placeholder="productID" disabled>
					    </div>
					  </div>
					
	
		
				<!-- The form-control class cannot pass value to servlet, so pass to servlet with below -->
				      <input type="hidden"  id="pid" name="pid" value="${product.id }" />
				      <input type="hidden"  name="productRelease"  id="productRelease"  value="${product.p_release_date}"  />
				      <input type="hidden"  id="productVersion" name="productVersion" value="${product.p_version }" />
				
				
					<div class="form-group">
			 	 	<label for="productCategory" class="col-sm-3 control-label">Product Category</label>
		 			<div class="col-sm-5">
			      		<select class="form-control" name="productCategory" id="productCategory" placeholder="productCategory">
					    	<c:forEach items="${productCategory}" var="categoryType" varStatus="loop">
					    	   
					    	    <c:if test="${loop.count eq product.p_category}">
				   				    <option value="${loop.count}" selected="selected"><c:out value="${categoryType}"  /></option> 
                               </c:if>
                               <c:if test="${loop.count ne product.p_category}">
				   				    <option value="${loop.count}"><c:out value="${categoryType}" /></option> 
                               </c:if>
				 			</c:forEach>
				 		</select>  
			    	</div>
					</div>
		
		
		
					<div class="form-group">
					    <label for="productName" class="col-sm-3 control-label">Product Name</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productName" name="productName" value="${product.p_title }" placeholder="productName" data-validate="required">
					    </div>
					</div>
					  
					<div class="form-group">
					    <label for="quantity" class="col-sm-3 control-label">Product Quantity</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="quantity" name="productQuantity" value="${product.p_stock }" placeholder="productQuantity" data-validate="required,number">
					    </div>
					</div>
					  
					<div class="form-group">
					    <label for="productPrice" class="col-sm-3 control-label">Product Price</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productPrice" name="productPrice" value="${product.p_price }" placeholder="productPrice" data-validate="required,decimal">
					    </div>
					</div>
					  
		
		
					<div class="form-group">
						    <label for="productType" class="col-sm-3 control-label">Product Type</label>
						    <div class="col-sm-5">
						      <select class="form-control" name="productType" id="productType" placeholder="productType">
								    <c:forEach items="${productType}" var="type" varStatus="loop">
							   			   <c:if test="${loop.count eq product.p_type}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${type}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_type}">
							   				    <option value="${loop.count}"><c:out value="${type}" /></option> 
			                               </c:if>
							 		</c:forEach>
							 </select>  
						    </div>
				    </div>
		
		
		
		
					<div class="form-group">
						    <label for="productCondition" class="col-sm-3 control-label">Product Condition</label>
						    <div class="col-sm-5">
						      <select class="form-control" name="productCondition" id="productCondition" placeholder="productCondition">
								    <c:forEach items="${productCondition}" var="conditionType" varStatus="loop">
							   			   <c:if test="${loop.count eq product.p_condition}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${conditionType}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_condition}">
							   				    <option value="${loop.count}"><c:out value="${conditionType}" /></option> 
			                               </c:if>
							 		</c:forEach>
							 </select>  
						    </div>
				    </div>
		
		
				     <div class="form-group">
					    <label for="productConsole" class="col-sm-3 control-label">Console Type</label>
					    <div class="col-sm-5">
					      <select class="form-control" name="productConsole" id="productConsole" placeholder="productConsole">
							    <c:forEach items="${productConsole}" var="consoleType" varStatus="loop">
							     			<c:if test="${loop.count eq product.p_type}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${consoleType}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_console}">
							   				    <option value="${loop.count}"><c:out value="${consoleType}" /></option> 
			                               </c:if>
							    
							    
						 		</c:forEach>
						 </select>  
					    </div>
					  </div>
		
			  
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-10">
					      <button type="submit" class="btn btn-primary">Save</button>
					    </div>
					  </div>
					</form>
					     
         
         		</div>    
	       
	       
	       
	       
	       
	       
	       
	       </c:when>
	       
	       <c:otherwise>
	      
		   <c:forEach items="${productList}" var="product" varStatus="loop">
			
			<c:choose>
			
			    <c:when  test="${param.pid eq product.id}">
			    
	
			    
		        <div>
		         
					<form action="InventoryManager" class="form-horizontal" role="form" method="post">
					
					 <div class="form-group">
					    <label for="productID" class="col-sm-3 control-label">Product ID</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productID" name="productID" value="${product.id }" placeholder="productID" disabled>
					    </div>
					  </div>
					
	
		
				<!-- The form-control class cannot pass value to servlet, so pass to servlet with below -->
				      <input type="hidden"  id="pid" name="pid" value="${product.id }" />
				      <input type="hidden"  name="productRelease"  id="productRelease"  value="${product.p_release_date}"  />
				      <input type="hidden"  id="productVersion" name="productVersion" value="${product.p_version }" />
				
				
					<div class="form-group">
			 	 	<label for="productCategory" class="col-sm-3 control-label">Product Category</label>
		 			<div class="col-sm-5">
			      		<select class="form-control" name="productCategory" id="productCategory" placeholder="productCategory">
					    	<c:forEach items="${productCategory}" var="categoryType" varStatus="loop">
					    	   
					    	    <c:if test="${loop.count eq product.p_category}">
				   				    <option value="${loop.count}" selected="selected"><c:out value="${categoryType}"  /></option> 
                               </c:if>
                               <c:if test="${loop.count ne product.p_category}">
				   				    <option value="${loop.count}"><c:out value="${categoryType}" /></option> 
                               </c:if>
				 			</c:forEach>
				 		</select>  
			    	</div>
					</div>
		
		
		
					<div class="form-group">
					    <label for="productName" class="col-sm-3 control-label">Product Name</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productName" name="productName" value="${product.p_title }" placeholder="productName" data-validate="required">
					    </div>
					</div>
					  
					<div class="form-group">
					    <label for="quantity" class="col-sm-3 control-label">Product Quantity</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="quantity" name="productQuantity" value="${product.p_stock }" placeholder="productQuantity" data-validate="required,number">
					    </div>
					</div>
					  
					<div class="form-group">
					    <label for="productPrice" class="col-sm-3 control-label">Product Price</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productPrice" name="productPrice" value="${product.p_price }" placeholder="productPrice" data-validate="required,decimal">
					    </div>
					</div>
					  
		
		
					<div class="form-group">
						    <label for="productType" class="col-sm-3 control-label">Product Type</label>
						    <div class="col-sm-5">
						      <select class="form-control" name="productType" id="productType" placeholder="productType">
								    <c:forEach items="${productType}" var="type" varStatus="loop">
							   			   <c:if test="${loop.count eq product.p_type}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${type}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_type}">
							   				    <option value="${loop.count}"><c:out value="${type}" /></option> 
			                               </c:if>
							 		</c:forEach>
							 </select>  
						    </div>
				    </div>
		
		
		
		
					<div class="form-group">
						    <label for="productCondition" class="col-sm-3 control-label">Product Condition</label>
						    <div class="col-sm-5">
						      <select class="form-control" name="productCondition" id="productCondition" placeholder="productCondition">
								    <c:forEach items="${productCondition}" var="conditionType" varStatus="loop">
							   			   <c:if test="${loop.count eq product.p_condition}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${conditionType}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_condition}">
							   				    <option value="${loop.count}"><c:out value="${conditionType}" /></option> 
			                               </c:if>
							 		</c:forEach>
							 </select>  
						    </div>
				    </div>
		
		
				     <div class="form-group">
					    <label for="productConsole" class="col-sm-3 control-label">Console Type</label>
					    <div class="col-sm-5">
					      <select class="form-control" name="productConsole" id="productConsole" placeholder="productConsole">
							    <c:forEach items="${productConsole}" var="consoleType" varStatus="loop">
							     			<c:if test="${loop.count eq product.p_type}">
				   				    		 	<option value="${loop.count}" selected="selected"><c:out value="${consoleType}"  /></option> 
                              			   </c:if>
			                               <c:if test="${loop.count ne product.p_console}">
							   				    <option value="${loop.count}"><c:out value="${consoleType}" /></option> 
			                               </c:if>
							    
							    
						 		</c:forEach>
						 </select>  
					    </div>
					  </div>
		
			  
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-10">
					      <button type="submit" class="btn btn-primary">Save</button>
					    </div>
					  </div>
					</form>
					     
         
         		</div>    
			    </c:when>
			
			
			
			
			</c:choose>
			
			  

	 		 </c:forEach>
	 		 
	 	
	  </c:otherwise>
	</c:choose>
          
		 </div>
     
        <div id="result">
          <c:set var = "success" value = "1"/>
     		 <c:set var = "fail" value = "0"/>
		 
		       	 <c:choose>
		               <c:when test="${updateOK eq success}">
		                  <p class="text-success">Update successfully</p>
		               </c:when>
		               
		               <c:when test="${updateOK eq fail}">
		                  <p class="text-danger">Update fail, please reselect the update to be updated</p>
		               </c:when>
		      
		         </c:choose>
      
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