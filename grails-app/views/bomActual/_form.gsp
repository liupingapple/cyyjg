<%@page import="cyyjg.CONSTANT"%>
<%@page import="cyyjg.Utils"%>
<%@ page import="cyyjg.BomActual" %>
<%@ page import="cyyjg.Delivery" %>
<%@ page import="cyyjg.ProdInstruct" %>

<!--主要样式-->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bom_tree_style.css')}" type="text/css"/>	

<script type="text/javascript">
$(function(){
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '折叠');
    $('.tree li.parent_li > span').on('click', function (e) {
        // only click the label will trigger the event
        if ($(this).children('label').length > 0) {
        	var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                //children.hide('fast');// don't click to collapse because it works badly in saleOrderLine/list and prodInstruct/list
                $(this).attr('title', '展开').find(' > i').addClass('glyphicon-plus').removeClass('glyphicon-minus');
            } else {
                children.show('fast');
                $(this).attr('title', '折叠').find(' > i').addClass('glyphicon-minus').removeClass('glyphicon-plus');
                $(".tree li #new_x").hide();
                $(".tree li .just_for_hide").hide();
            }
            e.stopPropagation();
        }
        
    });

    $(".tree span .btn").hide();
    $(".tree li #new_x").hide();
    $(".tree li .just_for_hide").hide();
});

function mouseover(i) {
	$("#btnX"+i).show();
	$("#btnY"+i).show();
	$("#btnZ"+i).show();
}
function mouseout(i) {
	$("#btnX"+i).hide();
	$("#btnY"+i).hide();
	$("#btnZ"+i).hide();
}
function tog(new_xy) {
	$("#"+new_xy).toggle();
}
</script>

<g:set var="rootBom" value="${Utils.getRootBom(bomActualObj) }"></g:set>
<g:set var="prodInstruct" value="${bomActualObj?.prodInstruct }"></g:set>
<g:set var="delivery" value="${Delivery.findByProdInstruct(prodInstruct) }"></g:set>

<g:if test="${params.controller == 'bomActual' }">
<%--<div class="well well-sm"><label>生产单：</label>${prodInstruct?.code }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>状态：</label>${prodInstruct?.status }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>批次：</label><g:formatDate date="${prodInstruct.produceFinishedDate}" format="yyyy-MM-dd"/></div>--%>
	<div class="panel panel-default">
		<%--<div class="panel-heading">
			生产单:
			${prodInstruct?.code }
		</div> --%>
		<div class="panel-body">
			<div class="row">
				<div class="col-md-4">
						<label>生产单:</label>${prodInstruct?.code }
						&nbsp;&nbsp;&nbsp;<g:link controller="saleOrder" action="show" id="${prodInstruct?.saleOrderLine?.saleOrder?.id }">查看订单</g:link>
						<%--<label>订单单:</label><g:link controller="saleOrder" action="show" id="${prodInstruct?.saleOrderLine?.saleOrder?.id }">${prodInstruct?.saleOrderLine?.saleOrder?.code }</g:link>--%>
				</div>
				<div class="col-md-4">
						<label>产品:</label>
						${prodInstruct?.saleOrderLine?.prod }
				</div>
				<div class="col-md-4">
						<label>状态:</label>
						${prodInstruct?.status }
						<g:if test="${prodInstruct.produceFinishedDate }">
							，批次: ${rootBom.batch }
						</g:if>
				</div>
			</div>
								
		</div>
		<div class="panel-footer text-center">
		
			<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
				<div class="row">
					<div class="col-md-6">
						<a class="btn btn-default btn-sm" onclick="showSplitInput()">拆分生产单</a>
						<script type="text/javascript">
					        function showSplitInput() {
						        $("#splitForm").toggle();
							}
				        </script>
						<div id="splitForm" style="display:none; float:right" class="text-center">
							<g:form controller="bomActual" action="prodInstSplit" id="${bomActualObj?.id }">
								拆分数量：<g:field type="number" name="split_quantity" value=""/> 千克,
								<g:submitButton name="确定拆分生产单" class="btn btn-warning btn-sm" onclick="return confirm('拆分生产单将会把现有生产单生产2份不同的生产单');"/>
							</g:form>
						</div>
					</div>
					
					<div class="col-md-6">
						<g:link class="btn btn-warning btn-sm" controller="bomActual" action="prodInstConfirm" id="${bomActualObj?.id }">生产BOM确定</g:link>
					</div>
				</div>
			</g:if>
			
			<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_CONFIRMED}">
				<g:form controller="bomActual" action="prodInstApproveByManager" id="${bomActualObj?.id }">
					<g:radio name="approveByManager" value="approved" checked="true"/>通过  <g:radio name="approveByManager" value="rejected"/>拒绝
					, 备注：<g:textField name="comment" value="${prodInstruct.comment }"/>
					<g:submitButton name="郭总审核" class="btn btn-success btn-sm"/>
				</g:form>
			</g:if>
			
			<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_APPROVED_BY_MANAGER }">
				<g:form controller="bomActual" action="prodInstApproveByFinance" id="${bomActualObj?.id }">
					<g:radio name="approveByFinance" value="approved" checked="true"/>通过  <g:radio name="approveByFinance" value="rejected"/>拒绝
					, 备注：<g:textField name="comment" value="${prodInstruct.comment }"/>
					<g:submitButton name="财务审核" class="btn btn-success btn-sm"/>
				</g:form>
			</g:if>
						
			<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_COMPONENTS_GOT }">
				<%--<p class="text-center"> --%>
				<g:link controller="bomActual" action="prodInstProduced" id="${bomActualObj?.id }" class="btn btn-success btn-sm" onclick="return confirm('确定生产已经完成，系统将生产送货单，您可以在送货单菜单中选择新的送货单进行查看或编辑');" >生产完成，生成送货单</g:link>
			</g:if>
			
			<g:if test="${delivery}">
				<p><label>送货单：</label>
				<g:link controller="delivery" action="print" id="${delivery.id }">${delivery }</g:link> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
			</g:if>
		</div>
	</div>

