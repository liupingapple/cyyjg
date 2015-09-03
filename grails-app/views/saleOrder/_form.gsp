<%@ page import="cyyjg.SaleOrder" %>

<div class="panel panel-default">
<div class="panel-heading text-left">订单 ${saleOrderObj?.code}</div>
<table class="table text-left">
  <tr>	
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
	<td class="text-right">
    	<label for="orderSource">
			<g:message code="saleOrder.orderSource.label" default="orderSource" />			
		</label>
	</td>
	<td>
		<g:select id="orderSource" name="orderSource.id" from="${cyyjg.SaleOrderSource.list()}" optionKey="id" required="" value="${saleOrderObj?.orderSource?.id}" class="many-to-one"/>
	</td>
	
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
  <!-- 订单头不用交货日期 -->
  <tr>
  	<td class="text-right">
	  	<label for="comment">
			<g:message code="saleOrder.comment.label" default="Comment" />			
		</label>		
  	</td>
  	<td colspan="3"><g:textArea name="comment" cols="90" rows="2" maxlength="1000" value="${saleOrderObj?.comment}"/></td> 
  	
  	<td colspan="2" class="text-center">
  		<g:if test="${params.action == 'edit' }"> 
  			<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
  		</g:if>
  		<g:if test="${params.action == 'create' }">
  			<g:actionSubmit class="btn btn-primary" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
  		</g:if>
  	</td>	
  </tr>
</table>
</div>
