
<%@ page import="cyyjg.Prod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prod.label', default: 'Prod')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prod" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'prod.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="iterStdCode" title="${message(code: 'prod.iterStdCode.label', default: 'Iter Std Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'prod.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'prod.type.label', default: 'Type')}" />
					
						<th><g:message code="prod.group.label" default="Group" /></th>
					
						<g:sortableColumn property="stdCost" title="${message(code: 'prod.stdCost.label', default: 'Std Cost')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodObjList}" status="i" var="prodObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodObj.id}">${fieldValue(bean: prodObj, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: prodObj, field: "iterStdCode")}</td>
					
						<td>${fieldValue(bean: prodObj, field: "name")}</td>
					
						<td>${fieldValue(bean: prodObj, field: "type")}</td>
					
						<td>${fieldValue(bean: prodObj, field: "group")}</td>
					
						<td>${fieldValue(bean: prodObj, field: "stdCost")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prodObjTotal}" />
			</div>
		</div>
	</body>
</html>
