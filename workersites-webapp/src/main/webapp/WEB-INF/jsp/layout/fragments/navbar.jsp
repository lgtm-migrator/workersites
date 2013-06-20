<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="gravatar" uri="http://www.paalgyula.hu/schemas/tld/gravatar" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util" %>
<%@ taglib prefix="tb" uri="/WEB-INF/taglib/taglib.tld" %>

<tiles:importAttribute name="view" toName="selectedView" />
<c:set var="localeCode" value="${pageContext.response.locale.language}" />

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="home"><spring:message code="project.name"/></a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <c:forEach var="item" items="home,about">
                        <spring:message code="navbar.${item}.title" var="itemTitle"/>
                        <c:choose>
                            <c:when test="${item eq selectedView}">
                                <li class="active"><a href="${item}">${itemTitle}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${item}">${itemTitle}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
                <ul class="nav pull-right">
                    <c:forEach var="item" items="signup,contact,signin">
                    <security:authorize var="loggedIn" access="isAuthenticated()" />                    
					<c:if test="${loggedIn && item == 'signup'}">
					        <c:set var="item" value="logout" />
					        <c:set var="itemtest" value="merde" />
					        
					</c:if>					  
				
                        <spring:message var="itemTitle" code="navbar.${item}.title" />
                        <c:choose>
                            <c:when test="${item eq selectedView}">
                                <li class="active"><a href="${item}">${itemTitle}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${item}">${itemTitle}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <li>
	                    <div class="btn-group">
						    <a class="btn dropdown-toggle" data-toggle="dropdown" href="?lang=en">
						    ${fn:toUpperCase(localeCode)}
						    <span class="caret"></span>
						    </a>
						    <ul class="dropdown-menu">
						    <li><a tabindex="-1" href="?lang=en">EN</a></li>
						     <li><a tabindex="-1" href="?lang=fr">FR</a></li>					
						    </ul>
					    </div>
				    </li>
                </ul>
            </div> <!--/.nav-collapse -->
			<c:if  test="${not empty username}">
				    <a class="brand" href="#">
						<img class="media-object" src="<gravatar:image email="${username}" size="32"/>" alt="Gravatar" title="Gravatar" data-src="holder.js/64x64" />
					</a>  
			      
			</c:if>
               
        </div>
    </div>
</div>