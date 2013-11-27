<% if(request.getAttribute("msg") != null){ %>
	<div>
		<p style=" color:#00a305;"><%= request.getAttribute("msg") %></p>
	</div>
<% } %>
<% if(request.getAttribute("error") != null){ %>
	<div>
		<p style=" color:red;"><%= request.getAttribute("error") %></p>
	</div>
<% } %>
		