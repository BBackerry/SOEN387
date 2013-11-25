
<%@include file="includes/import.jsp" %>
<%@include file="includes/error.jsp" %>
	
<div>
	<h1> Select a Payment Method</h1>
</div>
<hr/>
<div id="CreditCard">
	<form class="form-horizontal" action="CheckOut" method="post">
		<input type="hidden" name="step" value="confirmOrder">
		<input type="hidden" name="method" value="credit">
		<div> Enter your credit card information:</div>
		<br/>
		<table>
			<tr>
				<th>Payment Type</th>
				<th>Name on card</th>
				<th>Card Number</th>
				<th>Expiration date (MM/YYYY)</th>
			</tr>
			<tr>
				<td>
					<select name="creditType" id="creditType">
						<% for(int i = 0; i<PaymentType.values().length-1; i++){ %>
							<option value="<%= i %>"><%=PaymentType.values()[i]%></option>
						<% } %>
					</select>
				</td>
				<td><input type="text" id="cardName" name="cardName"></input></td>
				<td><input type="text" id="cardNumber" name="cardNumber"></input></td>
				<td>
					<input type="text" id="cardMonth" name="cardMonth" maxlength="2"></input> &nbsp;
					<input type="text" id="cardYear" name="cardYear" maxlength="4"></input>
				</td>
			</tr>
		</table>
		<br/>
		<button type="submit" class="btn btn-success" name="selectCreditPayment">Pay with this credit card</button>	
	</form>
</div>
<hr/>
<br/>
<form action="CheckOut" method="post">
	<input type="hidden" name="step" value="confirmOrder">
	<input type="hidden" name="method" value="paypal">
    <input type="submit" value="Pay With PayPal">
</form>
	
</body>
</html>