
<%@ page import="cyyjg.BomStd" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomStd.label', default: 'BomStd')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomStd" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomStd" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomStd.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="mark" title="${message(code: 'bomStd.mark.label', default: 'mark')}" />
										
						<g:sortableColumn property="quantity" title="${message(code: 'bomStd.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'bomStd.unit.label', default: 'Unit')}" />
					
						<th><g:message code="bomStd.parent.label" default="Parent" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomStdObjList}" status="i" var="bomStdObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomStdObj.id}">${fieldValue(bean: bomStdObj, field: "prod")}</g:link></td>
					
						<td>${fieldValue(bean: bomStdObj, field: "mark")}</td>
										
						<td>${fieldValue(bean: bomStdObj, field: "quantity")}</td>
					
						<td>${fieldValue(bean: bomStdObj, field: "unit")}</td>
					
						<td>${fieldValue(bean: bomStdObj, field: "parent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomStdObjTotal}" />
			</div>
		</div>
	</body>
</html>
