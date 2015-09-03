
<%@ page import="cyyjg.BomStd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomStd.label', default: 'BomStd')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomStd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomStd" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomStd">
			
				<g:if test="${bomStdObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="bomStd.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${bomStdObj?.prod?.id}">${bomStdObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.mark}">
				<li class="fieldcontain">
					<span id="mark-label" class="property-label"><g:message code="bomStd.mark.label" default="mark" /></span>
					
						<span class="property-value" aria-labelledby="mark-label"><g:fieldValue bean="${bomStdObj}" field="mark"/></span>
					
				</li>
				</g:if>
						
				<g:if test="${bomStdObj?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="bomStd.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${bomStdObj}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="bomStd.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${bomStdObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="bomStd.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="bom" action="show" id="${bomStdObj?.parent?.id}">${bomStdObj?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="bomStd.children.label" default="Children" /></span>
					
						<g:each in="${bomStdObj.children}" var="c">
						<span class="property-value" aria-labelledby="children-label"><g:link controller="bom" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomStd.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomStdObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomStd.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomStdObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomStdObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomStd.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomStdObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomStdObj?.id}" />
					<g:link class="edit" action="edit" id="${bomStdObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
