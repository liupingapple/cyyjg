
<%@ page import="cyyjg.Delivery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-delivery" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-delivery" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list delivery">
			
				<g:if test="${deliveryObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="delivery.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${deliveryObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.saleOrder}">
				<li class="fieldcontain">
					<span id="saleOrder-label" class="property-label"><g:message code="delivery.saleOrder.label" default="Sale Order" /></span>
					
						<span class="property-value" aria-labelledby="saleOrder-label"><g:link controller="saleOrder" action="show" id="${deliveryObj?.saleOrder?.id}">${deliveryObj?.saleOrder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="delivery.prod.label" default="Prod" /></span>					
					<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${deliveryObj?.prod?.id}">${deliveryObj?.prod?.encodeAsHTML()}</g:link></span>					
				</li>
				</g:if>
				
				<g:if test="${deliveryObj?.quantity}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="delivery.quantity.label" default="Quantity" /></span>					
					<span class="property-value" aria-labelledby="prod-label">${deliveryObj?.quantity}</span>					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.addr}">
				<li class="fieldcontain">
					<span id="addr-label" class="property-label"><g:message code="delivery.addr.label" default="Addr" /></span>					
					<span class="property-value" aria-labelledby="addr-label"><g:fieldValue bean="${deliveryObj}" field="addr"/></span>					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.contact}">
				<li class="fieldcontain">
					<span id="contact-label" class="property-label"><g:message code="delivery.contact.label" default="Contact" /></span>
					
						<span class="property-value" aria-labelledby="contact-label"><g:fieldValue bean="${deliveryObj}" field="contact"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.contactPhone}">
				<li class="fieldcontain">
					<span id="contactPhone-label" class="property-label"><g:message code="delivery.contactPhone.label" default="Contact Phone" /></span>
					
						<span class="property-value" aria-labelledby="contactPhone-label"><g:fieldValue bean="${deliveryObj}" field="contactPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="delivery.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${deliveryObj}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="delivery.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${deliveryObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="delivery.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${deliveryObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${deliveryObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="delivery.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${deliveryObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${deliveryObj?.id}" />
					<g:link class="edit" action="edit" id="${deliveryObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
