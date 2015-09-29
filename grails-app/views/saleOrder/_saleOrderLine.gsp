
<g:hasErrors bean="${saleOrderLineObj}">
	<ul class="errors" role="alert">
		<g:eachError bean="${saleOrderLineObj}" var="error">
		<li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>

<g:hasErrors bean="${pinst}">
	<ul class="errors" role="alert">
		<g:eachError bean="${pinst}" var="error">
		<li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>

<g:hasErrors bean="${rootBomActual}">
	<ul class="errors" role="alert">
		<g:eachError bean="${rootBomActual}" var="error">
		<li><g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>

<%
session.fromController = 'saleOrder'
session.fromAction = 'show'
session.fromId = saleOrderObj?.id
%>
<table class="table table-bordered text-center">
  <tr>
    <th style="width:12%">操作</th>
    <th style="width:18%">产品&nbsp;[<g:link controller="prod" action="create" params="${['cust.id':saleOrderObj.cust.id] }">新增</g:link>]</th> <!--  -->
    <th style="width:8%">数量(千克)</th>
    <th style="width:15%">价格(元/千克)&nbsp;|&nbsp;总价</th>
    <th style="width:23%">交货日期</th>
    <th>备注</th>
  </tr>
  
  <g:each in="${saleOrderObj?.orderLines?}" var="orderLine" status="i">  
  <g:set var="prodInstruct" value="${cyyjg.ProdInstruct.findBySaleOrderLine(orderLine) }"></g:set>
  
  <!-- please note the controller is saleOrder, not saleOrderLine -->
  <g:form name="form${i+1}" controller="saleOrder" name="orderLineForm" method="post">
  <g:hiddenField name="saleOrder.id" value="${saleOrderObj?.id }"/>
  <tr class="text-center">
   	<g:hiddenField name="id" value="${orderLine.id}"/>
   	<g:hiddenField name="version" value="${orderLine?.version}" />
    <td>
    	<div class="btn-group" role="group" aria-label="...">		  	
    		<g:if test="${!prodInstruct?.rootBomActual  }"> <%--&& !cyyjg.Delivery.findByProdInstruct(prodInstruct) --%>
    			<g:actionSubmit class="btn btn-info btn-xs" action="update_saleOrderLine" value="修改"/>
    		</g:if>
    		<g:if test="${prodInstruct && prodInstruct?.rootBomActual}">
    			<%-- <g:link class="btn btn-success btn-xs" controller="bomActual" action="edit" id="${prodInstruct?.rootBomActual?.id }">生产单</g:link>--%>
    			<a id="showProdBtn${prodInstruct?.rootBomActual?.id }" class="btn btn-success btn-xs glyphicon glyphicon-chevron-down" onclick="showBom(${prodInstruct?.rootBomActual?.id })">
					生产单
				</a>
    		</g:if>
    		<g:else>
    			<g:link class="btn btn-success btn-xs" action="produceInst" id="${orderLine?.id}" onclick="return confirm('确定后，将会生成对应的生产单');">生产</g:link>
    			<g:actionSubmit class="btn btn-danger btn-xs" action="del_saleOrderLine" value="删除"/>
    		</g:else>
		</div>
	</td>
    <td><g:link controller="prod" action="show" id="${orderLine?.prod.id}"> ${orderLine?.prod}</g:link></td>
    <td><g:textField class="qblank" name="quantity" size="3" value="${fieldValue(bean: orderLine, field: 'quantity')}" required=""/></td>
    
    <%--<td><g:select name="unit" from="${orderLine.constraints.unit.inList}" value="${orderLine?.unit}" valueMessagePrefix="saleOrderLine.unit"/></td> --%>  
         
    <td><g:textField class="qblank"  name="price" size="3" value="${orderLine?.price}"/>&nbsp;&nbsp;{${orderLine?.priceFlag}}
    	,&nbsp;共:&nbsp;${ new java.text.DecimalFormat("0.00").format(orderLine.quantity*orderLine.price) }
    </td>
    
    <td><g:datePicker name="deliveryDate" precision="day"  value="${orderLine?.deliveryDate}" default="none" relativeYears="${-3..3 }"/>
    	&nbsp;<g:select name="am_pm" from="${cyyjg.CONSTANT.AM_PM_LIST}" value="${orderLine?.am_pm}" valueMessagePrefix="saleOrderLine.am_pm"/>
    </td>
    
    <td><g:textField class="qblank"  name="comment" size="30" value="${orderLine?.comment}"/></td>
  </tr>
  </g:form>
  <g:if test="${prodInstruct?.rootBomActual }">
	<tr class="text-left" id="bom${prodInstruct?.rootBomActual?.id }" style="display: none">
		<td colspan="6">
			<g:render template="form" contextPath="../bomActual" model="[bomActualObj:prodInstruct?.rootBomActual]"></g:render>
		</td>
	</tr>
  </g:if>
  </g:each>
  
  <g:if test="${saleOrderObj?.status == cyyjg.CONSTANT.ORDER_STATUS_NEW || saleOrderObj?.status == cyyjg.CONSTANT.ORDER_STATUS_CONFIRMED}">
  <g:form name="form_insertSaleOrderLine" controller="saleOrder" name="orderLineForm" method="post">
  <g:hiddenField name="saleOrder.id" value="${saleOrderObj?.id }"/>
  <tr>
    <td>
    	<g:actionSubmit class="btn btn-info btn-xs" action="insert_saleOrderLine" value="增加"/>
    	<a href="#" onClick="showProdSearch()"><span class="glyphicon glyphicon-search"></span></a>
    	<script type="text/javascript">
	        function showProdSearch() {
		        $("#prodSearch").toggle();
			}
        </script>
    </td>
    <td>    
        <g:textField class="qblank" style="display:none" name="prodSearch" value="" size="8" onchange="${remoteFunction(action:'prodSearch', id:saleOrderObj?.cust?.id, update:'prodInput', params:'\'nameFilter=\' + this.value' )}"/>        
        
    	<%--<g:select id="prod" name="prod.id" from="${cyyjg.Prod.findAllByCust(saleOrderObj.cust)}" optionKey="id" required="" value=""/> --%>
    	<g:render template="prodInput_template"/>
    </td>
    <td><g:textField class="qblank"  name="quantity" size="3" value="" required=""/></td>
    
    <g:hiddenField name="unit" value="千克"/>
    <%--<td><g:select name="unit" from="${cyyjg.CONSTANT.UNITs}" value="千克" valueMessagePrefix="saleOrderLine.unit" /></td> --%>
    
    <td><g:select name="price" from="${['A-上次订单价格','B-产品标准价格']}"/></td>
    <td><g:datePicker name="deliveryDate" precision="day"  value="${new Date()}" default="none" relativeYears="${-3..3 }"/>
    	&nbsp;<g:select name="am_pm" from="${cyyjg.CONSTANT.AM_PM_LIST}" value="" valueMessagePrefix="saleOrderLine.am_pm"/>
    </td>
    <td><g:textField class="qblank" name="comment" size="30" value=""/></td>
  </tr>
  </g:form>
  </g:if>
  
