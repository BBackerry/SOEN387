<%@ include file="import.jsp" %>

<%
	String type = (String)request.getAttribute("type");
	boolean load = false;
	Address a = null;
	if(type.contains("Edit")){
		load = true;
		a = (Address) request.getAttribute("address");
	}
	
	String header = "";
	String desc = "";
	if(type.equals("addBillAddress")){
		header = "Add a New Address";
		desc = "To select this new address please click \"Bill to this address\" on the bottom of this form. ";
	}
	else if (type.equals("addShipAddress")) {
		header = "Add a New Address";
		desc = "To select this new address please click \"Ship to this address\" on the bottom of this form. ";
	}
	else {
		header = "Edit a Previous Address";
		desc = "Please update and changes that occured in this address.";
	}
%>
<form class="form-horizontal" action="CheckOut" method="post">
	<input type="hidden" name="step" value="<%= type %>"/>
	<% if(load){ %>
		<input type="hidden" name="a_id" value="<%= a.getId() %>"/>
	<% } %>
	<h1> <%= header %></h1>
	<%= desc %>
	<br/>
	<br/>
	Street:
	<input type="text" id="street" name="street" 
		<%if(load){%>
			value="<%=a.getStreet() %>"
		<%} %>
	/>
	<br/>
	Apt/Suite/Unit:
	<input type="text" id="aptSuiteUnit" name="aptSuiteUnit" 
		<%if(load){%>
			value="<%if(a.getApt_suite_unit() != null){%>
						<%=a.getApt_suite_unit() %>
					<% } %>"
		<%} %>
	/>
	<br/>
	City:
	<input type="text" id="city" name="city" 
		<%if(load){%>
			value="<%=a.getCity() %>"
		<%} %>
	/>
	<br/>
	Postal Code:
	<input type="text" id="postal" name="postal" 
		<%if(load){%>
			value="<%=a.getPostal_code() %>"
		<%} %>
	/>
	<br/>
	Province:
	<select id="province" name="province">
		<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
			<option value="<%=i+1%>" 
				<%if(load && a.getProvince()== i+1){%>
					selected
				<%} %>>
				<%= enumTables.Province.values()[i] %>
			</option>
		<% } %>
	</select>
	<br/>
	Country:
	<select id="country" name="country">
		<% for(int i = 0; i < enumTables.Country.values().length; i++){ %>
			<option value="<%=i+1%>"
				<%if(load && a.getProvince()== i+1){%>
					selected
				<%} %>> 
				<%= enumTables.Country.values()[i] %>
			</option>
		<% } %>
	</select>
	<br/>
	<%
		String buttontxt = "";
		if(type.equals("addBillAddress")){
			buttontxt = "Bill to this Address";
		} 
		else if(type.equals("addShipAddress")){
			buttontxt = "Ship to this Address";
		}
		else {
			buttontxt = "Save Changes to this Address";
		}
	%>
	<br/>
	<br/>
	<button type="submit" class="btn btn-success" ><%= buttontxt %></button>	
</form>