
<%@ page import="cyyjg.BomProduceComponent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomProduceComponent.label', default: 'BomProduceComponent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomProduceComponent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomProduceComponent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomProduceComponent.produceBOM.label" default="Produce BOM" /></th>
					
						<th><g:message code="bomProduceComponent.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'bomProduceComponent.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="seq" title="${message(code: 'bomProduceComponent.seq.label', default: 'Seq')}" />
					
						<th><g:message code="bomProduceComponent.refEngBOMComponent.label" default="Ref Eng BOMC omponent" /></th>
					
						<g:sortableColumn property="op" title="${message(code: 'bomProduceComponent.op.label', default: 'Op')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomProduceComponentObjList}" status="i" var="bomProduceComponentObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomProduceComponentObj.id}">${fieldValue(bean: bomProduceComponentObj, field: "produceBOM")}</g:link></td>
					
						<td>${fieldValue(bean: bomProduceComponentObj, field: "prod")}</td>
					
						<td>${fieldValue(bean: bomProduceComponentObj, field: "level")}</td>
					
						<td>${fieldValue(bean: bomProduceComponentObj, field: "seq")}</td>
					
						<td>${fieldValue(bean: bomProduceComponentObj, field: "refEngBOMComponent")}</td>
					
						<td>${fieldValue(bean: bomProduceComponentObj, field: "op")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomProduceComponentObjTotal}" />
			</div>
		</div>
	</body>
</html>
