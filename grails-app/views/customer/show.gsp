
<%@ page import="cyyjg.Customer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-customer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-customer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list customer">
			
				<g:if test="${customerObj?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="customer.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${customerObj}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="customer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${customerObj}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.abrrName}">
				<li class="fieldcontain">
					<span id="abrrName-label" class="property-label"><g:message code="customer.abrrName.label" default="Abrr Name" /></span>
					
						<span class="property-value" aria-labelledby="abrrName-label"><g:fieldValue bean="${customerObj}" field="abrrName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="customer.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${customerObj}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.province}">
				<li class="fieldcontain">
					<span id="province-label" class="property-label"><g:message code="customer.province.label" default="Province" /></span>
					
						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${customerObj}" field="province"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="customer.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${customerObj}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.addr}">
				<li class="fieldcontain">
					<span id="addr-label" class="property-label"><g:message code="customer.addr.label" default="Addr" /></span>
					
						<span class="property-value" aria-labelledby="addr-label"><g:fieldValue bean="${customerObj}" field="addr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.contactInfo}">
				<li class="fieldcontain">
					<span id="contactInfo-label" class="property-label"><g:message code="customer.contactInfo.label" default="Contact Info" /></span>
					
						<span class="property-value" aria-labelledby="contactInfo-label"><g:fieldValue bean="${customerObj}" field="contactInfo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.financeContact}">
				<li class="fieldcontain">
					<span id="financeContact-label" class="property-label"><g:message code="customer.financeContact.label" default="Finance Contact" /></span>
					
						<span class="property-value" aria-labelledby="financeContact-label"><g:fieldValue bean="${customerObj}" field="financeContact"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.cellphone}">
				<li class="fieldcontain">
					<span id="cellphone-label" class="property-label"><g:message code="customer.cellphone.label" default="Cellphone" /></span>
					
						<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${customerObj}" field="cellphone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="customer.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${customerObj}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.buyer}">
				<li class="fieldcontain">
					<span id="buyer-label" class="property-label"><g:message code="customer.buyer.label" default="Buyer" /></span>
					
						<span class="property-value" aria-labelledby="buyer-label"><g:fieldValue bean="${customerObj}" field="buyer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.buyerPhone}">
				<li class="fieldcontain">
					<span id="buyerPhone-label" class="property-label"><g:message code="customer.buyerPhone.label" default="Buyer Phone" /></span>
					
						<span class="property-value" aria-labelledby="buyerPhone-label"><g:fieldValue bean="${customerObj}" field="buyerPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.salesman}">
				<li class="fieldcontain">
					<span id="salesman-label" class="property-label"><g:message code="customer.salesman.label" default="Salesman" /></span>
					
						<span class="property-value" aria-labelledby="salesman-label"><g:fieldValue bean="${customerObj}" field="salesman"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.salesmanPhone}">
				<li class="fieldcontain">
					<span id="salesmanPhone-label" class="property-label"><g:message code="customer.salesmanPhone.label" default="Salesman Phone" /></span>
					
						<span class="property-value" aria-labelledby="salesmanPhone-label"><g:fieldValue bean="${customerObj}" field="salesmanPhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.grossProfitRate}">
				<li class="fieldcontain">
					<span id="grossProfitRate-label" class="property-label"><g:message code="customer.grossProfitRate.label" default="Gross Profit Rate" /></span>
					
						<span class="property-value" aria-labelledby="grossProfitRate-label"><g:fieldValue bean="${customerObj}" field="grossProfitRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.deliveryAddr1}">
				<li class="fieldcontain">
					<span id="deliveryAddr1-label" class="property-label"><g:message code="customer.deliveryAddr1.label" default="Delivery Addr1" /></span>
					
						<span class="property-value" aria-labelledby="deliveryAddr1-label"><g:fieldValue bean="${customerObj}" field="deliveryAddr1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.deliveryAddr2}">
				<li class="fieldcontain">
					<span id="deliveryAddr2-label" class="property-label"><g:message code="customer.deliveryAddr2.label" default="Delivery Addr2" /></span>
					
						<span class="property-value" aria-labelledby="deliveryAddr2-label"><g:fieldValue bean="${customerObj}" field="deliveryAddr2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.deliveryAddr3}">
				<li class="fieldcontain">
					<span id="deliveryAddr3-label" class="property-label"><g:message code="customer.deliveryAddr3.label" default="Delivery Addr3" /></span>
					
						<span class="property-value" aria-labelledby="deliveryAddr3-label"><g:fieldValue bean="${customerObj}" field="deliveryAddr3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.paymentItems}">
				<li class="fieldcontain">
					<span id="paymentItems-label" class="property-label"><g:message code="customer.paymentItems.label" default="Payment Items" /></span>
					
						<span class="property-value" aria-labelledby="paymentItems-label"><g:fieldValue bean="${customerObj}" field="paymentItems"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.paymentCondition}">
				<li class="fieldcontain">
					<span id="paymentCondition-label" class="property-label"><g:message code="customer.paymentCondition.label" default="Payment Condition" /></span>
					
						<span class="property-value" aria-labelledby="paymentCondition-label"><g:fieldValue bean="${customerObj}" field="paymentCondition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.currency}">
				<li class="fieldcontain">
					<span id="currency-label" class="property-label"><g:message code="customer.currency.label" default="Currency" /></span>
					
						<span class="property-value" aria-labelledby="currency-label"><g:fieldValue bean="${customerObj}" field="currency"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.isTax}">
				<li class="fieldcontain">
					<span id="isTax-label" class="property-label"><g:message code="customer.isTax.label" default="Is Tax" /></span>
					
						<span class="property-value" aria-labelledby="isTax-label"><g:formatBoolean boolean="${customerObj?.isTax}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.billDate}">
				<li class="fieldcontain">
					<span id="billDate-label" class="property-label"><g:message code="customer.billDate.label" default="Bill Date" /></span>
					
						<span class="property-value" aria-labelledby="billDate-label"><g:formatDate date="${customerObj?.billDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="customer.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${customerObj}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="customer.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${customerObj?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${customerObj?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="customer.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${customerObj?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${customerObj?.id}" />
					<g:link class="edit" action="edit" id="${customerObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
