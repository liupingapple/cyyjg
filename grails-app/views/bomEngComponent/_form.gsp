<%@ page import="cyyjg.BomEngComponent" %>



<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'bomEng', 'error')} required">
	<label for="bomEng">
		<g:message code="bomEngComponent.bomEng.label" default="Bom Eng" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bomEng" name="bomEng.id" from="${cyyjg.BomEng.list()}" optionKey="id" required="" value="${bomEngComponentObj?.bomEng?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="bomEngComponent.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bomEngComponentObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="bomEngComponent.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" value="${bomEngComponentObj.level}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'seq', 'error')} required">
	<label for="seq">
		<g:message code="bomEngComponent.seq.label" default="Seq" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="seq" type="number" value="${bomEngComponentObj.seq}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'engQuantity', 'error')} required">
	<label for="engQuantity">
		<g:message code="bomEngComponent.engQuantity.label" default="Eng Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="engQuantity" value="${fieldValue(bean: bomEngComponentObj, field: 'engQuantity')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'wasteQuantity', 'error')} ">
	<label for="wasteQuantity">
		<g:message code="bomEngComponent.wasteQuantity.label" default="Waste Quantity" />
		
	</label>
	<g:field name="wasteQuantity" value="${fieldValue(bean: bomEngComponentObj, field: 'wasteQuantity')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="bomEngComponent.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${bomEngComponentObj.constraints.unit.inList}" value="${bomEngComponentObj?.unit}" valueMessagePrefix="bomEngComponent.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'componentParent', 'error')} ">
	<label for="componentParent">
		<g:message code="bomEngComponent.componentParent.label" default="Component Parent" />
		
	</label>
	<g:select id="componentParent" name="componentParent.id" from="${cyyjg.BomEngComponent.list()}" optionKey="id" value="${bomEngComponentObj?.componentParent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'componentChildren', 'error')} ">
	<label for="componentChildren">
		<g:message code="bomEngComponent.componentChildren.label" default="Component Children" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bomEngComponentObj?.componentChildren?}" var="c">
    <li><g:link controller="bomEngComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bomEngComponent" action="create" params="['bomEngComponent.id': bomEngComponentObj?.id]">${message(code: 'default.add.label', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bomEngComponentObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bomEngComponent.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${bomEngComponentObj?.comment}"/>
</div>

