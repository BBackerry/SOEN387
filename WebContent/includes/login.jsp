
<div class="login">

  <form class="form-horizontal" action="Login" role="form" method="post">
  	  <input type="hidden" name="redirect" value="<%= request.getAttribute("redirect")%>">
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
       	 <button type="submit" class="btn btn-success" name="createAccount">Create Account</button>	
	   </div>
     </div>   
          
  </form>
</div>
			            