</g:if>

<div class="tree">

<g:if test="${params.controller != 'bomActual' }">
	<%-- <g:link controller="bomActual" action="edit" id="${rootBom.id}">查看详细</g:link> --%>
	目前状态：${prodInstruct?.status }
	<g:if test="${delivery}">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;送货单：<g:link controller="delivery" action="print" id="${delivery.id }">${delivery }</g:link>		
	</g:if>
</g:if>	

<ul>
	<li>
		<span>
			<i class="glyphicon glyphicon-minus"></i><label>${rootBom? rootBom:'新...' }</label>	
		</span>		
		<span onmouseover="mouseover(${rootBom.id})" onmouseout="mouseout(${rootBom.id})">
			<g:form>
				<g:render template="fields" model="[bom:rootBom]" contextPath="../bomActual"></g:render> 
				<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT && !readOnly}">		
					<%-- <g:actionSubmit id="btnX${rootBom.id }" class="btn btn-primary btn-xs" controller="bomActual" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				 	<g:actionSubmit class="btn btn-danger btn-xs" controller="bomActual" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
					<a href="#" id="btnZ${rootBom.id }" class="btn btn-warning btn-xs" onClick="tog('new_x')">增加下级</a>
				</g:if>
			</g:form>
		</span>
		
		<ul>
		<g:each in="${rootBom?.children }" var="child" status="i">
				<li>
					<span><i class="glyphicon glyphicon-minus"></i><label>${child }</label>	
						<g:if test="${bomActualObj==child }"><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>&nbsp;</g:if>
					</span>		
					<span onmouseover="mouseover(${child.id})" onmouseout="mouseout(${child.id})">
						<g:form>					
							<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]" contextPath="../bomActual"></g:render>
							<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT && !readOnly}">
								<g:actionSubmit id="btnX${child.id }" class="btn btn-primary btn-xs" controller="bomActual" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
								<g:actionSubmit id="btnY${child.id }" class="btn btn-danger btn-xs" controller="bomActual" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								<a href="#" id="btnZ${child.id }" class="btn btn-warning btn-xs" onClick="tog('new_${child.id}')">增加下级</a>
							</g:if>	
						</g:form>
					</span>
					<ul>
						<g:each in="${child?.children }" var="grandChild" status="ii">
							<li>
								<span>
									<i class="icon-leaf"></i><label>${grandChild }</label>
									<g:if test="${bomActualObj==grandChild }"><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>&nbsp;</g:if>
								</span>
								<span onmouseover="mouseover(${grandChild.id})" onmouseout="mouseout(${grandChild.id})">
									<g:form>
										<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]" contextPath="../bomActual"></g:render>
										<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT && !readOnly}">
											<g:actionSubmit id="btnX${grandChild.id }" class="btn btn-primary btn-xs" controller="bomActual" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
											<g:actionSubmit id="btnY${grandChild.id }" class="btn btn-danger btn-xs" controller="bomActual" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</g:if>
									</g:form>								
								</span>
							</li>
						</g:each>
							
						<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT && !readOnly}">
						<li class="just_for_hide" id="new_${child.id }">
							<span>
								<i class="glyphicon glyphicon-minus"></i>新...
							</span>
							<span onmouseover="mouseover(${-1*child.id})" onmouseout="mouseout(${-1*child.id})">
								<g:form>
								<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]" contextPath="../bomActual"></g:render>
								<g:actionSubmit id="btnX${-1*child.id }" class="btn btn-warning btn-xs" controller="bomActual" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />								
								</g:form>
							</span>
						</li>
						</g:if>
					</ul>
				</li>
		</g:each>
		<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT && !readOnly}">
		<li id="new_x">
			<span>
				<i class="glyphicon glyphicon-minus"></i>新...
			</span>
			<span onmouseover="mouseover(${-1*rootBom.id})" onmouseout="mouseout(${-1*rootBom.id})">
				<g:form>
				<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]" contextPath="../bomActual"></g:render>
				<g:actionSubmit id="btnX${-1*rootBom.id }" class="btn btn-warning btn-xs" controller="bomActual" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</g:form>
			</span>
		</li>
		</g:if>
		</ul>
		
</ul>
	<g:set var="splitProdInst" value="${ProdInstruct.findByCode(prodInstruct?.code+'X')}"></g:set>
	<g:if test="${splitProdInst }">	
		<br><span class="glyphicon glyphicon-star-empty">本生产单被拆分过，新拆分出的生产单是：</span> <g:link controller="bomActual" action="edit" id="${splitProdInst.rootBomActual?.id }">${splitProdInst}</g:link> 
	</g:if>
	
	<g:set var="splitFromProdInst" value="${ProdInstruct.findByCode(prodInstruct?.code.substring(0, prodInstruct?.code.length()-1))}"></g:set>
	<g:if test="${splitFromProdInst }">	
		<br><span class="glyphicon glyphicon-star">本生产单拆分自： </span><g:link controller="bomActual" action="edit" id="${splitFromProdInst.rootBomActual?.id }">${splitFromProdInst}</g:link> 
	</g:if>
</div>
