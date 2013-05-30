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




<c:url value="/signup" var="signupUrl" />
<c:if test="${not empty message}">
	<div class="container">
		<div class="alert" >
				<div class="${message.type.cssClass}">${message.text}</div>
		</div>
	</div>
</c:if>

<div class="row.fluid">
	<div class="span11">
		<div class="well"> 
		<legend><spring:message code="signup.registerwith.label" /></legend>
			<div class="btn-group">		    
			    <a class="btn btn-primary" href="<c:url value="/auth/facebook"/>" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Facebook</a>
			    <a class="btn btn-primary" href="<c:url value="/auth/twitter"/>" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Twitter</a>			    
			    <a class="btn btn-primary" href="<c:url value="/auth/google"/>" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Google</a>   
			    <a class="btn btn-primary" href="<c:url value="/auth/linkedin"/>" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">LinkedIn</a>   
			</div>
		</div> 
	</div>
	<div class="span11">
		<div class="well">    
		      <form:form id="signup" class="form-horizontal" method="post" action="${signupUrl}" modelAttribute="signupForm" >
			       <fieldset>
					<legend><spring:message code="signup.title.label" /></legend>
			 			 		
						<spring:bind path="*">
							<c:choose>
								<c:when test="${status.error}">
								<div class="control-group alert alert-error">	
									<div class="controls">
										<p class="text-error"><spring:message code="signup.signinfailed.label" />Unable to sign up. Please fix the errors below and resubmit.</p>
									</div>
								</div>
								</c:when>
							</c:choose>                     
						</spring:bind>
					
	
					<div class="control-group">
				        <label class="control-label" for="fname"><spring:message code="signup.firstname.label" /></label>
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
					<div id="maidengroup" class="control-group hide">
				        <label class="control-label"><spring:message code="signup.maidenname.label" /></label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span>
								<input type="text" class="input-xlarge" id="maidenname" name="maidenname" placeholder="<spring:message code="signup.maidenname_helper.label" />">
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
					
					<a class="btn btn-primary" href="signup-flow.auth?_eventId=signin"/>" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Ou se connecter</a>
					
				 </fieldset>
			  </form:form>
		
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
			
			var hiddenBox = $( "#maidengroup" );
			$( "#gender button" ).on( "click", function( event ) {
				if (this.id == "Male") {
					hiddenBox.addClass("hide");
					$("#maidenname").rules("remove", required);
					
					//$("#maidenname").removeAttr("required");
				} else {
					hiddenBox.removeClass("hide");
					$("#maidenname").rules("add", {
						required: true
					});
					//$("#maidenname").prop("required", true);
					
				}
					
			
			});
		});
</script>
