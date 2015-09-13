
<%@ page import="cyyjg.ProdInstruct" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodInstruct.label', default: 'ProdInstruct')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prodInstruct" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-prodInstruct" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'prodInstruct.code.label', default: 'Code')}" />
					
						<th><g:message code="prodInstruct.saleOrderLine.label" default="Sale Order Line" /></th>
					
						<th><g:message code="prodInstruct.rootBomActual.label" default="Root Bom Actual" /></th>
					
						<th><g:message code="prodInstruct.lastOne.label" default="Last One" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'prodInstruct.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'prodInstruct.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodInstructObjList}" status="i" var="prodInstructObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodInstructObj.id}">${fieldValue(bean: prodInstructObj, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: prodInstructObj, field: "saleOrderLine")}</td>
					
						<td>${fieldValue(bean: prodInstructObj, field: "rootBomActual")}</td>
					
						<td>${fieldValue(bean: prodInstructObj, field: "lastOne")}</td>
					
						<td>${fieldValue(bean: prodInstructObj, field: "status")}</td>
					
						<td>${fieldValue(bean: prodInstructObj, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prodInstructObjTotal}" />
			</div>
		</div>
	</body>
</html>
