<%@page import="cyyjg.CONSTANT"%>
<%@ page import="cyyjg.Customer" %>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="customer.code.label" default="Code" />
		
	</label>
	<g:textField name="code" readonly="true" value="${customerObj?.code}" placeholder="将由系统创建..."/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="customer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${customerObj?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'abrrName', 'error')} ">
	<label for="abrrName">
		<g:message code="customer.abrrName.label" default="Abrr Name" />
		
	</label>
	<g:textField name="abrrName" value="${customerObj?.abrrName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="customer.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${customerObj?.country?customerObj?.country:'中国'}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="customer.province.label" default="Province" />
		
	</label>
	<g:select name="province" from="${CONSTANT.PROVINCEs }"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="customer.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${customerObj?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'addr', 'error')} ">
	<label for="addr">
		<g:message code="customer.addr.label" default="Addr" />
		
	</label>
	<g:textField size="60" name="addr" value="${customerObj?.addr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'contactInfo', 'error')} ">
	<label for="contactInfo">
		<g:message code="customer.contactInfo.label" default="Contact Info" />
		
	</label>
	<g:textField name="contactInfo" value="${customerObj?.contactInfo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'financeContact', 'error')} ">
	<label for="financeContact">
		<g:message code="customer.financeContact.label" default="Finance Contact" />
		
	</label>
	<g:textField name="financeContact" value="${customerObj?.financeContact}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="customer.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" value="${customerObj?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="customer.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${customerObj?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'buyer', 'error')} ">
	<label for="buyer">
		<g:message code="customer.buyer.label" default="Buyer" />
		
	</label>
	<g:textField name="buyer" value="${customerObj?.buyer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'buyerPhone', 'error')} ">
	<label for="buyerPhone">
		<g:message code="customer.buyerPhone.label" default="Buyer Phone" />
		
	</label>
	<g:textField name="buyerPhone" value="${customerObj?.buyerPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'salesman', 'error')} ">
	<label for="salesman">
		<g:message code="customer.salesman.label" default="Salesman" />
		
	</label>
	<g:textField name="salesman" value="${customerObj?.salesman}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'salesmanPhone', 'error')} ">
	<label for="salesmanPhone">
		<g:message code="customer.salesmanPhone.label" default="Salesman Phone" />
		
	</label>
	<g:textField name="salesmanPhone" value="${customerObj?.salesmanPhone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'grossProfitRate', 'error')} ">
	<label for="grossProfitRate">
		<g:message code="customer.grossProfitRate.label" default="Gross Profit Rate" />
		
	</label>
	<g:field type="number" name="grossProfitRate" value="${fieldValue(bean: customerObj, field: 'grossProfitRate')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'deliveryAddr1', 'error')} ">
	<label for="deliveryAddr1">
		<g:message code="customer.deliveryAddr1.label" default="Delivery Addr1" />
		
	</label>
	<g:textField size="60" name="deliveryAddr1" value="${customerObj?.deliveryAddr1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'deliveryAddr2', 'error')} ">
	<label for="deliveryAddr2">
		<g:message code="customer.deliveryAddr2.label" default="Delivery Addr2" />
		
	</label>
	<g:textField size="60" name="deliveryAddr2" value="${customerObj?.deliveryAddr2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'deliveryAddr3', 'error')} ">
	<label for="deliveryAddr3">
		<g:message code="customer.deliveryAddr3.label" default="Delivery Addr3" />
		
	</label>
	<g:textField size="60" name="deliveryAddr3" value="${customerObj?.deliveryAddr3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'paymentItems', 'error')} ">
	<label for="paymentItems">
		<g:message code="customer.paymentItems.label" default="Payment Items" />
		
	</label>
	<g:textField name="paymentItems" value="${customerObj?.paymentItems}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'paymentCondition', 'error')} ">
	<label for="paymentCondition">
		<g:message code="customer.paymentCondition.label" default="Payment Condition" />
		
	</label>
	<g:select name="paymentCondition" from="${customerObj.constraints.paymentCondition.inList}" value="${customerObj?.paymentCondition}" valueMessagePrefix="customer.paymentCondition" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'currency', 'error')} ">
	<label for="currency">
		<g:message code="customer.currency.label" default="Currency" />
		
	</label>
	<g:select name="currency" from="${customerObj.constraints.currency.inList}" value="${customerObj?.currency}" valueMessagePrefix="customer.currency" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'isTax', 'error')} ">
	<label for="isTax">
		<g:message code="customer.isTax.label" default="Is Tax" />
		
	</label>
	<g:checkBox name="isTax" value="${customerObj?.isTax}" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'billDate', 'error')} ">
	<label for="billDate">
		<g:message code="customer.billDate.label" default="Bill Date" />
		
	</label>
	<g:datePicker name="billDate" precision="day"  value="${customerObj?.billDate}" default="none" relativeYears="${[-2..2] }" />
</div>

<div class="fieldcontain ${hasErrors(bean: customerObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="customer.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${customerObj?.comment}"/>
</div>

