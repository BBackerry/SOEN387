<% if(request.getAttribute("error") != null) {
		String errorType =  (String)request.getAttribute("error");
		String errorMsg = "";
		
		if(errorType.equals("customerInfo")){ 		
			errorMsg ="There is an issue with the server's getting customer.";
		} else if(errorType.equals("viewOrders")){ 
			errorMsg ="There is an issue with the server viewing orders.";
		} 
%>
		<p style="color:red">
		 <%= errorMsg %>
		 <br/>
		 Please try again or contact the site administrator if the problem persists.
		</p>
		<br/>
<% } %>