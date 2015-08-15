<%@ page import="cyyjg.BomProduceComponent" %>



<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'produceBOM', 'error')} required">
	<label for="produceBOM">
		<g:message code="bomProduceComponent.produceBOM.label" default="Produce BOM" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="produceBOM" name="produceBOM.id" from="${cyyjg.BomProduce.list()}" optionKey="id" required="" value="${bomProduceComponentObj?.produceBOM?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="bomProduceComponent.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bomProduceComponentObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="bomProduceComponent.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${bomProduceComponentObj.level}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'seq', 'error')} required">
	<label for="seq">
		<g:message code="bomProduceComponent.seq.label" default="Seq" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seq" type="number" value="${bomProduceComponentObj.seq}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'refEngBOMComponent', 'error')} ">
	<label for="refEngBOMComponent">
		<g:message code="bomProduceComponent.refEngBOMComponent.label" default="Ref Eng BOMC omponent" />
		
	</label>
	<g:select id="refEngBOMComponent" name="refEngBOMComponent.id" from="${cyyjg.BomEngComponent.list()}" optionKey="id" value="${bomProduceComponentObj?.refEngBOMComponent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'op', 'error')} ">
	<label for="op">
		<g:message code="bomProduceComponent.op.label" default="Op" />
		
	</label>
	<g:select name="op" from="${bomProduceComponentObj.constraints.op.inList}" value="${bomProduceComponentObj?.op}" valueMessagePrefix="bomProduceComponent.op" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'actualQuantity', 'error')} required">
	<label for="actualQuantity">
		<g:message code="bomProduceComponent.actualQuantity.label" default="Actual Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="actualQuantity" value="${fieldValue(bean: bomProduceComponentObj, field: 'actualQuantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'wasteQuantity', 'error')} required">
	<label for="wasteQuantity">
		<g:message code="bomProduceComponent.wasteQuantity.label" default="Waste Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="wasteQuantity" value="${fieldValue(bean: bomProduceComponentObj, field: 'wasteQuantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="bomProduceComponent.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${bomProduceComponentObj.constraints.unit.inList}" value="${bomProduceComponentObj?.unit}" valueMessagePrefix="bomProduceComponent.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'exceedQuantityInventory', 'error')} ">
	<label for="exceedQuantityInventory">
		<g:message code="bomProduceComponent.exceedQuantityInventory.label" default="Exceed Quantity Inventory" />
		
	</label>
	<g:textField name="exceedQuantityInventory" value="${bomProduceComponentObj?.exceedQuantityInventory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'componentParent', 'error')} required">
	<label for="componentParent">
		<g:message code="bomProduceComponent.componentParent.label" default="Component Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="componentParent" name="componentParent.id" from="${cyyjg.BomProduceComponent.list()}" optionKey="id" required="" value="${bomProduceComponentObj?.componentParent?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'componentChildren', 'error')} ">
	<label for="componentChildren">
		<g:message code="bomProduceComponent.componentChildren.label" default="Component Children" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bomProduceComponentObj?.componentChildren?}" var="c">
    <li><g:link controller="bomProduceComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bomProduceComponent" action="create" params="['bomProduceComponent.id': bomProduceComponentObj?.id]">${message(code: 'default.add.label', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceComponentObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bomProduceComponent.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${bomProduceComponentObj?.comment}"/>
</div>

