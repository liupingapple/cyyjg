<%@ page import="cyyjg.ProdInventory" %>



<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'place', 'error')} ">
	<label for="place">
		<g:message code="prodInventory.place.label" default="Place" />
		
	</label>
	<g:select name="place" from="${prodInventoryObj.constraints.place.inList}" value="${prodInventoryObj?.place}" valueMessagePrefix="prodInventory.place" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="prodInventory.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${prodInventoryObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'batch', 'error')} ">
	<label for="batch">
		<g:message code="prodInventory.batch.label" default="Batch" />
		
	</label>
	<g:select id="batch" name="batch.id" from="${cyyjg.ProdBatch.list()}" optionKey="id" value="${prodInventoryObj?.batch?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'prodInvType', 'error')} ">
	<label for="prodInvType">
		<g:message code="prodInventory.prodInvType.label" default="Prod Inv Type" />
		
	</label>
	<g:select name="prodInvType" from="${prodInventoryObj.constraints.prodInvType.inList}" value="${prodInventoryObj?.prodInvType}" valueMessagePrefix="prodInventory.prodInvType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="prodInventory.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" value="${fieldValue(bean: prodInventoryObj, field: 'quantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="prodInventory.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${prodInventoryObj.constraints.unit.inList}" value="${prodInventoryObj?.unit}" valueMessagePrefix="prodInventory.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'opCode', 'error')} ">
	<label for="opCode">
		<g:message code="prodInventory.opCode.label" default="Op Code" />
		
	</label>
	<g:textField name="opCode" value="${prodInventoryObj?.opCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'op', 'error')} ">
	<label for="op">
		<g:message code="prodInventory.op.label" default="Op" />
		
	</label>
	<g:select name="op" from="${prodInventoryObj.constraints.op.inList}" value="${prodInventoryObj?.op}" valueMessagePrefix="prodInventory.op" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'entryDate', 'error')} required">
	<label for="entryDate">
		<g:message code="prodInventory.entryDate.label" default="Entry Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="entryDate" precision="day"  value="${prodInventoryObj?.entryDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'deadLine', 'error')} required">
	<label for="deadLine">
		<g:message code="prodInventory.deadLine.label" default="Dead Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="deadLine" type="number" value="${prodInventoryObj.deadLine}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="prodInventory.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${prodInventoryObj?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'fromPlace', 'error')} ">
	<label for="fromPlace">
		<g:message code="prodInventory.fromPlace.label" default="From Place" />
		
	</label>
	<g:textField name="fromPlace" value="${prodInventoryObj?.fromPlace}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="prodInventory.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${prodInventoryObj?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodInventoryObj, field: 'toPlace', 'error')} ">
	<label for="toPlace">
		<g:message code="prodInventory.toPlace.label" default="To Place" />
		
	</label>
	<g:textField name="toPlace" value="${prodInventoryObj?.toPlace}"/>
</div>

