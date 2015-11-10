
<%@ page import="cyyjg.Delivery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="wrapper">
		<!-- Sidebar -->
		<g:render template="sidebar" />
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">

						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						
						<table class="table table-bordered">
							<thead>
								<tr>								
									<g:sortableColumn property="code" title="${message(code: 'delivery.code.label', default: 'Code')}" />
								
									<th><g:message code="delivery.saleOrder.label" default="Sale Order" /></th>
									
									<th>客户</th>
								
									<th><g:message code="delivery.prod.label" default="Prod" /></th>
								
									<g:sortableColumn property="addr" title="${message(code: 'delivery.addr.label', default: 'Addr')}" />
								
									<g:sortableColumn property="contact" title="${message(code: 'delivery.contact.label', default: 'Contact')}" />
								
									<g:sortableColumn property="contactPhone" title="${message(code: 'delivery.contactPhone.label', default: 'Contact Phone')}" />
								
								</tr>
							</thead>
							<tbody>
							<g:each in="${deliveryObjList}" status="i" var="deliveryObj">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><g:link action="show" id="${deliveryObj.id}">${fieldValue(bean: deliveryObj, field: "code")}</g:link></td>
								
									<td>${fieldValue(bean: deliveryObj, field: "saleOrder.code")}</td>
									
									<td>${fieldValue(bean: deliveryObj, field: "saleOrder.cust")}</td>
								
									<td>${fieldValue(bean: deliveryObj, field: "prod")}</td>
								
									<td>${fieldValue(bean: deliveryObj, field: "addr")}</td>
								
									<td>${fieldValue(bean: deliveryObj, field: "contact")}</td>
								
									<td>${fieldValue(bean: deliveryObj, field: "contactPhone")}</td>
								
								</tr>
							</g:each>
							</tbody>
						</table>
						<div class="pagination">
							<g:paginate total="${deliveryObjTotal}" />
						</div>
						
						</div>
					</div>
				</div>
			</div>			
		</div>
	</body>
</html>
