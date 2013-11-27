<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" language="javascript" src="js/verify.notify.min.js"></script>

<div class="masthead">
    <div>
       <a  href="#">
           <h3 class="test-muted">Game Zone Cart</h3>
       </a>
    </div>

<nav class="navbar navbar-default" role="navigation" style="background: #99CCCC;" >
 

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Home</a></li>
      
      <c:choose>
         <c:when test="${not empty user}">   
		      <li><a href="administration.jsp">Admin</a></li>
		 </c:when>
		 <c:otherwise>
		 
		      <li><a href="AccountManager">Account</a></li>
		      <li><a href="BrowseProducts">Products </a></li>
		      <li><a href="ShoppingCart">Shopping cart</a></li>
		      <li><a href="CheckOut?step=shipAddress">Check Out</a></li>
		 
		 </c:otherwise>
	  </c:choose>      
      
    </ul>
 
    <ul class="nav navbar-nav navbar-right">
       <li><a href="#" > About us </a></li>
         <li><a href="#" > Contact us </a></li>
     <!--   <li><a href="#">Advance Search</a></li>-->

    </ul>
  </div><!-- /.navbar-collapse -->
</div>
</nav>


