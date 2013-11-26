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
          

         
	                   
	      <div class="col-md-6 col-md-offset-3">
	       
	       <table class="table table-condensed">
	          <tr><th>#</th><th>Name</th><th>Quantity</th><th>Price</th><th colspan="2" align="center">Action</th>
			  <c:forEach items="${productList}" var="product" varStatus="loop">
			   <c:set var="editlink" value="editProductDetail.jsp?pid=${product.id}"></c:set>
			   <c:set var="deletelink" value="DeleteProduct?pid=${product.id}"></c:set>
			   
			      <input type="hidden"  name="productID"  id="productID"  value="${product.id}"  />
			  
	   			 <tr>
	   			   
	   				   <td><c:out value="${product.id}" /></td>
	   				   <td><c:out value="${product.p_title}" /></td>
	   				   <td><c:out value="${product.p_stock}" /></td>
	   				   <td><c:out value="${product.p_price}" /></td>
	   				   <td><a class="btn btn-primary btn-sm"   href="${editlink}">Edit</a></td>
	   				   <td><a class="btn btn-warning btn-sm"   href="${deletelink}">Delete</a></td>
	   				 
	   				 
	  			</tr>
	  		
	 		 </c:forEach>
	 		 
	 		 
			</table>
			
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
    
    
    
    
    			<div id="result">
		          <c:set var = "success" value = "1"/>
		     		 <c:set var = "fail" value = "0"/>
				 
				       	 <c:choose>
				               <c:when test="${updateOK eq success}">
				                  <p class="text-success">The record <c:out value = "${deleteID}"></c:out>, Delete successfully</p>
				               </c:when>
				               
				               <c:when test="${updateOK eq fail}">
				                  <p class="text-danger">Delete fail for the record <c:out value = "${deleteID}"></c:out>, please reselect the update to be updated</p>
				               </c:when>
				      
				         </c:choose>
		      
		        </div>
		       
    
    
    
    
    </div> <!-- /row -->
    
   
   
</div> <!-- /container -->
    

  
   
   
   
   
   
   
   
   
</body>
</html>