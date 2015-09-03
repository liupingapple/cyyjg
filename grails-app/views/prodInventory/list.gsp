
<%@ page import="cyyjg.ProdInventory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodInventory.label', default: 'ProdInventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prodInventory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prodInventory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="place" title="${message(code: 'prodInventory.place.label', default: 'Place')}" />
					
						<th><g:message code="prodInventory.prod.label" default="Prod" /></th>
					
						<th><g:message code="prodInventory.batch.label" default="Batch" /></th>
					
						<g:sortableColumn property="prodInvType" title="${message(code: 'prodInventory.prodInvType.label', default: 'Prod Inv Type')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'prodInventory.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'prodInventory.unit.label', default: 'Unit')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodInventoryObjList}" status="i" var="prodInventoryObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodInventoryObj.id}">${fieldValue(bean: prodInventoryObj, field: "place")}</g:link></td>
					
						<td>${fieldValue(bean: prodInventoryObj, field: "prod")}</td>
					
						<td>${fieldValue(bean: prodInventoryObj, field: "batch")}</td>
					
						<td>${fieldValue(bean: prodInventoryObj, field: "prodInvType")}</td>
					
						<td>${fieldValue(bean: prodInventoryObj, field: "quantity")}</td>
					
						<td>${fieldValue(bean: prodInventoryObj, field: "unit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prodInventoryObjTotal}" />
			</div>
		</div>
	</body>
</html>
