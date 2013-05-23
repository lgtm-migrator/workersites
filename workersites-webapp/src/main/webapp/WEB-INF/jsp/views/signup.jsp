<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="tb" uri="/WEB-INF/taglib/taglib.tld" %>

<util:js value="/resources/js/pages/home.js" />

<h1>Subscription page</h1>
<p>Welcome to registration page.<br> All you get is this message and a barebones HTML document.</p>

<div class="container">

<div class="well">    
      <form id="signup" class="form-horizontal" method="post" action="success.php">
		<legend>Sign Up</legend>		
		<div class="control-group">
	        <label class="control-label">First Name</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="fname" name="fname" placeholder="First Name">
				</div>
			</div>
		</div>
		<div class="control-group ">
	        <label class="control-label">Last Name</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-user"></i></span>
					<input type="text" class="input-xlarge" id="lname" name="lname" placeholder="Last Name">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Email</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-envelope"></i></span>
					<input type="text" class="input-xlarge" id="email" name="email" placeholder="Email">
				</div>
			</div>	
		</div>
		<div class="control-group">
	        <label class="control-label">Gender</label>
			<div class="controls">
			    
					<p>
			<div id="gender" name="gender" class="btn-group" data-toggle="buttons-radio">  
                    <button type="button" class="btn btn-info">Male</button>  
                    <button type="button" class="btn btn-info">Female</button>  
                    
            </div>    
                  </p>
				
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="Password">
				</div>
			</div>
		</div>
		<div class="control-group">
	        <label class="control-label">Confirm Password</label>
			<div class="controls">
			    <div class="input-prepend">
				<span class="add-on"><i class="icon-lock"></i></span>
					<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="Re-enter Password">
				</div>
			</div>
		</div>
		
		<div class="control-group">
		<label class="control-label" for="input01"></label>
	      <div class="controls">
	       <button type="submit" class="btn btn-success" rel="tooltip" title="first tooltip">Create My Account</button>
	       
	      </div>
	
	</div>
	
	  </form>

   </div>
</div>

        <util:js value="/resources/js/vendor/jquery-1.9.1.js"/>
        <util:js value="/resources/js/vendor/jquery.validate.js"/>
<script type="text/javascript">
	  $(window).ready(function(){
			
			$("#signup").validate({
				rules:{
					fname:"required",
					lname:"required",
					email:{
							required:true,
							email: true
						},
					passwd:{
						required:true,
						minlength: 8
					},
					conpasswd:{
						required:true,
						equalTo: "#passwd"
					},
					gender:"required"
				},
				
				errorClass: "help-inline"
				
			});
		});
</script>
