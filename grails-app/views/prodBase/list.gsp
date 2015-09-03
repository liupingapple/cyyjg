
<%@ page import="cyyjg.ProdBase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodBase.label', default: 'ProdBase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prodBase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prodBase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'prodBase.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'prodBase.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'prodBase.type.label', default: 'Type')}" />
					
						<th><g:message code="prodBase.group.label" default="Group" /></th>
					
						<g:sortableColumn property="stdCost" title="${message(code: 'prodBase.stdCost.label', default: 'Std Cost')}" />
					
						<g:sortableColumn property="stdPrice" title="${message(code: 'prodBase.stdPrice.label', default: 'Std Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodBaseObjList}" status="i" var="prodBaseObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodBaseObj.id}">${fieldValue(bean: prodBaseObj, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: prodBaseObj, field: "name")}</td>
					
						<td>${fieldValue(bean: prodBaseObj, field: "type")}</td>
					
						<td>${fieldValue(bean: prodBaseObj, field: "group")}</td>
					
						<td>${fieldValue(bean: prodBaseObj, field: "stdCost")}</td>
					
						<td>${fieldValue(bean: prodBaseObj, field: "stdPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prodBaseObjTotal}" />
			</div>
		</div>
	</body>
</html>
