
<%@ page import="cyyjg.BomProduceComponent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomProduceComponent.label', default: 'BomProduceComponent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomProduceComponent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomProduceComponent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomProduceComponent">
			
				<g:if test="${bomProduceComponentObj?.produceBOM}">
				<li class="fieldcontain">
					<span id="produceBOM-label" class="property-label"><g:message code="bomProduceComponent.produceBOM.label" default="Produce BOM" /></span>
					
						<span class="property-value" aria-labelledby="produceBOM-label"><g:link controller="bomProduce" action="show" id="${bomProduceComponentObj?.produceBOM?.id}">${bomProduceComponentObj?.produceBOM?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="bomProduceComponent.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${bomProduceComponentObj?.prod?.id}">${bomProduceComponentObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="bomProduceComponent.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${bomProduceComponentObj}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.seq}">
				<li class="fieldcontain">
					<span id="seq-label" class="property-label"><g:message code="bomProduceComponent.seq.label" default="Seq" /></span>
					
						<span class="property-value" aria-labelledby="seq-label"><g:fieldValue bean="${bomProduceComponentObj}" field="seq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.refEngBOMComponent}">
				<li class="fieldcontain">
					<span id="refEngBOMComponent-label" class="property-label"><g:message code="bomProduceComponent.refEngBOMComponent.label" default="Ref Eng BOMC omponent" /></span>
					
						<span class="property-value" aria-labelledby="refEngBOMComponent-label"><g:link controller="bomEngComponent" action="show" id="${bomProduceComponentObj?.refEngBOMComponent?.id}">${bomProduceComponentObj?.refEngBOMComponent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.op}">
				<li class="fieldcontain">
					<span id="op-label" class="property-label"><g:message code="bomProduceComponent.op.label" default="Op" /></span>
					
						<span class="property-value" aria-labelledby="op-label"><g:fieldValue bean="${bomProduceComponentObj}" field="op"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.actualQuantity}">
				<li class="fieldcontain">
					<span id="actualQuantity-label" class="property-label"><g:message code="bomProduceComponent.actualQuantity.label" default="Actual Quantity" /></span>
					
						<span class="property-value" aria-labelledby="actualQuantity-label"><g:fieldValue bean="${bomProduceComponentObj}" field="actualQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.wasteQuantity}">
				<li class="fieldcontain">
					<span id="wasteQuantity-label" class="property-label"><g:message code="bomProduceComponent.wasteQuantity.label" default="Waste Quantity" /></span>
					
						<span class="property-value" aria-labelledby="wasteQuantity-label"><g:fieldValue bean="${bomProduceComponentObj}" field="wasteQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="bomProduceComponent.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${bomProduceComponentObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.exceedQuantityInventory}">
				<li class="fieldcontain">
					<span id="exceedQuantityInventory-label" class="property-label"><g:message code="bomProduceComponent.exceedQuantityInventory.label" default="Exceed Quantity Inventory" /></span>
					
						<span class="property-value" aria-labelledby="exceedQuantityInventory-label"><g:fieldValue bean="${bomProduceComponentObj}" field="exceedQuantityInventory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.componentParent}">
				<li class="fieldcontain">
					<span id="componentParent-label" class="property-label"><g:message code="bomProduceComponent.componentParent.label" default="Component Parent" /></span>
					
						<span class="property-value" aria-labelledby="componentParent-label"><g:link controller="bomProduceComponent" action="show" id="${bomProduceComponentObj?.componentParent?.id}">${bomProduceComponentObj?.componentParent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.componentChildren}">
				<li class="fieldcontain">
					<span id="componentChildren-label" class="property-label"><g:message code="bomProduceComponent.componentChildren.label" default="Component Children" /></span>
					
						<g:each in="${bomProduceComponentObj.componentChildren}" var="c">
						<span class="property-value" aria-labelledby="componentChildren-label"><g:link controller="bomProduceComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomProduceComponent.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomProduceComponentObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomProduceComponent.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomProduceComponentObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceComponentObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomProduceComponent.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomProduceComponentObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomProduceComponentObj?.id}" />
					<g:link class="edit" action="edit" id="${bomProduceComponentObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
