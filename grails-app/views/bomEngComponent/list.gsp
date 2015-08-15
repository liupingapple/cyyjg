
<%@ page import="cyyjg.BomEngComponent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bomEngComponent.label', default: 'BomEngComponent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bomEngComponent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bomEngComponent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="bomEngComponent.bomEng.label" default="Bom Eng" /></th>
					
						<th><g:message code="bomEngComponent.prod.label" default="Prod" /></th>
					
						<g:sortableColumn property="level" title="${message(code: 'bomEngComponent.level.label', default: 'Level')}" />
					
						<g:sortableColumn property="seq" title="${message(code: 'bomEngComponent.seq.label', default: 'Seq')}" />
					
						<g:sortableColumn property="engQuantity" title="${message(code: 'bomEngComponent.engQuantity.label', default: 'Eng Quantity')}" />
					
						<g:sortableColumn property="wasteQuantity" title="${message(code: 'bomEngComponent.wasteQuantity.label', default: 'Waste Quantity')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bomEngComponentObjList}" status="i" var="bomEngComponentObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bomEngComponentObj.id}">${fieldValue(bean: bomEngComponentObj, field: "bomEng")}</g:link></td>
					
						<td>${fieldValue(bean: bomEngComponentObj, field: "prod")}</td>
					
						<td>${fieldValue(bean: bomEngComponentObj, field: "level")}</td>
					
						<td>${fieldValue(bean: bomEngComponentObj, field: "seq")}</td>
					
						<td>${fieldValue(bean: bomEngComponentObj, field: "engQuantity")}</td>
					
						<td>${fieldValue(bean: bomEngComponentObj, field: "wasteQuantity")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bomEngComponentObjTotal}" />
			</div>
		</div>
	</body>
</html>
