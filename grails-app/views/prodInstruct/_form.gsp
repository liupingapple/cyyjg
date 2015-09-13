<%@ page import="cyyjg.ProdInstruct" %>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="prodInstruct.code.label" default="Code" />
		
	</label>
	<g:textField disabled="true" name="code" value="${prodInstructObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'saleOrderLine', 'error')} required">
	<label for="saleOrderLine">
		<g:message code="prodInstruct.saleOrderLine.label" default="Sale Order Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:select disabled="true" id="saleOrderLine" name="saleOrderLine.id" from="${cyyjg.SaleOrderLine.list()}" optionKey="id" required="" value="${prodInstructObj?.saleOrderLine?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'rootBomActual', 'error')} ">
	<label for="rootBomActual">
		<g:message code="prodInstruct.rootBomActual.label" default="Root Bom Actual" />
		
	</label>
	<g:select disabled="true" id="rootBomActual" name="rootBomActual.id" from="${cyyjg.BomActual.list()}" optionKey="id" value="${prodInstructObj?.rootBomActual?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'lastOne', 'error')} ">
	<label for="lastOne">
		<g:message code="prodInstruct.lastOne.label" default="Last One" />
		
	</label>
	<g:select disabled="true" id="lastOne" name="lastOne.id" from="${cyyjg.ProdInstruct.list()}" optionKey="id" value="${prodInstructObj?.lastOne?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="prodInstruct.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${prodInstructObj.constraints.status.inList}" value="${prodInstructObj?.status}" valueMessagePrefix="prodInstruct.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="prodInstruct.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${prodInstructObj?.comment}"/>
</div>

