<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-md-3"> <!-- side bar-->
        <div class="bs-sidebar panel panel-default" role="complementary">
            
            <div class="panel-heading">Product Category:</div>
            <div class="panel-body">
                <ul class="nav bs-sidenav ">
                
                    <li > <a href="#">Video Game</a></li>
                    <li > <a href="#">Console</a></li>
                    <li > <a href="#">Accessory</a></li>
             
                </ul>
            </div>
        </div>   
        
        <div class="bs-sidebar panel panel-default" role="complementary">    
            
		       	 <c:choose>
		               <c:when test="${not empty user}">
		                  <p class="text-success">Welcome administrator, 
		                  <br/>
		                  <div class="col-sm-offset-6">
			                 <h4>
			                  <c:out value="${user.getF_name() }"></c:out> 
			                  <c:out value="${user.getL_name() }"></c:out> 
			                 </h4>
			              </div>
		                  </p>
		               </c:when>
		               
		               <c:when test="${not empty customer}">
		                  <p class="lead">Welcome, <c:out value="${customer.getL_name() }"></c:out></p>
		               </c:when>
		               
		               <c:otherwise>
		               
		               <div class="panel-heading">Login:</div>
			           <div class="panel-body">
			                    <div class="login">
			                    
			                      <form class="form-horizontal" action="Login" role="form" method="post">
			                          <div class="form-group">
			                            <label for="inputName" class="col-sm-2 control-lable"> Account </label>
			                            <div  class="col-sm-offset-2 col-sm-8" >
			                                <input type="text" name="username" class="form-control" id="inputName" placeholder="username">
			                            </div>
			                          </div>
			                           
			                          <div class="form-group">
			                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
			                            <div class="col-sm-offset-2 col-sm-8">
			                               <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
			                            </div>
			                          </div>
			                    
			                         <div class="form-group">
			                           <div class="col-sm-offset-1">
			                             <button type="submit" class="btn btn-success">Sign in</button>
			                           </div>
			                         </div>   
			                              
			                      </form>
			                    </div>
			            </div>
			            
			         
					    </c:otherwise>
							      
		         </c:choose>
		      
		      </div>
		            
		            
		            
            
            
            
            
            
            
            
        
        
            <div class="list-group">
              <h4 class="list-group-item-heading">Information:</h4>
              <a href="#" class="list-group-item ">
                  <p class="list-group-item-text">About us</p>
              </a>
              <a href="#" class="list-group-item ">
                  <p class="list-group-item-text">Contact us</p>
              </a>
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