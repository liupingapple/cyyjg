<%@ page import="cyyjg.Prod" %>



<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="prod.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${prodObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'iterStdCode', 'error')} ">
	<label for="iterStdCode">
		<g:message code="prod.iterStdCode.label" default="Iter Std Code" />
		
	</label>
	<g:textField name="iterStdCode" value="${prodObj?.iterStdCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="prod.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${prodObj?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="prod.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${prodObj.constraints.type.inList}" value="${prodObj?.type}" valueMessagePrefix="prod.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'group', 'error')} ">
	<label for="group">
		<g:message code="prod.group.label" default="Group" />
		
	</label>
	<g:select id="group" name="group.id" from="${cyyjg.ProdGroup.list()}" optionKey="id" value="${prodObj?.group?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'stdCost', 'error')} ">
	<label for="stdCost">
		<g:message code="prod.stdCost.label" default="Std Cost" />
		
	</label>
	<g:field name="stdCost" value="${fieldValue(bean: prodObj, field: 'stdCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'stdPrice', 'error')} ">
	<label for="stdPrice">
		<g:message code="prod.stdPrice.label" default="Std Price" />
		
	</label>
	<g:field name="stdPrice" value="${fieldValue(bean: prodObj, field: 'stdPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'agentPrice', 'error')} ">
	<label for="agentPrice">
		<g:message code="prod.agentPrice.label" default="Agent Price" />
		
	</label>
	<g:field name="agentPrice" value="${fieldValue(bean: prodObj, field: 'agentPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'batchPrice', 'error')} ">
	<label for="batchPrice">
		<g:message code="prod.batchPrice.label" default="Batch Price" />
		
	</label>
	<g:field name="batchPrice" value="${fieldValue(bean: prodObj, field: 'batchPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="prod.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${prodObj.constraints.unit.inList}" value="${prodObj?.unit}" valueMessagePrefix="prod.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'minStock', 'error')} ">
	<label for="minStock">
		<g:message code="prod.minStock.label" default="Min Stock" />
		
	</label>
	<g:field name="minStock" value="${fieldValue(bean: prodObj, field: 'minStock')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'bomEng', 'error')} ">
	<label for="bomEng">
		<g:message code="prod.bomEng.label" default="Bom Eng" />
		
	</label>
	<g:select id="bomEng" name="bomEng.id" from="${cyyjg.BomEng.list()}" optionKey="id" value="${prodObj?.bomEng?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="prod.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${prodObj?.comment}"/>
</div>

