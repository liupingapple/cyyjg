
<%@ page import="cyyjg.BomEng" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomEng.label', default: 'BomEng')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomEng" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomEng" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomEng.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="comment" title="${message(code: 'bomEng.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bomEng.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bomEng.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomEngObjList}" status="i" var="bomEngObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomEngObj.id}">${fieldValue(bean: bomEngObj, field: "prod")}</g:link></td>
					
						<td>${fieldValue(bean: bomEngObj, field: "comment")}</td>
					
						<td><g:formatDate date="${bomEngObj.dateCreated}" /></td>
					
						<td><g:formatDate date="${bomEngObj.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomEngObjTotal}" />
			</div>
		</div>
	</body>
</html>
