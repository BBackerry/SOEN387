<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 
<%
	Customer c = (Customer) request.getSession().getAttribute("customer");
	if(c==null || !c.getCategory().equals("manager")){
		response.sendRedirect("index.jsp?error='You do not have access to the administration page.");
	}
%>
 
<div class="container">

    <!--/headerbar --> 
	<jsp:include page="includes/header.jsp" />

     

    <div class="row">
        
        <!-- Include the side bar-->
        <jsp:include page="includes/sidebar.jsp"/>
         
        
        
        <div class="col-md-9" role="main">
        
            <!-- Main hero unit for a primary marketing message or call to action -->
          <div class="hero-unit">
            <h3>Create a new product:</h3>
            
            <!-- <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>  -->
          </div>
          
          
         
         
         
         <div>
         
			<form action="CreateProduct" class="form-horizontal" role="form" method="post">
			  <div class="form-group">
			    <label for="productCategory" class="col-sm-2 control-label">Product Category</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="productCat" name="productCat" value="${param.pc }" placeholder="productCat" disabled>
			    </div>
			  </div>
			  <!-- The form-control class cannot pass value to servlet, so pass to servlet with below -->
		      <input type="hidden"  name="productCategory"  id="productCategory"  value="${param.pc}"  />
		     
			  <div class="form-group">
			    <label for="productName" class="col-sm-2 control-label">Product Name</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="productName" name="productName" placeholder="productName" data-validate="required">
			    </div>
			  </div>
			  

			  <c:choose>
		          <c:when test="${param.pc eq 'GAME'}">
			  
				  <div class="form-group">
				    <label for="productType" class="col-sm-2 control-label">Type of Game</label>
				    <div class="col-sm-6">
					    <select class="form-control" name="productType" id="productType" placeholder="productType">
						    <c:forEach items="${productType}" var="gameType" varStatus="loop">
					   			 <option value="${loop.count}"><c:out value="${gameType}" /></option> 
					 		</c:forEach>
						</select>    
				    </div>
				  </div>
			     </c:when>
			  </c:choose>
			  
			  <div class="form-group">
			    <label for="productConsole" class="col-sm-2 control-label">Console Type</label>
			    <div class="col-sm-6">
			      <select class="form-control" name="productConsole" id="productConsole" placeholder="productConsole">
					    <c:forEach items="${productConsole}" var="consoleType" varStatus="loop">
				   			 <option value="${loop.count}"><c:out value="${consoleType}" /></option> 
				 		</c:forEach>
				 </select>  
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="productCondition" class="col-sm-2 control-label">Product Condition</label>
			    <div class="col-sm-6">
			      <select class="form-control" name="productCondition" id="productCondition" placeholder="productCondition">
					    <c:forEach items="${productCondition}" var="conditionType" varStatus="loop">
				   			 <option value="${loop.count}"><c:out value="${conditionType}" /></option> 
				 		</c:forEach>
				 </select>  
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="quantity" class="col-sm-2 control-label">Product Quantity</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="quantity" name="productQuantity" placeholder="productQuantity" data-validate="required,number">
			    </div>
			  </div>
			  
			    <div class="form-group">
			    <label for="productPrice" class="col-sm-2 control-label">Product Price</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="productPrice" name="productPrice" placeholder="productPrice" data-validate="required,decimal">
			    </div>
			  </div>
			  
			  
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">Create</button>
			    </div>
			  </div>
			</form>
			         
         <c:choose>
            <c:when test="${not empty newID}">
           
               <p class="text-success">The new product is created successfully, the ID is <c:out value="${newID}"></c:out></p>
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