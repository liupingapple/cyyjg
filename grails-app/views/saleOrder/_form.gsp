<%@ page import="cyyjg.SaleOrder" %>

<div class="panel panel-default">
<div class="panel-heading text-left">订单</div>
<table class="table text-left">
  <tr>
  	<!-- column -->
    <td class="text-right">
    	<label for="code">
			<g:message code="saleOrder.code.label" default="Code" />		
		</label>
	</td>
	<td>
		<g:textField name="code" value="${saleOrderObj?.code}"/>
	</td>
	
	<!-- column -->
	<td class="text-right">
    	<label for="cust">
			<g:message code="saleOrder.cust.label" default="Cust" />
			<span class="required-indicator">*</span>
		</label>
	</td>
	<td>
		<g:select id="cust" name="cust.id" from="${cyyjg.Customer.list()}" optionKey="id" required="" value="${saleOrderObj?.cust?.id}" class="many-to-one"/>
	</td>
	
	<!-- column -->
	<g:if test="${saleOrderObj?.status }">
	<td class="text-right">
    	<label for="status">
			<g:message code="saleOrder.status.label" default="Status" />			
		</label>
	</td>
	<td>
		<g:select disabled="true" name="status" from="${saleOrderObj.constraints.status.inList}" value="${saleOrderObj?.status}" valueMessagePrefix="saleOrder.status" noSelection="['': '']"/>
	</td>
	</g:if>
	<g:else>
		<td>&nbsp;</td><td>&nbsp;</td>
	</g:else>
	
	<!-- column -->
	<td class="text-right">
    	<label for="signDate">
			<g:message code="saleOrder.signDate.label" default="Sign Date" />
			<span class="required-indicator">*</span>
		</label>
	</td>
	<td>
		<g:datePicker name="signDate" precision="day"  value="${saleOrderObj?.signDate}"  relativeYears="${-3..3 }" />
		<%--<g:textField name="signDate" value="${saleOrderObj?.signDate}" data-date-format="yyyy-mm-dd" readonly="true"/>
		<span class="glyphicon glyphicon-calendar"></span>
		<script type="text/javascript">
			$(function() {
				$('#signDate').datepicker();
			})
		</script>--%>
	</td>
  <!-- row -->
  </tr>
  <tr>	
	<!-- column -->
	<td class="text-right">
    	<label for="deliveryDate">
			<g:message code="saleOrder.deliveryDate.label" default="Delivery Date" />
			<span class="required-indicator">*</span>
		</label>
	</td>
	<td>
		<g:datePicker name="deliveryDate" precision="day"  value="${saleOrderObj?.deliveryDate}" relativeYears="${-3..3 }" />
		<%--<g:textField name="deliveryDate" value="${saleOrderObj?.deliveryDate}" data-date-format="yyyy-mm-dd" readonly="true"/>
		<span class="glyphicon glyphicon-calendar"></span>
		<script type="text/javascript">
			$(function() {
				$('#deliveryDate').datepicker();
			})
		</script>--%>
	</td>
	<td colspan="6">&nbsp;</td>
  </tr>
  
  <tr>
  	<td class="text-right">
	  	<label for="comment">
			<g:message code="saleOrder.comment.label" default="Comment" />			
		</label>		
  	</td>
  	<td colspan="7"><g:textArea name="comment" cols="80" rows="3" maxlength="1000" value="${saleOrderObj?.comment}"/></td>  	
  </tr>
</table>
</div>
