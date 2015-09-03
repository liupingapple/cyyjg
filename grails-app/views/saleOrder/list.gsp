<%@ page import="cyyjg.SaleOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'saleOrder.label', default: 'SaleOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="wrapper">
		<!-- Sidebar -->        
        <g:render template="sidebar"/>
        <!-- /#sidebar-wrapper -->
        
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						<table class="table table-bordered">
							<thead>
								<tr>							
									<g:sortableColumn property="code" title="${message(code: 'saleOrder.code.label', default: 'Code')}" />
								
									<th><g:message code="saleOrder.cust.label" default="Cust" /></th>
									
									<th><g:message code="saleOrder.orderSource.label" default="orderSource" /></th>
																	
									<g:sortableColumn property="status" title="${message(code: 'saleOrder.status.label', default: 'Status')}" />
								
									<g:sortableColumn property="signDate" title="${message(code: 'saleOrder.signDate.label', default: 'Sign Date')}" />
									<%--
									<g:sortableColumn property="deliveryDate" title="${message(code: 'saleOrder.deliveryDate.label', default: 'Delivery Date')}" />
								 --%>
									<g:sortableColumn property="comment" title="${message(code: 'saleOrder.comment.label', default: 'Comment')}" />
								
								</tr>
							</thead>
							<tbody>
							<g:each in="${saleOrderObjList}" status="i" var="saleOrderObj">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><g:link action="show" id="${saleOrderObj.id}">${fieldValue(bean: saleOrderObj, field: "code")}</g:link></td>
								
									<td>${fieldValue(bean: saleOrderObj, field: "cust")}</td>
									
									<td>${fieldValue(bean: saleOrderObj, field: "orderSource")}</td>
								
									<td>${fieldValue(bean: saleOrderObj, field: "status")}</td>
								
									<td><g:formatDate date="${saleOrderObj.signDate}" /></td>
								<%--
									<td><g:formatDate date="${saleOrderObj.deliveryDate}" /></td>
								 --%>
									<td>${fieldValue(bean: saleOrderObj, field: "comment")}</td>
								
								</tr>
							</g:each>
							</tbody>
						</table>
						<div class="pagination">
							<g:paginate total="${saleOrderObjTotal}" />
						</div>

                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->        
	</div>	
	<!-- /#wrapper -->
	
	</body>
</html>
