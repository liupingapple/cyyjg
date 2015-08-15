
<%@ page import="cyyjg.BomProduce" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomProduce.label', default: 'BomProduce')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bomProduce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bomProduce" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bomProduce">
			
				<g:if test="${bomProduceObj?.saleOrderLine}">
				<li class="fieldcontain">
					<span id="saleOrderLine-label" class="property-label"><g:message code="bomProduce.saleOrderLine.label" default="Sale Order Line" /></span>
					
						<span class="property-value" aria-labelledby="saleOrderLine-label"><g:link controller="saleOrderLine" action="show" id="${bomProduceObj?.saleOrderLine?.id}">${bomProduceObj?.saleOrderLine?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceObj?.components}">
				<li class="fieldcontain">
					<span id="components-label" class="property-label"><g:message code="bomProduce.components.label" default="Components" /></span>
					
						<g:each in="${bomProduceObj.components}" var="c">
						<span class="property-value" aria-labelledby="components-label"><g:link controller="bomProduceComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bomProduce.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bomProduceObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bomProduce.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bomProduceObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bomProduceObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bomProduce.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bomProduceObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bomProduceObj?.id}" />
					<g:link class="edit" action="edit" id="${bomProduceObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
