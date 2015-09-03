<%@ page import="cyyjg.ProdGroup" %>



<div class="fieldcontain ${hasErrors(bean: prodGroupObj, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="prodGroup.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${prodGroupObj?.name}"/>
</div>

