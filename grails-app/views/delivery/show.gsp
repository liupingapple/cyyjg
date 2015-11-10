
<%@ page import="cyyjg.Delivery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'delivery.label', default: 'Delivery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		
        <div id="wrapper">

        <!-- Sidebar -->        
        <g:render template="sidebar"/>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid text-center">
                <div class="row">
                    <div class="col-lg-12">
                    
                    	<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
						</g:if>
						
						<div id="delivery4print">
						 	<h4 class="text-center">东莞市彩源有机硅材料有限公司</h4>
						 	<h5 class="text-center"><strong>送货单</strong></h5>
						 	<h6 class="text-center"><strong>地址：</strong>广东省东莞市黄江镇公常路星光路口富源工业区二栋</h6>
						 	<h6 class="text-center"><strong>电话：</strong>0769-83849878&nbsp;&nbsp;&nbsp;<strong>传真：</strong>0769-83849928</h6>
						 	<div class="row">
						 		<div class="col-sm-1"></div>
						 		<div class="col-sm-6 text-center"><h5><strong>客户</strong>：${deliveryObj.saleOrder.cust}</h5></div>   
						 		<div class="col-sm-5 text-center"><strong>送货单编号</strong>：${deliveryObj.code}</div>
						 	</div>				 	
							<table class="table table-bordered">
								<tr>
									<td class="text-right"><strong>订单编号</strong></td>   <td class="text-left">${deliveryObj.saleOrder?.code }</td>
									<td class="text-right"><strong>付款方式</strong></td>   <td class="text-left">${deliveryObj.saleOrder?.paymentCondition }</td>
									<td class="text-right"><strong>签订日期</strong></td> <td class="text-left"><g:formatDate date="${deliveryObj.saleOrder?.signDate}" format="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<td class="text-right"><strong>联系人</strong></td> <td class="text-left">${deliveryObj?.contact }：${deliveryObj?.contactPhone }</td>
									<td class="text-right"><strong>送货地址</strong></td> <td class="text-left" colspan="3">${deliveryObj?.addr }</td>
								</tr>
							</table>
							
							<table class="table table-bordered text-center">
							  <tr>
							    <th style="width:23%">产品</th>
							    <th style="width:15%">数量(千克)</th>
							    <th style="width:12%">交货日期</th>
							    <th>备注</th>
							  </tr>
							  			  
							  <tr class="text-center">				   	
							    <td>${deliveryObj?.prod}</td>
							    <td>${deliveryObj?.saleOrderLine?.quantity}</td>
							    				         			    
							    <td><g:formatDate date="${deliveryObj?.saleOrderLine?.deliveryDate}" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;${orderLine?.am_pm}
							    </td>
							    
							    <td>${deliveryObj?.comment}</td>
							  </tr>
							  
							</table>
						</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>

		
		<div class="container text-center">
			<input class="btn btn-success btn-sm" type="button" onclick="myPrint()" value="打印"/>
		</div>
		
		<!-- 打印 -->
        <script type="text/javascript">
         function myPrint(){
             $("#delivery4print").jqprint();
         }    
        </script>
	</body>
</html>
