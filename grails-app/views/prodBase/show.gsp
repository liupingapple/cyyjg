
<%@ page import="cyyjg.ProdBase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodBase.label', default: 'ProdBase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prodBase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prodBase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prodBase">
			
				<g:if test="${prodBaseObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="prodBase.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${prodBaseObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="prodBase.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${prodBaseObj}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="prodBase.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${prodBaseObj}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.group}">
				<li class="fieldcontain">
					<span id="group-label" class="property-label"><g:message code="prodBase.group.label" default="Group" /></span>
					
						<span class="property-value" aria-labelledby="group-label"><g:link controller="prodGroup" action="show" id="${prodBaseObj?.group?.id}">${prodBaseObj?.group?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.stdCost}">
				<li class="fieldcontain">
					<span id="stdCost-label" class="property-label"><g:message code="prodBase.stdCost.label" default="Std Cost" /></span>
					
						<span class="property-value" aria-labelledby="stdCost-label"><g:fieldValue bean="${prodBaseObj}" field="stdCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.stdPrice}">
				<li class="fieldcontain">
					<span id="stdPrice-label" class="property-label"><g:message code="prodBase.stdPrice.label" default="Std Price" /></span>
					
						<span class="property-value" aria-labelledby="stdPrice-label"><g:fieldValue bean="${prodBaseObj}" field="stdPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.agentPrice}">
				<li class="fieldcontain">
					<span id="agentPrice-label" class="property-label"><g:message code="prodBase.agentPrice.label" default="Agent Price" /></span>
					
						<span class="property-value" aria-labelledby="agentPrice-label"><g:fieldValue bean="${prodBaseObj}" field="agentPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.batchPrice}">
				<li class="fieldcontain">
					<span id="batchPrice-label" class="property-label"><g:message code="prodBase.batchPrice.label" default="Batch Price" /></span>
					
						<span class="property-value" aria-labelledby="batchPrice-label"><g:fieldValue bean="${prodBaseObj}" field="batchPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.minStock}">
				<li class="fieldcontain">
					<span id="minStock-label" class="property-label"><g:message code="prodBase.minStock.label" default="Min Stock" /></span>
					
						<span class="property-value" aria-labelledby="minStock-label"><g:fieldValue bean="${prodBaseObj}" field="minStock"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="prodBase.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${prodBaseObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="prodBase.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${prodBaseObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="prodBase.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${prodBaseObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodBaseObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="prodBase.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${prodBaseObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prodBaseObj?.id}" />
					<g:link class="edit" action="edit" id="${prodBaseObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
