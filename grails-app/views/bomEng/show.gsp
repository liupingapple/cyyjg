
<%@ page import="cyyjg.BomEng" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomEng.label', default: 'BomEng')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomEng" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomEng" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomEng">
			
				<g:if test="${bomEngObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="bomEng.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${bomEngObj?.prod?.id}">${bomEngObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngObj?.components}">
				<li class="fieldcontain">
					<span id="components-label" class="property-label"><g:message code="bomEng.components.label" default="Components" /></span>
					
						<g:each in="${bomEngObj.components}" var="c">
						<span class="property-value" aria-labelledby="components-label"><g:link controller="bomEngComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomEng.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomEngObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomEng.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomEngObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomEng.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomEngObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomEngObj?.id}" />
					<g:link class="edit" action="edit" id="${bomEngObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
