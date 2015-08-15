
<%@ page import="cyyjg.Prod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prod.label', default: 'Prod')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prod" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prod">
			
				<g:if test="${prodObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="prod.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${prodObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.iterStdCode}">
				<li class="fieldcontain">
					<span id="iterStdCode-label" class="property-label"><g:message code="prod.iterStdCode.label" default="Iter Std Code" /></span>
					
						<span class="property-value" aria-labelledby="iterStdCode-label"><g:fieldValue bean="${prodObj}" field="iterStdCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="prod.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${prodObj}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="prod.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${prodObj}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.group}">
				<li class="fieldcontain">
					<span id="group-label" class="property-label"><g:message code="prod.group.label" default="Group" /></span>
					
						<span class="property-value" aria-labelledby="group-label"><g:link controller="prodGroup" action="show" id="${prodObj?.group?.id}">${prodObj?.group?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.stdCost}">
				<li class="fieldcontain">
					<span id="stdCost-label" class="property-label"><g:message code="prod.stdCost.label" default="Std Cost" /></span>
					
						<span class="property-value" aria-labelledby="stdCost-label"><g:fieldValue bean="${prodObj}" field="stdCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.stdPrice}">
				<li class="fieldcontain">
					<span id="stdPrice-label" class="property-label"><g:message code="prod.stdPrice.label" default="Std Price" /></span>
					
						<span class="property-value" aria-labelledby="stdPrice-label"><g:fieldValue bean="${prodObj}" field="stdPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.agentPrice}">
				<li class="fieldcontain">
					<span id="agentPrice-label" class="property-label"><g:message code="prod.agentPrice.label" default="Agent Price" /></span>
					
						<span class="property-value" aria-labelledby="agentPrice-label"><g:fieldValue bean="${prodObj}" field="agentPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.batchPrice}">
				<li class="fieldcontain">
					<span id="batchPrice-label" class="property-label"><g:message code="prod.batchPrice.label" default="Batch Price" /></span>
					
						<span class="property-value" aria-labelledby="batchPrice-label"><g:fieldValue bean="${prodObj}" field="batchPrice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="prod.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${prodObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.minStock}">
				<li class="fieldcontain">
					<span id="minStock-label" class="property-label"><g:message code="prod.minStock.label" default="Min Stock" /></span>
					
						<span class="property-value" aria-labelledby="minStock-label"><g:fieldValue bean="${prodObj}" field="minStock"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.bomEng}">
				<li class="fieldcontain">
					<span id="bomEng-label" class="property-label"><g:message code="prod.bomEng.label" default="Bom Eng" /></span>
					
						<span class="property-value" aria-labelledby="bomEng-label"><g:link controller="bomEng" action="show" id="${prodObj?.bomEng?.id}">${prodObj?.bomEng?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="prod.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${prodObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="prod.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${prodObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="prod.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${prodObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prodObj?.id}" />
					<g:link class="edit" action="edit" id="${prodObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
