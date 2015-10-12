<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
<p>
<div class="container">
<div class="panel panel-warning">

	<div class="panel-heading">
		送货单号: ${deliveryObj.code }
	</div>
	<div class="panel-body">
		<%--<table class="table table-striped table-condensed">
			<tr><td>产品</td><td></td>  <td>数量</td><td></td> </tr>
			<tr><td>客户</td><td></td>  <td>联系人</td><td></td> </tr>	
		</table>
	--%>
	
	<dl class="dl-horizontal" style="font-size:16">
	  <dt>客户</dt>
	  <dd>${deliveryObj.saleOrder.cust }</dd>
	  <dt>地址</dt>
	  <dd>${deliveryObj.addr }</dd>
	  <dt>收货人</dt>
	  <dd>${deliveryObj.contact }</dd>
	  <dt>收货人电话</dt>
	  <dd>${deliveryObj.contactPhone }</dd>
	  <dt>产品</dt>
	  <dd>${deliveryObj.prod }</dd>
	  <dt>数量</dt>
	  <dd>${deliveryObj.quantity }&nbsp;${deliveryObj.saleOrderLine.unit }</dd>
	  <dt>订单</dt>
	  <dd>${deliveryObj.saleOrder }</dd>
	</dl>
	
	</div>
</div>
</div>