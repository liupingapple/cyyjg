<%@ page import="cyyjg.Delivery" %>



<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="delivery.code.label" default="Code" />
		
	</label>
	<g:textField disabled="true" name="code" value="${deliveryObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'saleOrder', 'error')} required">
	<label for="saleOrder">
		<g:message code="delivery.saleOrder.label" default="Sale Order" />
		<span class="required-indicator">*</span>
	</label>
	${deliveryObj?.saleOrder }
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="delivery.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	${deliveryObj?.prod }
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'addr', 'error')} ">
	<label for="addr">
		<g:message code="delivery.addr.label" default="Addr" />
		
	</label>
	<g:textField name="addr" value="${deliveryObj?.addr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'contact', 'error')} ">
	<label for="contact">
		<g:message code="delivery.contact.label" default="Contact" />
		
	</label>
	<g:textField name="contact" value="${deliveryObj?.contact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'contactPhone', 'error')} ">
	<label for="contactPhone">
		<g:message code="delivery.contactPhone.label" default="Contact Phone" />
		
	</label>
	<g:textField name="contactPhone" value="${deliveryObj?.contactPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="delivery.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${deliveryObj.constraints.status.inList}" value="${deliveryObj?.status}" valueMessagePrefix="delivery.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: deliveryObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="delivery.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${deliveryObj?.comment}"/>
</div>

