
<%@ page import="cyyjg.BomActual" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomActual.label', default: 'BomActual')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomActual" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomActual" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomActual">
			
				<g:if test="${bomActualObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="bomActual.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${bomActualObj?.prod?.id}">${bomActualObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.mark}">
				<li class="fieldcontain">
					<span id="mark-label" class="property-label"><g:message code="bomActual.mark.label" default="Mark" /></span>
					
						<span class="property-value" aria-labelledby="mark-label"><g:fieldValue bean="${bomActualObj}" field="mark"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="bomActual.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${bomActualObj}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="bomActual.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${bomActualObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="bomActual.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="bom" action="show" id="${bomActualObj?.parent?.id}">${bomActualObj?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.children}">
				<li class="fieldcontain">
					<span id="children-label" class="property-label"><g:message code="bomActual.children.label" default="Children" /></span>
					
						<g:each in="${bomActualObj.children}" var="c">
						<span class="property-value" aria-labelledby="children-label"><g:link controller="bom" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomActual.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomActualObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.prodInstruct}">
				<li class="fieldcontain">
					<span id="prodInstruct-label" class="property-label"><g:message code="bomActual.prodInstruct.label" default="Prod Instruct" /></span>
					
						<span class="property-value" aria-labelledby="prodInstruct-label"><g:link controller="prodInstruct" action="show" id="${bomActualObj?.prodInstruct?.id}">${bomActualObj?.prodInstruct?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.refBomStdId}">
				<li class="fieldcontain">
					<span id="refBomStdId-label" class="property-label"><g:message code="bomActual.refBomStdId.label" default="Ref Bom Std Id" /></span>
					
						<span class="property-value" aria-labelledby="refBomStdId-label"><g:fieldValue bean="${bomActualObj}" field="refBomStdId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.modifiedBy}">
				<li class="fieldcontain">
					<span id="modifiedBy-label" class="property-label"><g:message code="bomActual.modifiedBy.label" default="Modified By" /></span>
					
						<span class="property-value" aria-labelledby="modifiedBy-label"><g:link controller="endUser" action="show" id="${bomActualObj?.modifiedBy?.id}">${bomActualObj?.modifiedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomActual.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomActualObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomActualObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomActual.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomActualObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomActualObj?.id}" />
					<g:link class="edit" action="edit" id="${bomActualObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
