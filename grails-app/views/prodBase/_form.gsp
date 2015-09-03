<%@ page import="cyyjg.ProdBase" %>



<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="prodBase.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${prodBaseObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="prodBase.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${prodBaseObj?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="prodBase.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${prodBaseObj.constraints.type.inList}" value="${prodBaseObj?.type}" valueMessagePrefix="prodBase.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'group', 'error')} ">
	<label for="group">
		<g:message code="prodBase.group.label" default="Group" />
		
	</label>
	<g:select id="group" name="group.id" from="${cyyjg.ProdGroup.list()}" optionKey="id" value="${prodBaseObj?.group?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'stdCost', 'error')} ">
	<label for="stdCost">
		<g:message code="prodBase.stdCost.label" default="Std Cost" />
		
	</label>
	<g:field name="stdCost" value="${fieldValue(bean: prodBaseObj, field: 'stdCost')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'stdPrice', 'error')} ">
	<label for="stdPrice">
		<g:message code="prodBase.stdPrice.label" default="Std Price" />
		
	</label>
	<g:field name="stdPrice" value="${fieldValue(bean: prodBaseObj, field: 'stdPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'agentPrice', 'error')} ">
	<label for="agentPrice">
		<g:message code="prodBase.agentPrice.label" default="Agent Price" />
		
	</label>
	<g:field name="agentPrice" value="${fieldValue(bean: prodBaseObj, field: 'agentPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'batchPrice', 'error')} ">
	<label for="batchPrice">
		<g:message code="prodBase.batchPrice.label" default="Batch Price" />
		
	</label>
	<g:field name="batchPrice" value="${fieldValue(bean: prodBaseObj, field: 'batchPrice')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'minStock', 'error')} ">
	<label for="minStock">
		<g:message code="prodBase.minStock.label" default="Min Stock" />
		
	</label>
	<g:field name="minStock" value="${fieldValue(bean: prodBaseObj, field: 'minStock')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="prodBase.unit.label" default="Unit" />
		
	</label>
	<g:select name="unit" from="${prodBaseObj.constraints.unit.inList}" value="${prodBaseObj?.unit}" valueMessagePrefix="prodBase.unit" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="prodBase.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${prodBaseObj?.comment}"/>
</div>

