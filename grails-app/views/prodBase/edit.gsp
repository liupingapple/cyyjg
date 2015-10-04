<%@ page import="cyyjg.ProdBase" %>
<%@ page import="cyyjg.CONSTANT" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prodBase.label', default: 'ProdBase')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-prodBase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-prodBase" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${prodBaseObj}">
			<ul class="errors" role="alert">
				<g:eachError bean="${prodBaseObj}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>


		<g:form class="fieldcontain" method="POST" enctype="multipart/form-data">
			<label><g:message code="prodBase.imageName.label" default="imageName" /></label>
			<!-- or use g:uploadForm which has enctype by default-->
			<g:hiddenField name="id" value="${prodBaseObj?.id }" />
			<input type="file" name="myFile"/>
			<g:actionSubmit action="uploadImage" value="确定" />			
		</g:form>
		<g:if test="${params.imageName}">
			&nbsp;&nbsp;&nbsp;&nbsp;当前图片：${params.imageName }
			<g:img dir="${CONSTANT.PROD_IMAGE_DIR }" file="${params.imageName }"/>
		</g:if>
		<g:elseif test="${prodBaseObj?.imageName }">
			&nbsp;&nbsp;&nbsp;&nbsp;当前图片：${prodBaseObj?.imageName }
			<g:img dir="${CONSTANT.PROD_IMAGE_DIR }" file="${prodBaseObj?.imageName }"/>
		</g:elseif>

		<g:form method="post" >
				<g:hiddenField name="id" value="${prodBaseObj?.id}" />
				<g:hiddenField name="version" value="${prodBaseObj?.version}" />
				<g:hiddenField name="imageName" value="${params?.imageName }" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
						
		</div>
	</body>
</html>
