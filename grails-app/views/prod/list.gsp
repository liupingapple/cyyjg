
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
					
						<g:sortableColumn property="custRefCode" title="${message(code: 'prod.custRefCode.label', default: 'Cust Ref Code')}" />
						<g:sortableColumn property="code" title="${message(code: 'prod.code.label', default: 'Code')}" />		
					
						<th><g:message code="prod.cust.label" default="Cust" /></th>					
						<th><g:message code="prodBase.code.label" default="Code" /></th>
						<th><g:message code="prodBase.name.label" default="Name" /></th>
						<th><g:message code="prod.rootBomStdId.label" default="rootBomStdId" /></th>					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prodObjList}" status="i" var="prodObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prodObj.id}">${fieldValue(bean: prodObj, field: "custRefCode")}</g:link></td>
						<td><g:link action="show" id="${prodObj.id}">${fieldValue(bean: prodObj, field: "code")}</g:link></td>
						<td>${fieldValue(bean: prodObj, field: "cust")}</td>
					
						<td>${fieldValue(bean: prodObj, field: "prodBase.code")}</td>										
						<td>${fieldValue(bean: prodObj, field: "prodBase.name")}</td>
						<g:if test="${prodObj.rootBomStdId }">
							<td><g:link controller="bomStd" action="edit" id="${prodObj.rootBomStdId}">查看标准BOM - ${prodObj.rootBomStdId}</g:link></td>
						</g:if>
						<g:else>
							<%-- no need to use ${} for params=..., like params = ${['prod.id': prodObj.id] } --%>
							<td><g:link controller="bomStd" action="create" params="['prod.id' : prodObj?.id]">创建标准BOM</g:link></td>
						</g:else>
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
