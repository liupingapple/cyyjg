<%@ page import="cyyjg.ProdInstruct" %>



<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="prodInstruct.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${prodInstructObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'saleOrderLine', 'error')} required">
	<label for="saleOrderLine">
		<g:message code="prodInstruct.saleOrderLine.label" default="Sale Order Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="saleOrderLine" name="saleOrderLine.id" from="${cyyjg.SaleOrderLine.list()}" optionKey="id" required="" value="${prodInstructObj?.saleOrderLine?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'bomActual', 'error')} ">
	<label for="bomActual">
		<g:message code="prodInstruct.bomActual.label" default="Bom Actual" />
		
	</label>
	<g:select id="bomActual" name="bomActual.id" from="${cyyjg.BomActual.list()}" optionKey="id" value="${prodInstructObj?.bomActual?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'lastOne', 'error')} ">
	<label for="lastOne">
		<g:message code="prodInstruct.lastOne.label" default="Last One" />
		
	</label>
	<g:select id="lastOne" name="lastOne.id" from="${cyyjg.ProdInstruct.list()}" optionKey="id" value="${prodInstructObj?.lastOne?.id}" class="many-to-one" noSelection="['null': '']"/>
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

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'lastProduceCode', 'error')} required">
	<label for="lastProduceCode">
		<g:message code="prodInstruct.lastProduceCode.label" default="Last Produce Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastProduceCode" precision="day"  value="${prodInstructObj?.lastProduceCode}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: prodInstructObj, field: 'lastProduceDate', 'error')} required">
	<label for="lastProduceDate">
		<g:message code="prodInstruct.lastProduceDate.label" default="Last Produce Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastProduceDate" precision="day"  value="${prodInstructObj?.lastProduceDate}"  />
</div>

