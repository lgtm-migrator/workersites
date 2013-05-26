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
<div class="row.fluid">
	<div class="span6">
		<div class="well"> 
		<legend><spring:message code="signup.registerwith.label" /></legend>
			<div class="btn-group" data-toggle="buttons-radio">
			    <button type="button" class="btn btn-primary">Facebook</button>
			    <button type="button" class="btn btn-primary">Twitter</button>
			    <button type="button" class="btn btn-primary">Google</button>
			</div>
		</div> 
	</div>
	<div class="span6">
		<div class="well">    
		      <form id="signup" class="form-horizontal" method="post" action="success.php">
				<legend><spring:message code="signup.title.label" /></legend>		
				<div class="control-group">
			        <label class="control-label"><spring:message code="signup.firstname.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span>
							<input type="text" class="input-xlarge" id="fname" name="fname" placeholder="<spring:message code="signup.firstname_helper.label" />">
							<span class="help-inline"><spring:message code="signup.firstname_required.label" /></span>
						</div>
					</div>
				</div>
				<div class="control-group ">
			        <label class="control-label"><spring:message code="signup.lastname.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span>
							<input type="text" class="input-xlarge" id="lname" name="lname" placeholder="<spring:message code="signup.lastname_helper.label" />">
							<span class="help-inline"><spring:message code="signup.lastname_required.label" /></span>
						</div>
					</div>
				</div>
				<div class="control-group">
			        <label class="control-label"><spring:message code="signup.email.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-envelope"></i></span>
							<input type="text" class="input-xlarge" id="email" name="email" placeholder="<spring:message code="signup.email_helper.label" />">
							<span class="help-inline"><spring:message code="signup.email_required.label" /></span>	
						</div>
					</div>	
				</div>
				<div class="control-group">
			        <label class="control-label"><spring:message code="signup.gender.label" /></label>
					<div class="controls">
					    
						<p>
							<div id="gender" name="gender" class="btn-group" data-toggle="buttons-radio">  
				                    <button id="Male" type="button" class="btn btn-info"><spring:message code="signup.genderM.label" /></button>  
				                    <button id="Female" type="button" class="btn btn-info"><spring:message code="signup.genderF.label" /></button>  
				                    
				            </div>	
		                </p>
						<span class="help-inline"><spring:message code="signup.gender_required.label" /></span>
					</div>
				</div>
				<div id="fmaidengroup" class="control-group hide">
			        <label class="control-label"><spring:message code="signup.maidenname.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-user"></i></span>
							<input type="text" class="input-xlarge" id="fmaidenname" name="fmaidenname" placeholder="<spring:message code="signup.maidenname_helper.label" />">
							<span class="help-inline"><spring:message code="signup.maidenname_required.label" /></span>	
						</div>
					</div>
				</div>
				<div class="control-group">
			        <label class="control-label"><spring:message code="signup.password.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span>
							<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="<spring:message code="signup.password_helper.label" />">
							<span class="help-inline"><spring:message code="signup.password_required.label" /></span>	
						</div>
					</div>
				</div>
				<div class="control-group">
			        <label class="control-label"><spring:message code="signup.repassword.label" /></label>
					<div class="controls">
					    <div class="input-prepend">
						<span class="add-on"><i class="icon-lock"></i></span>
							<input type="Password" id="conpasswd" class="input-xlarge" name="conpasswd" placeholder="<spring:message code="signup.repassword_helper.label" />">
							<span class="help-inline"><spring:message code="signup.repassword_required.label" /></span>	
						</div>
					</div>
				</div>
				
				<div class="control-group">
				<label class="control-label" for="input01"></label>
			      <div class="controls">
			       <button type="submit" class="btn btn-success" rel="tooltip" title="<spring:message code="signup.submit_tooltip.label" />"><spring:message code="signup.submit.label" /></button>
			       
			      </div>
			
			</div>
			
			  </form>
		
		   </div>
	   </div>
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
				
				errorClass: "error",
				  validClass: "success",
				  errorElement: "span", // class='help-inline'
				  highlight: function(element, errorClass, validClass) {
				    if (element.type === 'radio') {
				        this.findByName(element.name).parent("div").parent("div").removeClass(validClass).addClass(errorClass);
				    } else {
				        $(element).parent("div").parent("div").parent("div").removeClass(validClass).addClass(errorClass);
				        
				    }
				  },
				  unhighlight: function(element, errorClass, validClass) {
				    if (element.type === 'radio') {
				        this.findByName(element.name).parent("div").parent("div").removeClass(errorClass).addClass(validClass);
				    } else {
				        $(element).parent("div").parent("div").parent("div").removeClass(errorClass).addClass(validClass);
				    }
				  }

			});
			
			var hiddenBox = $( "#fmaidengroup" );
			$( "#gender button" ).on( "click", function( event ) {
				if (this.id == "Male") {
					hiddenBox.addClass("hide");
					$("#fmaidenname").rules("remove", required);
					
					//$("#fmaidenname").removeAttr("required");
				} else {
					hiddenBox.removeClass("hide");
					$("#fmaidenname").rules("add", {
						required: true
					});
					//$("#fmaidenname").prop("required", true);
					
				}
					
			
			});
		});
</script>
