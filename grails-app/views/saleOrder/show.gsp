
<%@page import="cyyjg.CONSTANT"%>
<%@ page import="cyyjg.SaleOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'saleOrder.label', default: 'SaleOrder')}" />
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
						
						<div class="panel panel-default">
						<div class="panel-heading text-left"><g:message code="default.show.label" args="[entityName]" />: ${saleOrderObj.code} </div>
						<table class="table text-left">
						<tr>
							<!-- column -->
    						<td class="text-right">
								<span id="cust-label" class="property-label"><g:message code="saleOrder.cust.label" default="Cust" /></span>
							</td>
							<td>	
								<span class="property-value" aria-labelledby="cust-label"><g:link controller="customer" action="show" id="${saleOrderObj?.cust?.id}">${saleOrderObj?.cust?.encodeAsHTML()}</g:link></span>								
							</td>
						
							<!-- column -->
    						<td class="text-right">
								<span id="status-label" class="property-label"><g:message code="saleOrder.status.label" default="Status" /></span>
							</td>
							<td>			
								<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${saleOrderObj}" field="status"/></span>								
							</td>
							
							<!-- column -->
    						<td class="text-right">
								<span id="orderSource-label" class="property-label"><g:message code="saleOrder.orderSource.label" default="OrderSource" /></span>
							</td>
							<td>			
								<span class="property-value" aria-labelledby="orderSource-label">${saleOrderObj?.orderSource?.encodeAsHTML()}</span>								
							</td>

							<!-- column -->
    						<td class="text-right">
								<span id="signDate-label" class="property-label"><g:message code="saleOrder.signDate.label" default="Sign Date" /></span>
							</td>
							<td>	
								<span class="property-value" aria-labelledby="signDate-label"><g:formatDate date="${saleOrderObj?.signDate}" format="yyyy-MM-dd"/></span>								
							</td>
						</tr>
						
						<tr id="moreFieldsElemId">
						  	<g:render template="moreFields" model="[saleOrderObj:saleOrderObj, readOnly:true]"></g:render>
						 </tr>
						
						<g:if test="${saleOrderObj.comment }">
						<tr>						
							<!-- column -->
    						<td class="text-right">
								<span id="comment-label" class="property-label"><g:message code="saleOrder.comment.label" default="Comment" /></span>
							</td>
							<td colspan="7">	
								<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${saleOrderObj}" field="comment"/></span>								
							</td>						
						</tr>
						</g:if>
						
						<tr>
							<td colspan="8" class="text-center">
							<g:form>
									<g:hiddenField name="id" value="${saleOrderObj?.id}" />
									<g:link class="btn btn-primary btn-sm" action="edit" id="${saleOrderObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:if test="${saleOrderObj?.status == CONSTANT.ORDER_STATUS_NEW }">		
										<%-- <g:link class="btn btn-success btn-sm" action="confirm" id="${saleOrderObj?.id}" onclick="return confirm('确定后，将会生成对应的生产单');">确认</g:link> --%>								
										<g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</g:if>
									<input class="btn btn-success btn-sm" type="button" onclick="myPrint()" value="打印"/>
							</g:form>
							</td>
						</tr>
						
						</table>
						</div>
						</div>						       
                    </div>
                
                    <g:render template="saleOrderLine"/>
                    <%--
							<!-- column -->
    						<td class="text-right">
								<span id="complaints-label" class="property-label"><g:message code="saleOrder.complaints.label" default="Complaints" /></span>
							</td>
							<td>	
								<g:each in="${saleOrderObj.complaints}" var="c">
								<span class="property-value" aria-labelledby="complaints-label"><g:link controller="complaint" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
								</g:each>								
							</td>
						 --%>      
						 
					 
                </div>
            </div>
         </div>
         
         <!-- 打印 -->
         <script type="text/javascript">
	         function myPrint(){
	             $("#order4print").jqprint();
	         }    
         </script>

		<div id="printWrapper" style="display:none">
		 	<div id="order4print" class="container" >
			 	<h4 class="text-center">东莞市彩源有机硅材料有限公司</h4>
			 	<h5 class="text-center"><strong>订单</strong></h5>
			 	<h6 class="text-center"><strong>地址：</strong>广东省东莞市黄江镇公常路星光路口富源工业区二栋</h6>
			 	<h6 class="text-center"><strong>电话：</strong>0769-83849878&nbsp;&nbsp;&nbsp;<strong>传真：</strong>0769-83849928</h6>
			 	
			 	<%--<div class="row"><div class="col-lg-1"></div>
			 		<div class="col-lg-7"><h5><strong>客户</strong>：${saleOrderObj.cust}</h5></div>   
			 		<div class="col-lg-4 text-right"><strong>编号</strong>：${saleOrderObj.code}</div>
			 	</div>--%>
			 				 	
				<table class="table table-bordered">
					<tr>
						<td class="text-right"><strong>订单编号</strong></td>   <td class="text-left">${saleOrderObj?.code }</td>
						<td class="text-right"><strong>客户</strong></td>   <td class="text-left">${saleOrderObj?.cust }</td>
						<td class="text-right"><strong>签订日期</strong></td> <td class="text-left"><g:formatDate date="${saleOrderObj?.signDate}" format="yyyy-MM-dd"/></td>
					</tr>
					<tr>
						<td class="text-right"><strong>是否含税</strong></td> <td class="text-left">${saleOrderObj?.isTax }</td>
						<td class="text-right"><strong>包装方式</strong></td> <td class="text-left">${saleOrderObj?.packageType }</td>
						<td class="text-right"><strong>付款方式</strong></td> <td class="text-left">${saleOrderObj?.paymentCondition }</td>
					</tr>
					<tr>
						<td class="text-right"><strong>付款条款</strong></td> <td class="text-left">${saleOrderObj?.paymentItems }</td>
						<td class="text-right"><strong>备注</strong></td> <td class="text-left" colspan="3">${saleOrderObj?.comment }</td>
					</tr>
				</table>
				
				<table class="table table-bordered text-center">
				  <tr>
				    <th style="width:23%">产品</th>
				    <th style="width:15%">数量(千克)</th>
				    <th style="width:10%">价格</th>
				    <th style="width:15%">金额(元)</th>
				    <th style="width:12%">交货日期</th>
				    <th>备注</th>
				  </tr>
				  
				  <g:each in="${saleOrderObj?.orderLines?}" var="orderLine" status="i"> 				  
					  <tr class="text-center">				   	
					    <td>${orderLine?.prod}</td>
					    <td>${fieldValue(bean: orderLine, field: 'quantity')}</td>
					    				         
					    <td>${orderLine?.price }</td>
					    
					    <td>${ new java.text.DecimalFormat("0.00").format(orderLine.quantity*orderLine.price) }</td>
	
					    <td><g:formatDate date="${orderLine?.deliveryDate}" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;${orderLine?.am_pm}
					    </td>
					    
					    <td>${orderLine?.comment}</td>
					  </tr>
				  </g:each>
				  
				</table>
			</div>
		</div>
</body>
</html>
