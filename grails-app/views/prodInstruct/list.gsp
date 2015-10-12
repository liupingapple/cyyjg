<%@page import="cyyjg.CompGetNote"%>
<%@page import="cyyjg.CONSTANT"%>
<%@ page import="cyyjg.ProdInstruct"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bmain">
<g:set var="entityName" value="${message(code: 'prodInstruct.label', default: 'ProdInstruct')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="wrapper">
		<!-- Sidebar -->
		<g:render template="sidebar" />
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">

						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:form controller="prodInstruct">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>操作</th>
									<g:sortableColumn property="code"
										title="${message(code: 'prodInstruct.code.label', default: 'Code')}" />
										
									<th><g:message code="prodInstruct.rootBomActual.label" default="Root Bom Actual" /></th>										

									<g:sortableColumn property="status"
										title="${message(code: 'prodInstruct.status.label', default: 'Status')}" />
										
									<th>交货日期</th>

									<th><g:message code="prodInstruct.lastOne.label" default="Last One" /></th>

									<th>${message(code: 'prodInstruct.comment.label', default: 'Comment')}</th>

								</tr>
							</thead>
							<tbody>
								<g:each in="${prodInstructObjList}" status="i" var="prodInstructObj">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td>
											<g:if test="${prodInstructObj?.status == CONSTANT.INSTRUCT_STATUS_APPROVED_BY_FINANCE }">
												<g:checkBox name="rootBomActual_selected" value="${prodInstructObj?.rootBomActual?.id }" checked="false"/>&nbsp;领料
											</g:if>
											<g:if test="${prodInstructObj?.status == CONSTANT.INSTRUCT_STATUS_CONFIRMED }">
												<g:checkBox name="prodInstMselected" value="${prodInstructObj?.id }" checked="false"/>&nbsp;M审核
											</g:if>
											<g:if test="${prodInstructObj?.status == CONSTANT.INSTRUCT_STATUS_APPROVED_BY_MANAGER }">
												<g:checkBox name="prodInstFselected" value="${prodInstructObj?.id }" checked="false"/>&nbsp;F审核
											</g:if>							
										</td>
										<td>											
											<g:link controller="bomActual" action="edit" id="${prodInstructObj?.rootBomActual?.id }">
												${fieldValue(bean: prodInstructObj, field: "code")}
											</g:link>
										</td>
										
										<td>
											<a onclick="showBom(${prodInstructObj?.rootBomActual?.id })">
												${fieldValue(bean: prodInstructObj, field: "rootBomActual")}
											</a>											
										</td>

										<td>
											${fieldValue(bean: prodInstructObj, field: "status")}
											<g:if test="${prodInstructObj?.rootBomActual?.batch}">批次：${prodInstructObj?.rootBomActual?.batch}</g:if>
											<g:if test="${prodInstructObj?.status == CONSTANT.INSTRUCT_STATUS_COMPONENTS_GOT}">
												领料单：<g:link action="showCompGetNote" params="[noteCode : prodInstructObj?.compGetNoteCode]">${prodInstructObj?.compGetNoteCode}</g:link>												
											</g:if>
										</td>
										
										<td>
											<g:formatDate date="${prodInstructObj?.saleOrderLine?.deliveryDate}" format="yyyy-MM-dd"/>
											${prodInstructObj.saleOrderLine.am_pm }						
										</td>

										<td>
											<g:link controller="bomActual" action="edit" id="${prodInstructObj?.lastOne?.rootBomActual?.id }">${fieldValue(bean: prodInstructObj, field: "lastOne")}</g:link>
										</td>

										<td>
											${fieldValue(bean: prodInstructObj, field: "comment")}
										</td>

									</tr>
									<g:if test="${prodInstructObj?.rootBomActual }">
										<tr id="bom${prodInstructObj?.rootBomActual?.id }" style="display: none">
											<%-- because of nested forms existing, we pass readOnly to below form and disabled the params in nested form --%>
											<td colspan="7">
												<g:render template="form" contextPath="../bomActual" model="[bomActualObj:prodInstructObj?.rootBomActual, readOnly:true]"></g:render>
											</td>
										</tr>
									</g:if>
								</g:each>
								<tr class="text-center">
									<td colspan="7">
										<g:actionSubmit class="btn btn-info btn-sm" action="getComponents" value="领料单"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<g:radio name="approveByManagerRadio" value="approved"/>通过  <g:radio name="approveByManagerRadio" value="rejected"/>拒绝
										<g:actionSubmit class="btn btn-success btn-sm" action="approveByManager" value="郭总审核"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<g:radio name="approveByFinanceRadio" value="approved"/>通过  <g:radio name="approveByFinanceRadio" value="rejected"/>拒绝
										<g:actionSubmit class="btn btn-success btn-sm" action="approveByFinance" value="财务审核"/>
									</td>
								</tr>								
							</tbody>
						</table>
						</g:form>

						<div class="pagination">
							<g:paginate total="${prodInstructObjTotal}" />
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	<script type="text/javascript">
		function showBom(rootBomId)
		{
			$("#bom"+rootBomId).toggle();
		}
	</script>
	
</body>
</html>
