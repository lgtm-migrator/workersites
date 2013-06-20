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
<security:authorize access="isAnonymous()">

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
			<form id="submit_facebook" action="<c:url value="/auth/facebook" />" method="POST">
				<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
	    	</form>
	    	<form id="submit_twitter" action="<c:url value="/auth/twitter" />" method="POST">
				<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
	    	</form>
	    	<form id="submit_google" action="<c:url value="/auth/google" />" method="POST">
				<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
	    	</form>
	    	<form id="submit_linkedin" action="<c:url value="/auth/linkedin" />" method="POST">
				<input type="hidden" name="scope" value="publish_stream,user_photos,offline_access,email" />
	    	</form>
			<div class="btn-group">		
			    <a class="btn btn-primary" id="idFacebook" href="#" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Facebook</a>
			    <a class="btn btn-primary" id="idTwitter" href="#" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Twitter</a>			    
			    <a class="btn btn-primary" id="idGoogle" href="#" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">Google</a>   
			    <a class="btn btn-primary" id="idLinkedIn" href="#" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);">LinkedIn</a>   
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
							
								<div class="alert alert-error" >
									<div class="error"><spring:message code="signup.error.label" /> </div>
								</div>
							
							</c:when>
						</c:choose>                     
					</spring:bind>
					<div class="control-group">
				        <form:label class="control-label" path="firstName" for="firstName"><spring:message code="signup.firstname.label" /><form:errors path="firstName" cssClass="error" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span> <spring:message code="signup.firstname_helper.label" var="firstname_helper" />
								<form:input path="firstName" type="text" class="input-xlarge" id="firstName" name="firstName" placeholder="${firstname_helper}" />
								<span class="help-inline"><spring:message code="signup.firstname_required.label" /></span>
							</div>
						</div>
					</div>
					<div class="control-group ">
				        <form:label class="control-label" path="lastName"><spring:message code="signup.lastname.label" /><form:errors path="lastName" cssClass="error" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span> <spring:message code="signup.lastname_helper.label" var="lastname_helper" />
								<form:input path="lastName" type="text" class="input-xlarge" id="lastName" name="lastName" placeholder="${lastname_helper}" />
								<span class="help-inline"><spring:message code="signup.lastname_required.label" /></span>
							</div>
						</div>
					</div>
					<div class="control-group">
				        <form:label class="control-label" path="email"><spring:message code="signup.email.label" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span> <spring:message code="signup.email_helper.label" var="email_helper" />
								<form:input path="email" type="text" class="input-xlarge" id="email" name="email" placeholder="${email_helper}" />
								<form:errors path="email" cssClass="error help-inline" />
							</div>
						</div>	
					</div>
					<div class="control-group">
				        <form:label class="control-label" path="gender"><spring:message code="signup.gender.label" /><form:errors path="gender" cssClass="error" /></form:label>
						<div class="controls">
						    <spring:message code="signup.genderM.label" var="genderM"/>
							<spring:message code="signup.genderF.label" var="genderF"/>
								<div id="gender" name="gender" class="btn-group" data-toggle="buttons-radio">  
										<c:forEach var="aGender" items="${gender}">
											<spring:message code="signup.${aGender}.label" var="aGender_lable" />
 											<form:button id="gender" type="button" value="${aGender}" class="btn btn-info">${aGender_lable}</form:button>  											
										</c:forEach>
					            </div>			     		             
						</div>
					</div>
					<form:input  path="gender" type="hidden" name="gender" value="Male" />
					<div id="maidengroup" class="control-group hide">
				        <form:label class="control-label" path="maidenname"><spring:message code="signup.maidenname.label" /><form:errors path="maidenname" cssClass="error" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span> <spring:message code="signup.maidenname_helper.label" var="maidenname_helper" />
								<input type="text" class="input-xlarge" id="maidenname" name="maidenname" placeholder="${maidenname_helper}">
								<span class="help-inline"><spring:message code="signup.maidenname_required.label" /></span>	
							</div>
						</div>
					</div>
					<div class="control-group">
				        <form:label class="control-label" path="password"><spring:message code="signup.password.label" /><form:errors path="password" cssClass="error" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span> <spring:message code="signup.password_helper.label" var="password_helper" />
								<form:input path="password" type="Password" id="password" class="input-xlarge" name="password" placeholder="${password_helper}" />
								<span class="help-inline"><spring:message code="signup.password_required.label" /></span>	
							</div>
						</div>
					</div>
					<div class="control-group">
				        <form:label class="control-label" path="conpassword"><spring:message code="signup.repassword.label" /><form:errors path="conpassword" cssClass="error" /></form:label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span> <spring:message code="signup.repassword_helper.label" var="repassword_helper"/>
								<form:input path="conpassword" type="Password" id="conpassword" class="input-xlarge" name="conpassword" placeholder="${repassword_helper}" />
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
					
					<a class="btn btn-primary" href="signin" onclick="_gaq.push(['_trackEvent', 'Signup', 'Registering', 'By Facebook']);" >Ou se connecter</a>
					
				 </fieldset>
			  </form:form>
		
		   </div>
	   </div>
	 </div>


        <util:js value="/resources/js/vendor/jquery-1.9.1.js"/>
        <util:js value="/resources/js/vendor/jquery.validate.js"/>
