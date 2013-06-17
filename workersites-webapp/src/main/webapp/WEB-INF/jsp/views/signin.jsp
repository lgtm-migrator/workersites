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

<!-- Valeur par défaut de l'url login-processing-url= présente dans le champs form-login de spring-security.xml -->
<!-- <spring:url value="/j_spring_security_check" var="security_check_url" /> --> 
<spring:url value="/signin/authenticate" var="security_check_url" />

<c:set var="authException" value="${sessionScope['SPRING_SECURITY_LAST_EXCEPTION']}" />
<c:set var="authUserNameException" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" />



<h1><spring:message code="signin.title.label" /></h1>
<p>Welcome to sign in page.<br> All you get is this message and a barebones HTML document.</p>

<div class="row.fluid">
	<div class="span11">
		<div class="well"> 
		<legend><spring:message code="signin.registerwith.label" /></legend>
			<div class="btn-group">		    
			    <a class="btn btn-primary" href="<c:url value="/auth/facebook"/>" onclick="_gaq.push(['_trackEvent', 'Signin', 'Signin page', 'By Facebook']);">Facebook</a>
			    <a class="btn btn-primary" href="<c:url value="/auth/twitter"/>" onclick="_gaq.push(['_trackEvent', 'Signin', 'Signin page', 'By Twitter']);">Twitter</a>			    
			    <a class="btn btn-primary" href="<c:url value="/auth/google"/>" onclick="_gaq.push(['_trackEvent', 'Signin', 'Signin page', 'By Google']);">Google</a>   
			    <a class="btn btn-primary" href="<c:url value="/connect/linkedin"/>" onclick="_gaq.push(['_trackEvent', 'Signin', 'Signin page', 'By LinkedIn']);">LinkedIn</a>   
			    
			</div>
		</div> 
	</div>
	<div class="span11">
		<div class="well">    
		      <form id="signin" class="form-horizontal" method="post" action="${security_check_url}">
			       <fieldset>
					<legend><spring:message code="signin.title.label" /></legend>
       				<c:if test="${not empty authException} || ${not empty authUserNameException}">
					<div class="control-group alert alert-error">
			            <div class="controls">
			                <p class="text-error"><spring:message code="signin.signinfailed.label" /> ${fn:toLowerCase(authException.message)} <br /> ${fn:toLowerCase(authUserNameException.message)}</p>
			            </div>
			        </div>
			 		</c:if>
					
					<div class="control-group">
				        <label class="control-label"><spring:message code="signin.email.label" /></label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-envelope"></i></span>
								<input type="text" class="input-xlarge" id="email" name="email" placeholder="<spring:message code="signin.email_helper.label" />">
								<span class="help-inline"><spring:message code="signin.email_required.label" /></span>	
							</div>
						</div>	
					</div>
					
					<div class="control-group">
				        <label class="control-label"><spring:message code="signin.password.label" /></label>
						<div class="controls">
						    <div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span>
								<input type="Password" id="passwd" class="input-xlarge" name="passwd" placeholder="<spring:message code="signin.password_helper.label" />">
								<span class="help-inline"><spring:message code="signin.password_required.label" /></span>	
							</div>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label checkbox" for="j_remember"><spring:message code="signin.rememberme.label" /></label>
						<div class="controls">
							<div class="input-prepend">
           		     			<input id="j_remember" name="_spring_security_remember_me" type="checkbox" />
           		     		</div>
                		</div>
           
                	</div>
                		
					<div class="control-group">
						<label class="control-label" for="input01"></label>
					      <div class="controls">
					       <button type="submit" class="btn btn-success" rel="tooltip" title="<spring:message code="signin.connection_tooltip.label" />"><spring:message code="signin.connection.label" /></button>
					       
					      </div>
					
					</div>
				 </fieldset>
			  </form>
		
		   </div>
	   </div>
	 </div>
</div>
