<%@page import="cyyjg.Customer"%>
<%@page import="cyyjg.CONSTANT"%>
<%@page import="cyyjg.Utils"%>
<g:hiddenField name="id" value="${bom?.id}" />
<g:hiddenField name="version" value="${bom?.version}" />
<g:hiddenField name="parentBomId" value="${parentBomId}" />
<g:if test="${bom?.prod?.id }">
	<g:hiddenField name="prod.id" value="${bom?.prod?.id}" />
</g:if>
<g:else>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.findAllByCust(Customer.findByCode('0'))}" optionKey="id" required="" value="${bom?.prod?.id}" class="many-to-one" noSelection="['': '']"/>
</g:else>

<%--<g:message code="bomStd.quantity.label" default="Quantity" /> --%>
<g:textField class="qblank" name="quantity" size="3" value="${fieldValue(bean: bom, field: 'quantity')}" required=""/>
<g:if test="${Utils.isRootBom(bom) }">千克 <g:hiddenField name="unit" value="千克" /></g:if>
<g:else>克 <g:hiddenField name="unit" value="克" /></g:else>

<%--<g:message code="bomStd.unit.label" default="Unit" />
<g:select name="unit" from="${CONSTANT.UNITs}" value="${bom?.unit}" valueMessagePrefix="bomStd.unit"/>

<g:message code="bomStd.comment.label" default="Comment" />
<g:textField class="qblank" name="comment" size="30" value="${bom?.comment}"/>
--%>