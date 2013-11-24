<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script  type="text/javascript"  src="http://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
 <script  type="text/javascript" src="js/bootstrap.min.js"></script>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">

<title>Create New Account</title>
</head>
<body>
	<form action="Account" method="post">
	<h1> CREATE NEW ACCOUNT </h1>
	<h1>Account Information</h1>
		Username: <input type="text" name="username"><br> 
		Password: <input type="text" name="password"><br>

		<br><br>
	<h1>Personal Information</h1>
		First name: <input type="text" name="firstname"><br>
		Last name: <input type="text" name="lastname"> <br>
		Date of Birth: <br>
			Day: <input type="text" name="bday"> Month: <input type="text" name="bmonth"> Year: <input type="text" name="byear"><br>
		Email: <input type="text" name="email"><br><br>
		<h2>Address</h2> <br>
			Street: <input type="text" name="street"><br>
			Postal Code: <input type="text" name="postalcode"><br>
			Province: 
				<select name="provinceChoice">
				<c:forEach var = "province" items="${province}">
					<option selected="selected">${province}</option>
				</c:forEach>	 
				</select>
				<br>
			Apt number: <input type="text" name="apt"><br>
			City: <input type = "text" name="city"><br>
			Country: 
				<select>
				<c:forEach var = "country" items="${country}" >
					<option>${country}</option>
				</c:forEach>	 
				</select>
		<br><br>
		<button type="submit" class="btn btn-success">Create Account</button>
		
	</form>
</body>
</html>