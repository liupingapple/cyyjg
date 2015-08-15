<%@ page import="cyyjg.BomProduce" %>



<div class="fieldcontain ${hasErrors(bean: bomProduceObj, field: 'saleOrderLine', 'error')} required">
	<label for="saleOrderLine">
		<g:message code="bomProduce.saleOrderLine.label" default="Sale Order Line" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="saleOrderLine" name="saleOrderLine.id" from="${cyyjg.SaleOrderLine.list()}" optionKey="id" required="" value="${bomProduceObj?.saleOrderLine?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceObj, field: 'components', 'error')} ">
	<label for="components">
		<g:message code="bomProduce.components.label" default="Components" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bomProduceObj?.components?}" var="c">
    <li><g:link controller="bomProduceComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bomProduceComponent" action="create" params="['bomProduce.id': bomProduceObj?.id]">${message(code: 'default.add.label', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bomProduceObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bomProduce.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${bomProduceObj?.comment}"/>
</div>

