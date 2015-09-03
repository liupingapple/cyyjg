<%@ page import="cyyjg.BomActual" %>



<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="bomActual.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bomActualObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="bomActual.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${bomActualObj.level}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'seq', 'error')} required">
	<label for="seq">
		<g:message code="bomActual.seq.label" default="Seq" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seq" type="number" value="${bomActualObj.seq}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="bomActual.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${bomActualObj.constraints.unit.inList}" value="${bomActualObj?.unit}" valueMessagePrefix="bomActual.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="bomActual.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${cyyjg.Bom.list()}" optionKey="id" value="${bomActualObj?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'children', 'error')} ">
	<label for="children">
		<g:message code="bomActual.children.label" default="Children" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bomActual.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${bomActualObj?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'prodInstruct', 'error')} required">
	<label for="prodInstruct">
		<g:message code="bomActual.prodInstruct.label" default="Prod Instruct" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prodInstruct" name="prodInstruct.id" from="${cyyjg.ProdInstruct.list()}" optionKey="id" required="" value="${bomActualObj?.prodInstruct?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'modifiedBy', 'error')} required">
	<label for="modifiedBy">
		<g:message code="bomActual.modifiedBy.label" default="Modified By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modifiedBy" name="modifiedBy.id" from="${cyyjg.EndUser.list()}" optionKey="id" required="" value="${bomActualObj?.modifiedBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="bomActual.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${bomActualObj.constraints.status.inList}" value="${bomActualObj?.status}" valueMessagePrefix="bomActual.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomActualObj, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="bomActual.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" value="${fieldValue(bean: bomActualObj, field: 'quantity')}" required=""/>
</div>

