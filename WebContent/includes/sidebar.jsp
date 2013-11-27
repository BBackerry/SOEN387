<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-md-3"> <!-- side bar-->
        <div class="bs-sidebar panel panel-default" role="complementary">
            
            <div class="panel-heading">Search Product:</div>
            <div class="panel-body">
                <form action="SearchResults" method="post" class="navbar-form " role="search"> 
		            <div class="form-group">
		                <input type="text" class="form-control" name="customerSearch" >
		            </div>
		            <button type="submit" class="btn btn-default">Search</button>
       			</form>
            </div>
        </div>   
        
        <div class="bs-sidebar panel panel-default" role="complementary">    
            
		       	 <c:choose>
		               <c:when test="${not empty user}">
		               
		               <div class="panel-heading">
			                   <div class=""text-success">Welcome administrator: </div>
			            
			                   <div class="text-right"><a href="Logout" class="btn btn-sm" role="button">LogOut</a> </div>
			           </div>
		               
		                       
		                  <div class="col-sm-offset-2">
			                 <h4>
			                  <c:out value="${user.getF_name() }"></c:out> 
			                  <c:out value="${user.getL_name() }"></c:out> 
			                  
			                 </h4>
			              </div>
		                  </p>
		               </c:when>
		               
		               <c:when test="${not empty customer}">
			               <div class="panel-heading">
			                   <div class=""text-success">Welcome:</div>
			            
			                   <div class="text-right"><a href="Logout" class="btn btn-sm" role="button">LogOut</a> </div>
			               </div>
			               <br/>
		                 <div class="col-sm-offset-2">
		                  <p class="lead"><c:out value="${customer.getL_name() }"></c:out></p>
		                  
		                  </div>
		               </c:when>
		               
		               <c:otherwise>
		               
		               <div class="panel-heading">Login:</div>
			           <div class="panel-body">
			                    <%@include file="/includes/login.jsp" %>
			            </div>
			            
			         
					    </c:otherwise>
							      
		         </c:choose>
		      
		      </div>
		            
		            
		            
            
            
            
            
            
            
            
   
 
        <!--
        
        
           <div class="panel-heading">Information:</div>
           <div >
                <ul class="nav">
                    <li > <a href="#download">About us</a></li>
                    <li > <a href="#download">Contact us</a></li>
                </ul>
               
           </div>
        -->
     
            
        </div>   <!-- End of side bar--> 
            
             <!-- Login field -->