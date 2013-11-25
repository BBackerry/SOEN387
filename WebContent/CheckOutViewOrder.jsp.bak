
<%@include file="includes/import.jsp" %>
<%@include file="includes/error.jsp" %>

<%
	Customer c = (Customer) request.getSession().getAttribute("customer");
	Order order = (Order) request.getSession().getAttribute("order");
	ArrayList<OrderLine> orderLines = (ArrayList<OrderLine>) order.getOrderLines().getSource();
	SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	DecimalFormat df = new DecimalFormat("'$'0.00");
%>
<% if(c != null) {%>

	
<table width="100%" border="1">
	<tr>	
		<th width="50%">Billing Address</th>
		<th width="50%">Shipping Address</th>
		<th><a href="CheckOutAddAddress">Add A New Address</a> </th>
	</tr>
	<tr>
		<td>
			<% ArrayList<Address> address = (ArrayList<Address>) request.getAttribute("address"); %>
			<select id="bill-address">
			  <% 
			  	for(Address a : address) {
			  		String addressDetails = a.getStreet() + ", ";
			  		if(a.getApt_suite_unit() != null) addressDetails += a.getApt_suite_unit() + ", ";
			  		addressDetails += a.getCity() + ", " + a.getPostal_code();
			  %>
			  	 <option value="<%=a.getId()%>"><%= addressDetails %></option>
			  <% } %>
			</select> 
		</td>
		<td>
			<select id="ship-address">
			  <% 
			  	for(Address a : address) {
			  		String addressDetails = a.getStreet() + ", ";
			  		if(a.getApt_suite_unit() != null) addressDetails += a.getApt_suite_unit() + ", ";
			  		addressDetails += a.getCity() + ", " + a.getPostal_code();
			  %>
			  	 <option value="<%=a.getId()%>"><%= addressDetails %></option>
			  <% } %>
			</select> 
		</td>
		<td>
		</td>
	</tr>
</table>

<table width="100%" border="1">
	<tr>
		<td>
			<select id="paymentType">
			  <% 
			  	for(PaymentType paymentType : PaymentType.values()) {
			  %>
			  	 <option value="<%=paymentType%>"><%= paymentType %></option>
			  <% } %>
			</select> 
		</td>
	<tr>
</table>

<table width="100%" border="1">
	<tr>	
		<th>Product Title</th>
		<th>Product Condition</th>
		<th>Product's Console</th>
		<th>Product Quantity</th>
		<th>Product Price</th>
		<th>Line Total</th>
	</tr>
	<% for(OrderLine ol : orderLines) {
		Product p = ol.getProduct();
	%>
	<tr>	
		<td><%= p.getP_title() %></td>
		<td><%= ProductCondition.values()[p.getP_condition()-1] %></td>
		<td><%= ProductConsole.values()[p.getP_console()-1] %></td>
		<td><%= ol.getQuantity() %></td>
		<td><%= ol.getPrice() %></td>
		<td><%= df.format(ol.getLine_total()) %></td>
	</tr>
	<%} %>
	<tr>	
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td>PST:</td>
		<td></td>
	</tr>
	<tr>	
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td>GST:</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>	
		<td>Total:</td>
		<td><%= df.format(order.getTotal()) %></td>
	</tr>
</table>

<% } %>
</body>
</html>