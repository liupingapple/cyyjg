
<%@ page import="cyyjg.SaleOrderLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'saleOrderLine.label', default: 'SaleOrderLine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-saleOrderLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-saleOrderLine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list saleOrderLine">
			
				<g:if test="${saleOrderLineObj?.saleOrder}">
				<li class="fieldcontain">
					<span id="saleOrder-label" class="property-label"><g:message code="saleOrderLine.saleOrder.label" default="Sale Order" /></span>
					
						<span class="property-value" aria-labelledby="saleOrder-label"><g:link controller="saleOrder" action="show" id="${saleOrderLineObj?.saleOrder?.id}">${saleOrderLineObj?.saleOrder?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="saleOrderLine.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${saleOrderLineObj?.prod?.id}">${saleOrderLineObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="saleOrderLine.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${saleOrderLineObj}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="saleOrderLine.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${saleOrderLineObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="saleOrderLine.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${saleOrderLineObj}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.prodBatch}">
				<li class="fieldcontain">
					<span id="prodBatch-label" class="property-label"><g:message code="saleOrderLine.prodBatch.label" default="Prod Batch" /></span>
					
						<span class="property-value" aria-labelledby="prodBatch-label"><g:link controller="prodBatch" action="show" id="${saleOrderLineObj?.prodBatch?.id}">${saleOrderLineObj?.prodBatch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.deliveryDate}">
				<li class="fieldcontain">
					<span id="deliveryDate-label" class="property-label"><g:message code="saleOrderLine.deliveryDate.label" default="Delivery Date" /></span>
					
						<span class="property-value" aria-labelledby="deliveryDate-label"><g:formatDate date="${saleOrderLineObj?.deliveryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="saleOrderLine.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${saleOrderLineObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="saleOrderLine.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${saleOrderLineObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${saleOrderLineObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="saleOrderLine.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${saleOrderLineObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${saleOrderLineObj?.id}" />
					<g:link class="edit" action="edit" id="${saleOrderLineObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
