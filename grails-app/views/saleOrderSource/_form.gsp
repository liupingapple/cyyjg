<%@ page import="cyyjg.SaleOrderSource" %>



<div class="fieldcontain ${hasErrors(bean: saleOrderSourceObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="saleOrderSource.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${saleOrderSourceObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderSourceObj, field: 'desc', 'error')} ">
	<label for="desc">
		<g:message code="saleOrderSource.desc.label" default="Desc" />
		
	</label>
	<g:textField name="desc" value="${saleOrderSourceObj?.desc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: saleOrderSourceObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="saleOrderSource.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${saleOrderSourceObj?.comment}"/>
</div>