<script type="text/javascript">
	  $(window).ready(function(){
		  		 
		    $("#idFacebook").click(function(){
		        $("#submit_facebook").submit();
		        return false;
		    });
		    
		  
		    $("#idTwitter").click(function(){
		        $("#submit_twitter").submit();
		        return false;
		    });
		    		  
		    $("#idGoogle").click(function(){
		        $("#submit_google").submit();
		        return false;
		    });
		    	  
		    $("#idLinkedin").click(function(){
		        $("#submit_linkedin").submit();
		        return false;
		    });
		    
		  $("button#gender").click(function() {
			    
			    var $value = $(this).val();
			    
			    $('input#gender').val($value);

			});

			
			
		  $("#signup").validate({
				rules:{
					firstName:"required",
					lastName:"required",
					email:{
							required:true,
							email: true
						},
					password:{
						required:true,
						minlength: 8
					},
					conpassword:{
						required:true,
						equalTo: "#password"
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
				        $(element).attr("placeholder", "<spring:message code="signup.required.label" />");

				        
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
		 
		  
		  	if ($(".error.help-inline").length > 0){
			  $("input#email").popover({
			      placement : 'top', //placement of the popover. also can use top, bottom, left or right
			      title : '<spring:message code="signup.required.label" />', //this is the top title bar of the popover. add some basic css
			      html: 'true', //needed to show html of course
			      content :  '&nbsp;&nbsp;' + $(".error.help-inline").text() + '&nbsp;&nbsp;' //this is the content of the html box. add the image here or anything you want really.
			});
			  $("input#email").click();
			}
		 
			var hiddenBox = $( "#maidengroup" );
			$( "#gender button" ).on( "click", function( event ) {
				if (this.value == "Male" && !(hiddenBox.hasClass('hide'))) {
					hiddenBox.addClass("hide");
					$("#maidenname").rules("remove", required);
					
					//$("#maidenname").removeAttr("required");
				} else if (this.value == "Female" && hiddenBox.hasClass('hide')) {
					hiddenBox.removeClass("hide");
					$("#maidenname").rules("add", {
						required: true
					});
					//$("#maidenname").prop("required", true);
					
				}
					
			
			});
		});
</script>

</security:authorize>

<security:authorize access="isAuthenticated()">

<div class="container">
	<div class="row.fluid">
		<div class="span11">
			<div class="well"> 
				<div class="alert alert-error" >
						<div class="error"><spring:message code="signup.already.label" /></div>
				</div>
			</div>
		</div>
		<div class="span11">
			<div class="well"> 
				<a class="btn btn-primary" href="logout" onclick="_gaq.push(['_trackEvent', 'Signup', 'Already registered', 'Sign out proposition']);" >Sign out</a>
			</div>
		</div>
	</div>
</div>

</security:authorize>

