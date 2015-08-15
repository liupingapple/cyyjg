
<%@ page import="cyyjg.EndUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'endUser.label', default: 'EndUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-endUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-endUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list endUser">
			
				<g:if test="${endUserObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="endUser.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${endUserObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.userName}">
				<li class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="endUser.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${endUserObj}" field="userName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="endUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${endUserObj}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.position}">
				<li class="fieldcontain">
					<span id="position-label" class="property-label"><g:message code="endUser.position.label" default="Position" /></span>
					
						<span class="property-value" aria-labelledby="position-label"><g:fieldValue bean="${endUserObj}" field="position"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.privileges}">
				<li class="fieldcontain">
					<span id="privileges-label" class="property-label"><g:message code="endUser.privileges.label" default="Privileges" /></span>
					
						<span class="property-value" aria-labelledby="privileges-label"><g:fieldValue bean="${endUserObj}" field="privileges"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.onBoardDate}">
				<li class="fieldcontain">
					<span id="onBoardDate-label" class="property-label"><g:message code="endUser.onBoardDate.label" default="On Board Date" /></span>
					
						<span class="property-value" aria-labelledby="onBoardDate-label"><g:formatDate date="${endUserObj?.onBoardDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="endUser.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${endUserObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="endUser.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${endUserObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${endUserObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="endUser.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${endUserObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${endUserObj?.id}" />
					<g:link class="edit" action="edit" id="${endUserObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
