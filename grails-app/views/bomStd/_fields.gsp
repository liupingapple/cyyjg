<%@page import="cyyjg.CONSTANT"%>
<g:hiddenField name="id" value="${bom?.id}" />
<g:hiddenField name="version" value="${bom?.version}" />
<g:hiddenField name="parentBomId" value="${parentBomId}" />
<g:if test="${bom?.prod?.id }">
	<g:hiddenField name="prod.id" value="${bom?.prod?.id}" />
</g:if>
<g:else>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bom?.prod?.id}" class="many-to-one" noSelection="['': '']"/>
</g:else>

<%--<g:message code="bomStd.quantity.label" default="Quantity" /> --%>
<g:textField class="qblank" name="quantity" size="3" value="${fieldValue(bean: bom, field: 'quantity')}" required=""/>

<%--<g:message code="bomStd.unit.label" default="Unit" />--%>
<g:select name="unit" from="${CONSTANT.UNITs}" value="${bom?.unit}" valueMessagePrefix="bomStd.unit"/>

<g:message code="bomStd.comment.label" default="Comment" />
<g:textField class="qblank" name="comment" size="30" value="${bom?.comment}"/>
