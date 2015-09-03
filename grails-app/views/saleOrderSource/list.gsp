
<%@ page import="cyyjg.SaleOrderSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'saleOrderSource.label', default: 'SaleOrderSource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-saleOrderSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-saleOrderSource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'saleOrderSource.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="desc" title="${message(code: 'saleOrderSource.desc.label', default: 'Desc')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'saleOrderSource.comment.label', default: 'Comment')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${saleOrderSourceObjList}" status="i" var="saleOrderSourceObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${saleOrderSourceObj.id}">${fieldValue(bean: saleOrderSourceObj, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: saleOrderSourceObj, field: "desc")}</td>
					
						<td>${fieldValue(bean: saleOrderSourceObj, field: "comment")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${saleOrderSourceObjTotal}" />
			</div>
		</div>
	</body>
</html>
