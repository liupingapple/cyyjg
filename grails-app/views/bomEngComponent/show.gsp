
<%@ page import="cyyjg.BomEngComponent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomEngComponent.label', default: 'BomEngComponent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomEngComponent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomEngComponent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomEngComponent">
			
				<g:if test="${bomEngComponentObj?.bomEng}">
				<li class="fieldcontain">
					<span id="bomEng-label" class="property-label"><g:message code="bomEngComponent.bomEng.label" default="Bom Eng" /></span>
					
						<span class="property-value" aria-labelledby="bomEng-label"><g:link controller="bomEng" action="show" id="${bomEngComponentObj?.bomEng?.id}">${bomEngComponentObj?.bomEng?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.prod}">
				<li class="fieldcontain">
					<span id="prod-label" class="property-label"><g:message code="bomEngComponent.prod.label" default="Prod" /></span>
					
						<span class="property-value" aria-labelledby="prod-label"><g:link controller="prod" action="show" id="${bomEngComponentObj?.prod?.id}">${bomEngComponentObj?.prod?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="bomEngComponent.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${bomEngComponentObj}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.seq}">
				<li class="fieldcontain">
					<span id="seq-label" class="property-label"><g:message code="bomEngComponent.seq.label" default="Seq" /></span>
					
						<span class="property-value" aria-labelledby="seq-label"><g:fieldValue bean="${bomEngComponentObj}" field="seq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.engQuantity}">
				<li class="fieldcontain">
					<span id="engQuantity-label" class="property-label"><g:message code="bomEngComponent.engQuantity.label" default="Eng Quantity" /></span>
					
						<span class="property-value" aria-labelledby="engQuantity-label"><g:fieldValue bean="${bomEngComponentObj}" field="engQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.wasteQuantity}">
				<li class="fieldcontain">
					<span id="wasteQuantity-label" class="property-label"><g:message code="bomEngComponent.wasteQuantity.label" default="Waste Quantity" /></span>
					
						<span class="property-value" aria-labelledby="wasteQuantity-label"><g:fieldValue bean="${bomEngComponentObj}" field="wasteQuantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.unit}">
				<li class="fieldcontain">
					<span id="unit-label" class="property-label"><g:message code="bomEngComponent.unit.label" default="Unit" /></span>
					
						<span class="property-value" aria-labelledby="unit-label"><g:fieldValue bean="${bomEngComponentObj}" field="unit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.componentParent}">
				<li class="fieldcontain">
					<span id="componentParent-label" class="property-label"><g:message code="bomEngComponent.componentParent.label" default="Component Parent" /></span>
					
						<span class="property-value" aria-labelledby="componentParent-label"><g:link controller="bomEngComponent" action="show" id="${bomEngComponentObj?.componentParent?.id}">${bomEngComponentObj?.componentParent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.componentChildren}">
				<li class="fieldcontain">
					<span id="componentChildren-label" class="property-label"><g:message code="bomEngComponent.componentChildren.label" default="Component Children" /></span>
					
						<g:each in="${bomEngComponentObj.componentChildren}" var="c">
						<span class="property-value" aria-labelledby="componentChildren-label"><g:link controller="bomEngComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomEngComponent.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomEngComponentObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomEngComponent.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomEngComponentObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomEngComponentObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomEngComponent.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomEngComponentObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomEngComponentObj?.id}" />
					<g:link class="edit" action="edit" id="${bomEngComponentObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
