
<%@ page import="cyyjg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-customer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'customer.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="abrrName" title="${message(code: 'customer.abrrName.label', default: 'Abrr Name')}" />
					
						<g:sortableColumn property="contactInfo" title="${message(code: 'customer.contactInfo.label', default: 'ContactInfo')}" />
					
						<g:sortableColumn property="financeContact" title="${message(code: 'customer.financeContact.label', default: 'FinanceContact')}" />
					
						<g:sortableColumn property="paymentCondition" title="${message(code: 'customer.paymentCondition.label', default: 'PaymentCondition')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${customerObjList}" status="i" var="customerObj">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${customerObj.id}">${fieldValue(bean: customerObj, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: customerObj, field: "name")}</td>
					
						<td>${fieldValue(bean: customerObj, field: "abrrName")}</td>
					
						<td>${fieldValue(bean: customerObj, field: "contactInfo")}</td>
					
						<td>${fieldValue(bean: customerObj, field: "financeContact")}</td>
					
						<td>${fieldValue(bean: customerObj, field: "paymentCondition")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${customerObjTotal}" />
			</div>
		</div>
	</body>
</html>
