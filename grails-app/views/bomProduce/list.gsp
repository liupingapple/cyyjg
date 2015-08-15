
<%@ page import="cyyjg.BomProduce" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomProduce.label', default: 'BomProduce')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomProduce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomProduce" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomProduce.saleOrderLine.label" default="Sale Order Line" /></th>
					
						<g:sortableColumn property="comment" title="${message(code: 'bomProduce.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bomProduce.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bomProduce.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomProduceObjList}" status="i" var="bomProduceObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomProduceObj.id}">${fieldValue(bean: bomProduceObj, field: "saleOrderLine")}</g:link></td>
					
						<td>${fieldValue(bean: bomProduceObj, field: "comment")}</td>
					
						<td><g:formatDate date="${bomProduceObj.dateCreated}" /></td>
					
						<td><g:formatDate date="${bomProduceObj.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomProduceObjTotal}" />
			</div>
		</div>
	</body>
</html>
