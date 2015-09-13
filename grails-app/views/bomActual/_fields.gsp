<%@page import="cyyjg.CONSTANT"%>
<%@page import="cyyjg.Utils"%>
<%@page import="cyyjg.BomStd"%>
<g:hiddenField name="id" value="${bom?.id}" />
<g:hiddenField name="version" value="${bom?.version}" />
<g:hiddenField name="parentBomId" value="${parentBomId}" />
<g:if test="${bom?.prod?.id }">
	<g:hiddenField name="prod.id" value="${bom?.prod?.id}" />
</g:if>
<g:else>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bom?.prod?.id}" class="many-to-one" noSelection="['': '']"/>
</g:else>

<%--<g:message code="bomActual.quantity.label" default="Quantity" /> --%>
<g:textField class="qblank" name="quantity" size="3" value="${fieldValue(bean: bom, field: 'quantity')}" required=""/>

<%--<g:message code="bomActual.unit.label" default="Unit" />--%>
<g:select name="unit" from="${CONSTANT.UNITs}" value="${bom?.unit}" valueMessagePrefix="bomActual.unit"/>

<g:message code="bomActual.comment.label" default="Comment" />
<g:textField class="qblank" name="comment" size="30" value="${bom?.comment}"/>

<g:if test="${bom?.prod?.id }">
<g:set var="refBomStd" value="${BomStd.get(bom?.refBomStdId) }"></g:set>
<g:set var="lastOrderBomActual" value="${BomStd.get(bom?.refBomStdId) }"></g:set>
<g:if test="${bom.quantity != refBomStd?.quantity}"><g:set var="btnCls" value="btn-danger"></g:set></g:if>
<button type="button" class="btn btn-default ${btnCls } btn-xs" data-toggle="tooltip" data-placement="bottom" title="${refBomStd?.prod}:${refBomStd?.quantity}">参考标准BOM: ${refBomStd?.quantity}</button>
<button type="button" class="btn btn-default ${btnCls } btn-xs" data-toggle="tooltip" data-placement="bottom" title="${refBomStd?.prod}:${refBomStd?.quantity}">上次订单BOM: ${refBomStd?.quantity}</button>
</g:if>