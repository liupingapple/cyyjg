
<%@ page import="cyyjg.SaleOrderLine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'saleOrderLine.label', default: 'SaleOrderLine')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-saleOrderLine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-saleOrderLine" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="saleOrderLine.saleOrder.label" default="Sale Order" /></th>
					
						<th><g:message code="saleOrderLine.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="quantity" title="${message(code: 'saleOrderLine.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'saleOrderLine.unit.label', default: 'Unit')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'saleOrderLine.price.label', default: 'Price')}" />
					
						<th><g:message code="saleOrderLine.prodBatch.label" default="Prod Batch" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${saleOrderLineObjList}" status="i" var="saleOrderLineObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${saleOrderLineObj.id}">${fieldValue(bean: saleOrderLineObj, field: "saleOrder")}</g:link></td>
					
						<td>${fieldValue(bean: saleOrderLineObj, field: "prod")}</td>
					
						<td>${fieldValue(bean: saleOrderLineObj, field: "quantity")}</td>
					
						<td>${fieldValue(bean: saleOrderLineObj, field: "unit")}</td>
					
						<td>${fieldValue(bean: saleOrderLineObj, field: "price")}</td>
					
						<td>${fieldValue(bean: saleOrderLineObj, field: "prodBatch")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${saleOrderLineObjTotal}" />
			</div>
		</div>
	</body>
</html>
