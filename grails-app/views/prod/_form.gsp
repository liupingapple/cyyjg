<%@ page import="cyyjg.Prod" %>
<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'custRefCode', 'error')} ">
	<label for="custRefCode">
		<g:message code="prod.custRefCode.label" default="Cust Ref Code" />
		
	</label>
	<g:textField name="custRefCode" value="${prodObj?.custRefCode}" placeholder="不填则由系统生成..." />
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'cust', 'error')} ">
	<label for="cust">
		<g:message code="prod.cust.label" default="Cust" />		
	</label>
	<g:select id="cust" name="cust.id" disabled="${params['cust.id'] != null || params['action'] == 'edit'? 'true' : 'false' }" from="${cyyjg.Customer.list()}" optionKey="id" value="${prodObj?.cust?.id}" class="many-to-one" noSelection="['null': '']"/>
	<g:if test="${params['cust.id'] != null || params['action'] == 'edit'}">
		<g:hiddenField name="cust.id" value="${prodObj?.cust?.id}"/>
	</g:if>
	
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="prod.code.label" default="Code" />
	</label>
	<g:textField name="code" disabled="true" value="${prodObj?.code? prodObj?.code : '将由系统生成...'}"/>
</div>

<g:if test="${(prodObj?.cust?.id && prodObj?.code)}"><g:set var="prodEdit_disabled" value="true"></g:set></g:if><g:else><g:set var="prodEdit_disabled" value="false"></g:set></g:else>
<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'prodBase', 'error')} ">
	<label for="iterStdCode">
		<g:message code="prod.prodBase.label" default="prodBase" />
		
	</label>
	<g:select id="prodBase" name="prodBase.id" disabled="${prodEdit_disabled }" from="${cyyjg.ProdBase.list()}" optionKey="id" value="${prodObj?.prodBase?.id}" class="many-to-one" noSelection="['null': '']" 
		onchange="${remoteFunction(controller:'prod', action:'showProdBase', update:'prodBaseItems', params:'\'prodBaseId=\' + this.value' )}"/>
		
</div>

<div id="prodBaseItems">   <!-- for update by above remoteFunction -->
	<g:render template="prodBaseItems"></g:render>
</div>

<div class="fieldcontain ${hasErrors(bean: prodObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="prod.comment.label" default="Comment" />		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${prodObj?.comment}"/>
</div>


