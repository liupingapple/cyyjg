
<%@ page import="cyyjg.ProdInstruct" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodInstruct.label', default: 'ProdInstruct')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prodInstruct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prodInstruct" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prodInstruct">
			
				<g:if test="${prodInstructObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="prodInstruct.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${prodInstructObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInstructObj?.saleOrderLine}">
				<li class="fieldcontain">
					<span id="saleOrderLine-label" class="property-label"><g:message code="prodInstruct.saleOrderLine.label" default="Sale Order Line" /></span>					
					<span class="property-value" aria-labelledby="saleOrderLine-label">
						<g:link controller="saleOrder" action="show" id="${prodInstructObj?.saleOrderLine?.saleOrder?.id}">${prodInstructObj?.saleOrderLine}</g:link>
					</span>					
				</li>
				</g:if>
			
				<g:if test="${prodInstructObj?.rootBomActual}">
				<li class="fieldcontain">
					<span id="rootBomActual-label" class="property-label"><g:message code="prodInstruct.rootBomActual.label" default="Root Bom Actual" /></span>
					
						<span class="property-value" aria-labelledby="rootBomActual-label"><g:link controller="bomActual" action="edit" id="${prodInstructObj?.rootBomActual?.id}">${prodInstructObj?.rootBomActual?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInstructObj?.lastOne}">
				<li class="fieldcontain">
					<span id="lastOne-label" class="property-label"><g:message code="prodInstruct.lastOne.label" default="Last One" /></span>
					
						<span class="property-value" aria-labelledby="lastOne-label"><g:link controller="prodInstruct" action="show" id="${prodInstructObj?.lastOne?.id}">${prodInstructObj?.lastOne?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInstructObj?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="prodInstruct.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${prodInstructObj}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInstructObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="prodInstruct.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${prodInstructObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prodInstructObj?.id}" />
					<g:link class="edit" action="edit" id="${prodInstructObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
