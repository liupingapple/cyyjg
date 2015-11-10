<%@page import="cyyjg.CONSTANT"%>
<%@page import="cyyjg.Customer"%>
<td colspan="8">
	<label for="paymentCondition">
		<g:message code="customer.paymentCondition.label" default="Payment Condition" />		
	</label>
	<g:select disabled="${readOnly}" name="paymentCondition" from="${CONSTANT.PAYMENTs}" value="${saleOrderObj?.paymentCondition}" valueMessagePrefix="customer.paymentCondition" noSelection="['': '']"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="currency">
		<g:message code="customer.currency.label" default="Currency" />		
	</label>
	<g:select disabled="${readOnly}" name="currency" from="${CONSTANT.CURRENCYs}" value="${saleOrderObj?.currency}" valueMessagePrefix="customer.currency" noSelection="['': '']"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="isTax">
		<g:message code="customer.isTax.label" default="Is Tax" />		
	</label>
	<g:checkBox disabled="${readOnly}" name="isTax" value="${saleOrderObj?.isTax}" />
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="packageType">
		<g:message code="customer.packageType.label" default="Package Type" />
		
	</label>
	<g:textField disabled="${readOnly}" name="packageType" value="${saleOrderObj?.packageType}"/>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="paymentItems">
		<g:message code="customer.paymentItems.label" default="Payment Items" />
		
	</label>
	<g:textField disabled="${readOnly}" name="paymentItems" value="${saleOrderObj?.paymentItems}"/>
	
</td>


