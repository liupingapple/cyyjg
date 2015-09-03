<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="prodBase.type.label" default="type" />
	</label>
	<g:textField name="type" disabled="true" value="${prodBaseObj?.type? prodBaseObj?.type : prodObj?.prodBase?.type}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'group', 'error')} ">
	<label for="group">
		<g:message code="prodBase.group.label" default="group" />
	</label>
	<g:textField name="group" disabled="true" value="${prodBaseObj?.group? prodBaseObj?.group : prodObj?.prodBase?.group}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'stdCost', 'error')} ">
	<label for="stdCost">
		<g:message code="prodBase.stdCost.label" default="stdCost" />
	</label>
	<g:textField name="stdCost" disabled="true" value="${prodBaseObj?.stdCost? prodBaseObj?.stdCost : prodObj?.prodBase?.stdCost}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'stdPrice', 'error')} ">
	<label for="stdPrice">
		<g:message code="prodBase.stdPrice.label" default="stdPrice" />
	</label>
	<g:textField name="stdPrice" disabled="true" value="${prodBaseObj?.stdPrice? prodBaseObj?.stdPrice : prodObj?.prodBase?.stdPrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'agentPrice', 'error')} ">
	<label for="agentPrice">
		<g:message code="prodBase.agentPrice.label" default="agentPrice" />
	</label>
	<g:textField name="agentPrice" disabled="true" value="${prodBaseObj?.agentPrice? prodBaseObj?.agentPrice : prodObj?.prodBase?.agentPrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'batchPrice', 'error')} ">
	<label for="batchPrice">
		<g:message code="prodBase.batchPrice.label" default="batchPrice" />
	</label>
	<g:textField name="batchPrice" disabled="true" value="${prodBaseObj?.batchPrice? prodBaseObj?.batchPrice : prodObj?.prodBase?.batchPrice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="prodBase.stdPrice.label" default="unit" />
	</label>
	<g:textField name="unit" disabled="true" value="${prodBaseObj?.unit? prodBaseObj?.unit : prodObj?.prodBase?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: prodBaseObj, field: 'minStock', 'error')} ">
	<label for="minStock">
		<g:message code="prodBase.minStock.label" default="minStock" />
	</label>
	<g:textField name="minStock" disabled="true" value="${prodBaseObj?.minStock? prodBaseObj?.minStock : prodObj?.prodBase?.minStock}"/>
</div>
