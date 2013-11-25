<%@include file="includes/header.jsp" %>
<%@include file="includes/import.jsp" %>
<%@include file="includes/error.jsp" %>

<%
	Customer c = (Customer) request.getSession().getAttribute("customer");
	ArrayList<Address> addressList = (ArrayList<Address>) request.getAttribute("addressList");
%>
<% if(c != null) {%>
<div>
	<h1> Select a shipping address</h1>
</div>
<br/>
<% if(request.getAttribute("msg") != null){ %>
	<div>
		<p style=" color:#00a305;"><%= request.getAttribute("msg") %></p>
	</div>
<% } %>
<hr/>
<% for(Address a : addressList) { %>
	<div>
		<%= a.getStreet() %><br/>
		<% if(a.getApt_suite_unit() != null) { %>
				<%= "apt/Suite/Unit:" + a.getApt_suite_unit() %><br/>
		<% } %>
		<%= a.getCity()%>,&nbsp;<%=a.getPostal_code()%><br/>
		<%= Province.values()[a.getProvince()-1]+", "+ Country.values()[a.getCountry()-1] %><br/>
		<br/>
		<a href="CheckOut?step=billAddress&shipAddress=<%=a.getId()%>">Ship to this address</a> <br/>
		<a href="CheckOut?step=editShipAddress&address=<%=a.getId()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="CheckOut?step=deleteShipAddress&address=<%=a.getId()%>">Delete </a>
		<br/>
		<hr/>
	</div>
	
<% } %>

<% request.setAttribute("type", "addShipAddress"); %>
<%@ include file="includes/CheckOutAddressForm.jsp" %>

<% } %>
</body>
</html>