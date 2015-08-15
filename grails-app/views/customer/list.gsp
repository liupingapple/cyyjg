
<%@ page import="cyyjg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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
									<g:sortableColumn property="code" title="${message(code: 'customer.code.label', default: 'Code')}" />
								
									<g:sortableColumn property="name" title="${message(code: 'customer.name.label', default: 'Name')}" />
								
									<g:sortableColumn property="abrrName" title="${message(code: 'customer.abrrName.label', default: 'Abrr Name')}" />
								
									<g:sortableColumn property="country" title="${message(code: 'customer.country.label', default: 'Country')}" />
								
									<g:sortableColumn property="province" title="${message(code: 'customer.province.label', default: 'Province')}" />
								
									<g:sortableColumn property="city" title="${message(code: 'customer.city.label', default: 'City')}" />
								
								</tr>
							</thead>
							<tbody>
							<g:each in="${customerObjList}" status="i" var="customerObj">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
									<td><g:link action="show" id="${customerObj.id}">${fieldValue(bean: customerObj, field: "code")}</g:link></td>
								
									<td>${fieldValue(bean: customerObj, field: "name")}</td>
								
									<td>${fieldValue(bean: customerObj, field: "abrrName")}</td>
								
									<td>${fieldValue(bean: customerObj, field: "country")}</td>
								
									<td>${fieldValue(bean: customerObj, field: "province")}</td>
								
									<td>${fieldValue(bean: customerObj, field: "city")}</td>
								
								</tr>
							</g:each>
							</tbody>
						</table>
						<div class="pagination">
							<g:paginate total="${customerObjTotal}" />
						</div>
                    </div>
                 </div>
             </div>
         </div>
        
	</div>
	</body>
</html>