</table>

<script type="text/javascript">
	function showBom(rootBomId)
	{
		$("#bom"+rootBomId).toggle();
		if ($("#bom"+rootBomId).is(":hidden")) {
			$("#showProdBtn"+rootBomId).addClass("glyphicon-chevron-down").removeClass("glyphicon-chevron-up");
		} else {
			$("#showProdBtn"+rootBomId).addClass("glyphicon-chevron-up").removeClass("glyphicon-chevron-down");
		}		
	}
</script>

<%--
<g:link class="btn btn-info btn-sm" controller="saleOrderLine" action="create" params="['saleOrder.id': saleOrderObj?.id]">${message(code: 'default.add.label', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine')])}</g:link>
 --%>



<%--
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <g:form name="prod_selector">
        	<div class="row">
			  <div class="col-lg-5">
			    <div class="input-group">
			      <span class="input-group-addon">
			        	产品ID
			      </span>
			      <input type="text" class="form-control" aria-label="...">
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  <div class="col-lg-5">
			    <div class="input-group">
			      <span class="input-group-addon">
			        	产品名称
			      </span>
			      <input type="text" class="form-control" aria-label="...">
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			  <div class="col-lg-2">
			  	<g:link class="btn btn-default">查询</g:link>
			  </div>
			</div><!-- /.row -->
        </g:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onClick="x();">选中</button>
        <script type="text/javascript">
	        function x() {
		        alert($("form[name='form_insertSaleOrderLine']").find($("input[name='comment']")).attr('size'));
				$("#commentX").val($('#selector_prod_name').val()); 
				$('#myModal').modal('toggle');
			}
        </script>
      </div>
    </div>
  </div>
</div>
--%>

