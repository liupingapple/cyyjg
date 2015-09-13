<%@page import="cyyjg.CONSTANT"%>
<%@page import="cyyjg.Utils"%>
<%@ page import="cyyjg.BomActual" %>

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
                children.hide('fast');
                $(this).attr('title', '展开').find(' > i').addClass('glyphicon glyphicon-plus').removeClass('glyphicon glyphicon-minus');
            } else {
                children.show('fast');
                $(this).attr('title', '折叠').find(' > i').addClass('glyphicon glyphicon-minus').removeClass('glyphicon glyphicon-plus');
            }
            e.stopPropagation();
        }
        
    });

    
});
</script>

<g:set var="rootBom" value="${Utils.getRootBom(bomActualObj) }"></g:set>
<g:set var="prodInstruct" value="${bomActualObj?.prodInstruct }"></g:set>

<div class="panel panel-default">
	<div class="panel-heading">
		生产单:
		${prodInstruct?.code }
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
				<dl class="dl-horizontal">
					<dt>订单</dt>
					<dd><g:link controller="saleOrder" action="show" id="${prodInstruct?.saleOrderLine?.saleOrder?.id }">${prodInstruct?.saleOrderLine?.saleOrder?.code }</g:link></dd>
				</dl>
			</div>
			<div class="col-md-4">
				<dl class="dl-horizontal">
					<dt>产品</dt>
					<dd>${prodInstruct?.saleOrderLine?.prod }</dd>
				</dl>
			</div>
			<div class="col-md-3">
				<dl class="dl-horizontal">
					<dt>状态</dt>
					<dd>${prodInstruct?.status }</dd>
				</dl>
			</div>
		</div>
		
		<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
			<p class="text-center">
			<g:link action="prodInstConfirm" id="${bomActualObj?.id }" class="btn btn-success btn-sm">确定生产单</g:link>
		</g:if>
		<g:elseif test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_CONFIRMED }">
			<p class="text-center">
			<g:link action="prodInstProduced" id="${bomActualObj?.id }" class="btn btn-success btn-sm">生产完成，生成送货单</g:link>
		</g:elseif>
	</div>
</div>

<div class="tree">
<ul>
	<li>
		<span>
			<i class="glyphicon glyphicon-minus"></i><label>${rootBom? rootBom:'新...' }</label>	
		</span>
		<span>	
			<g:form>
				<g:render template="fields" model="[bom:rootBom]"></g:render> 
				<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">		
				<g:actionSubmit class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<g:actionSubmit class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:if>
			</g:form>
		</span>
		
		<ul>
		<g:each in="${rootBom?.children }" var="child" status="i">
				<li>
					<span><i class="glyphicon glyphicon-minus"></i><label>${child }</label>	
						<g:if test="${bomActualObj==child }"><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>&nbsp;</g:if>
					</span>		
					<span>
						<g:form>					
							<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]"></g:render>
							<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
							<g:actionSubmit class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
								<span>
									<g:form>
										<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]"></g:render>
										<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
										<g:actionSubmit class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
										<g:actionSubmit class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
										</g:if>
									</g:form>								
								</span>
							</li>
						</g:each>
							
						<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
						<li>
							<span>
								<i class="glyphicon glyphicon-minus"></i>新...
							</span>
							<span>
								<g:form>
								<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]"></g:render>
								<g:actionSubmit class="btn btn-warning btn-xs" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
								</g:form>
							</span>
						</li>
						</g:if>
					</ul>
				</li>
		</g:each>
		<g:if test="${prodInstruct?.status == CONSTANT.INSTRUCT_STATUS_DRAFT }">
		<li>
			<span>
				<i class="glyphicon glyphicon-minus"></i>新...
			</span>
			<span>
				<g:form>
				<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]"></g:render>
				<g:actionSubmit class="btn btn-warning btn-xs" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</g:form>
			</span>
		</li>
		</g:if>
		</ul>
		
</ul>
</div>
