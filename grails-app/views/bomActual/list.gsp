
<%@ page import="cyyjg.BomActual" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomActual.label', default: 'BomActual')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomActual" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomActual" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomActual.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'bomActual.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="seq" title="${message(code: 'bomActual.seq.label', default: 'Seq')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'bomActual.unit.label', default: 'Unit')}" />
					
						<th><g:message code="bomActual.parent.label" default="Parent" /></th>
					
						<g:sortableColumn property="comment" title="${message(code: 'bomActual.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomActualObjList}" status="i" var="bomActualObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomActualObj.id}">${fieldValue(bean: bomActualObj, field: "prod")}</g:link></td>
					
						<td>${fieldValue(bean: bomActualObj, field: "level")}</td>
					
						<td>${fieldValue(bean: bomActualObj, field: "seq")}</td>
					
						<td>${fieldValue(bean: bomActualObj, field: "unit")}</td>
					
						<td>${fieldValue(bean: bomActualObj, field: "parent")}</td>
					
						<td>${fieldValue(bean: bomActualObj, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomActualObjTotal}" />
			</div>
		</div>
	</body>
</html>
