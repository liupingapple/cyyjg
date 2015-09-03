
<%@ page import="cyyjg.ProdInventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodInventory.label', default: 'ProdInventory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prodInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prodInventory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prodInventory">
			
				<g:if test="${prodInventoryObj?.place}">
				<li class="fieldcontain">
					<span id="place-label" class="property-label"><g:message code="prodInventory.place.label" default="Place" /></span>
					
						<span class="property-value" aria-labelledby="place-label"><g:fieldValue bean="${prodInventoryObj}" field="place"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="prodInventory.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${prodInventoryObj?.prod?.id}">${prodInventoryObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.batch}">
				<li class="fieldcontain">
					<span id="batch-label" class="property-label"><g:message code="prodInventory.batch.label" default="Batch" /></span>
					
						<span class="property-value" aria-labelledby="batch-label"><g:link controller="prodBatch" action="show" id="${prodInventoryObj?.batch?.id}">${prodInventoryObj?.batch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.prodInvType}">
				<li class="fieldcontain">
					<span id="prodInvType-label" class="property-label"><g:message code="prodInventory.prodInvType.label" default="Prod Inv Type" /></span>
					
						<span class="property-value" aria-labelledby="prodInvType-label"><g:fieldValue bean="${prodInventoryObj}" field="prodInvType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="prodInventory.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${prodInventoryObj}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="prodInventory.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${prodInventoryObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.opCode}">
				<li class="fieldcontain">
					<span id="opCode-label" class="property-label"><g:message code="prodInventory.opCode.label" default="Op Code" /></span>
					
						<span class="property-value" aria-labelledby="opCode-label"><g:fieldValue bean="${prodInventoryObj}" field="opCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.op}">
				<li class="fieldcontain">
					<span id="op-label" class="property-label"><g:message code="prodInventory.op.label" default="Op" /></span>
					
						<span class="property-value" aria-labelledby="op-label"><g:fieldValue bean="${prodInventoryObj}" field="op"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.entryDate}">
				<li class="fieldcontain">
					<span id="entryDate-label" class="property-label"><g:message code="prodInventory.entryDate.label" default="Entry Date" /></span>
					
						<span class="property-value" aria-labelledby="entryDate-label"><g:formatDate date="${prodInventoryObj?.entryDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.deadLine}">
				<li class="fieldcontain">
					<span id="deadLine-label" class="property-label"><g:message code="prodInventory.deadLine.label" default="Dead Line" /></span>
					
						<span class="property-value" aria-labelledby="deadLine-label"><g:fieldValue bean="${prodInventoryObj}" field="deadLine"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="prodInventory.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${prodInventoryObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="prodInventory.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${prodInventoryObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.fromPlace}">
				<li class="fieldcontain">
					<span id="fromPlace-label" class="property-label"><g:message code="prodInventory.fromPlace.label" default="From Place" /></span>
					
						<span class="property-value" aria-labelledby="fromPlace-label"><g:fieldValue bean="${prodInventoryObj}" field="fromPlace"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="prodInventory.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${prodInventoryObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="prodInventory.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${prodInventoryObj}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prodInventoryObj?.toPlace}">
				<li class="fieldcontain">
					<span id="toPlace-label" class="property-label"><g:message code="prodInventory.toPlace.label" default="To Place" /></span>
					
						<span class="property-value" aria-labelledby="toPlace-label"><g:fieldValue bean="${prodInventoryObj}" field="toPlace"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${prodInventoryObj?.id}" />
					<g:link class="edit" action="edit" id="${prodInventoryObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
