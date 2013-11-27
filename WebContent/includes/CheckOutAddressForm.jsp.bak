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
	
	<div class="hero-unit">
       	<h3> <%= header %></h3>
    </div>
	
	<%= desc %>
	<br/>
	<br/>

	
	
	<div class="form-group">
	    <label for="street" class="col-sm-3 control-label">Street:</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="street" name="street" 
	      <%if(load){%>
			value="<%=a.getStreet() %>"
		  <%} %>
	     />
	    </div>
    </div>
	
	
	
	
	
	
    <div class="form-group">
	    <label for="aptSuiteUnit" class="col-sm-3 control-label">Apt/Suite/Unit:</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="aptSuiteUnit" name="aptSuiteUnit" 
	      <%if(load){%>
			value="<%if(a.getApt_suite_unit() != null){%>
						<%=a.getApt_suite_unit() %>
					<% } %>"
		<%} %>
	       />
	    </div>
    </div>
	
		
    <div class="form-group">
	    <label for="city" class="col-sm-3 control-label">	City:</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="city" name="city" 
	      <%if(load){%>
			value="<%=a.getCity() %>"
	  	<%} %>
	      />
	    </div>
    </div>
	
		
    <div class="form-group">
	    <label for="postal" class="col-sm-3 control-label">Postal Code:</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="postal" name="postal" 
	      <%if(load){%>
			value="<%=a.getPostal_code() %>"
		<%} %>
	      />
	    </div>
    </div>
	

    
     <div class="form-group">
	    <label for="province" class="col-sm-3 control-label">Province:</label>
	    <div class="col-sm-5">
	      	<select  class="form-control" id="province" name="province">
				<% for(int i = 0; i < enumTables.Province.values().length; i++){%>
					<option value="<%=i+1%>" 
						<%if(load && a.getProvince()== i+1){%>
							selected
						<%} %>>
						<%= enumTables.Province.values()[i] %>
					</option>
				<% } %>
			</select>
	      
	    </div>
    </div>
	
	
    <div class="form-group">
	    <label for="country" class="col-sm-3 control-label">Country:</label>
	    <div class="col-sm-5">
	      <select class="form-control" id="country" name="country">
			<% for(int i = 0; i < enumTables.Country.values().length; i++){ %>
				<option value="<%=i+1%>"
					<%if(load && a.getProvince()== i+1){%>
						selected
					<%} %>> 
					<%= enumTables.Country.values()[i] %>
				</option>
			<% } %>
		 </select>
	      
	      
	    </div>
    </div>


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
	<div class="col-sm-offset-2"><button type="submit" class="btn btn-success" ><%= buttontxt %></button>	</div>
</form>