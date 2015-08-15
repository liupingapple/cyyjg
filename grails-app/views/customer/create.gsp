<%@ page import="cyyjg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
						<g:hasErrors bean="${customerObj}">
						<ul class="errors" role="alert">
							<g:eachError bean="${customerObj}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
						</g:hasErrors>
						<g:form action="save" >
							<fieldset class="form">
								<g:render template="form"/>
							</fieldset>
							<fieldset class="buttons">
								<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
							</fieldset>
						</g:form>
                    </div>
                 </div>
            </div>
        </div>
    </div>               
	</body>
</html>
