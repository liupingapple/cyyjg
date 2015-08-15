<%@ page import="cyyjg.Customer" %>

<table class="table text-left">
  <tr>
	 	<!-- column -->
	   <td class="text-right">
	   	<label for="code">
			<g:message code="customer.code.label" default="Code" />		
		</label>		
	   </td>
	   <td><g:textField name="code" value="${customerObj?.code}"/></td>
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="name">
			<g:message code="customer.name.label" default="Name" />			
		</label>		
	   </td>
	   <td><g:textField name="name" value="${customerObj?.name}"/></td>
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="abrrName">
			<g:message code="customer.abrrName.label" default="Abrr Name" />			
		</label>		
	   </td>
	   <td><g:textField name="abrrName" value="${customerObj?.abrrName}"/></td>
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="country">
			<g:message code="customer.country.label" default="Country" />		
		</label>		
	   </td>
	   <td><g:textField name="country" value="${customerObj?.country}"/></td>    
  </tr>  
  		
  <tr>
  		<!-- column -->
	   <td class="text-right">
	   	<label for="province">
			<g:message code="customer.province.label" default="Province" />			
		</label>		
	   </td>
	   <td><g:textField name="province" value="${customerObj?.province}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="city">
			<g:message code="customer.city.label" default="City" />			
		</label>		
	   </td>
	   <td><g:textField name="city" value="${customerObj?.city}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="addr">
			<g:message code="customer.addr.label" default="Addr" />			
		</label>		
	   </td>
	   <td><g:textField name="addr" value="${customerObj?.addr}"/></td> 
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="contactInfo">
			<g:message code="customer.contactInfo.label" default="Contact Info" />			
		</label>		
	   </td>
	   <td><g:textField name="contactInfo" value="${customerObj?.contactInfo}"/></td>  
  </tr>
  
  <tr>
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="financeContact">
			<g:message code="customer.financeContact.label" default="Finance Contact" />		
		</label>		
	   </td>
	   <td><g:textField name="financeContact" value="${customerObj?.financeContact}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="cellphone">
			<g:message code="customer.cellphone.label" default="Cellphone" />			
		</label>		
	   </td>
	   <td><g:textField name="cellphone" value="${customerObj?.cellphone}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="phone">
			<g:message code="customer.phone.label" default="Phone" />			
		</label>		
	   </td>
	   <td><g:textField name="phone" value="${customerObj?.phone}"/></td> 
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="buyer">
			<g:message code="customer.buyer.label" default="Buyer" />			
		</label>		
	   </td>
	   <td><g:textField name="buyer" value="${customerObj?.buyer}"/></td>  
  </tr>
  
  <tr>
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="buyerPhone">
			<g:message code="customer.buyerPhone.label" default="Buyer Phone" />		
		</label>		
	   </td>
	   <td><g:textField name="buyerPhone" value="${customerObj?.buyerPhone}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="salesman">
			<g:message code="customer.salesman.label" default="Salesman" />			
		</label>		
	   </td>
	   <td><g:textField name="salesman" value="${customerObj?.salesman}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="salesmanPhone">
			<g:message code="customer.salesmanPhone.label" default="Salesman Phone" />			
		</label>		
	   </td>
	   <td><g:textField name="salesmanPhone" value="${customerObj?.salesmanPhone}"/></td> 
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="grossProfitRate">
			<g:message code="customer.grossProfitRate.label" default="Gross Profit Rate" />			
		</label>		
	   </td>
	   <td><g:textField name="grossProfitRate" value="${customerObj?.grossProfitRate}"/></td>  
  </tr>
  
  <tr>
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="deliveryAddr1">
			<g:message code="customer.deliveryAddr1.label" default="Delivery Addr1" />			
		</label>		
	   </td>
	   <td><g:textField name="deliveryAddr1" value="${customerObj?.deliveryAddr1}"/></td>  
	   
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="deliveryAddr2">
			<g:message code="customer.deliveryAddr2.label" default="Delivery Addr2" />			
		</label>		
	   </td>
	   <td><g:textField name="deliveryAddr2" value="${customerObj?.deliveryAddr2}"/></td>  
	   
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="deliveryAddr3">
			<g:message code="customer.deliveryAddr3.label" default="Delivery Addr3" />			
		</label>		
	   </td>
	   <td><g:textField name="deliveryAddr3" value="${customerObj?.deliveryAddr3}"/></td>  
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="paymentItems">
			<g:message code="customer.paymentItems.label" default="Payment Items" />			
		</label>	
	   </td>
	   <td><g:textField name="paymentItems" value="${customerObj?.paymentItems}"/></td>  
  </tr>  
  
  <tr>
  	   <!-- column -->
	   <td class="text-right">
	   	<label for="paymentCondition">
			<g:message code="customer.paymentCondition.label" default="Payment Condition" />			
		</label>	
	   </td>
	   <td><g:select name="paymentCondition" from="${customerObj.constraints.paymentCondition.inList}" value="${customerObj?.paymentCondition}" valueMessagePrefix="customer.paymentCondition" noSelection="['': '']"/></td> 
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="currency">
			<g:message code="customer.currency.label" default="Currency" />			
		</label>	
	   </td>
	   <td><g:select name="currency" from="${customerObj.constraints.currency.inList}" value="${customerObj?.currency}" valueMessagePrefix="customer.currency" noSelection="['': '']"/></td>
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="isTax">
			<g:message code="customer.isTax.label" default="Is Tax" />			
		</label>
	   </td>
	   <td><g:checkBox name="isTax" value="${customerObj?.isTax}" /></td>
	   
	   <!-- column -->
	   <td class="text-right">
	   	<label for="billDate">
			<g:message code="customer.billDate.label" default="Bill Date" />			
		</label>
	   </td>
	   <td><g:datePicker name="billDate" precision="day"  value="${customerObj?.billDate}" default="none" noSelection="['': '']" /></td>
	     
  </tr>  
  
  <tr>
	   <!-- column -->
	   <td class="text-right">
	   	<label for="comment">
			<g:message code="customer.comment.label" default="Comment" />			
		</label>
	   </td>
	   <td class="text-left"  colspan="7"><g:textArea name="comment" cols="100" rows="4" maxlength="1000" value="${customerObj?.comment}"/></td>
  </tr>
  
</table>

