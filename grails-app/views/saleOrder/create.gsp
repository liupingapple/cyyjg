<%@ page import="cyyjg.SaleOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'saleOrder.label', default: 'SaleOrder')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
	<body>		
	<div id="wrapper">

        <!-- Sidebar -->        
        <g:render template="sidebar"/>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid text-center">
                <div class="row">
                    <div class="col-lg-12">
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						<g:hasErrors bean="${saleOrderObj}">
							<ul class="errors" role="alert">
								<g:eachError bean="${saleOrderObj}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						
						<g:form action="save" >
							<fieldset>
								<g:render template="form"/>
							</fieldset>
							<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />					
						</g:form>

                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

	</body>
</html>
