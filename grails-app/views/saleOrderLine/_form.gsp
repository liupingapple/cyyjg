<%@ page import="cyyjg.SaleOrderLine" %>



<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'saleOrder', 'error')} required">
	<label for="saleOrder">
		<g:message code="saleOrderLine.saleOrder.label" default="Sale Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="saleOrder" name="saleOrder.id" from="${cyyjg.SaleOrder.list()}" optionKey="id" required="" value="${saleOrderLineObj?.saleOrder?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="saleOrderLine.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${saleOrderLineObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="saleOrderLine.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" value="${fieldValue(bean: saleOrderLineObj, field: 'quantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="saleOrderLine.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${saleOrderLineObj.constraints.unit.inList}" value="${saleOrderLineObj?.unit}" valueMessagePrefix="saleOrderLine.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="saleOrderLine.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: saleOrderLineObj, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'prodBatch', 'error')} ">
	<label for="prodBatch">
		<g:message code="saleOrderLine.prodBatch.label" default="Prod Batch" />
		
	</label>
	<g:select id="prodBatch" name="prodBatch.id" from="${cyyjg.ProdBatch.list()}" optionKey="id" value="${saleOrderLineObj?.prodBatch?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'deliveryDate', 'error')} ">
	<label for="deliveryDate">
		<g:message code="saleOrderLine.deliveryDate.label" default="Delivery Date" />
		
	</label>
	<g:datePicker name="deliveryDate" precision="day"  value="${saleOrderLineObj?.deliveryDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderLineObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="saleOrderLine.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${saleOrderLineObj?.comment}"/>
</div>

