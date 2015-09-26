
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
											<g:checkBox name="selected${prodInstructObj.rootBomActual.id }" checked="false"/>领料
											<g:link class="btn btn-primary btn-xs" controller="bomActual" action="edit" id="${prodInstructObj.rootBomActual.id }">
												编辑
											</g:link>
										</td>
										<td>
											${fieldValue(bean: prodInstructObj, field: "code")}
										</td>
										
										<td>
											<a onclick="showBom(${prodInstructObj.rootBomActual.id })">
												${fieldValue(bean: prodInstructObj, field: "rootBomActual")}
											</a>											
										</td>

										<td>
											${fieldValue(bean: prodInstructObj, field: "status")}
										</td>
										
										<td>
											<g:formatDate date="${prodInstructObj.saleOrderLine.deliveryDate}" format="yyyy-MM-dd"/>
											${prodInstructObj.saleOrderLine.am_pm }						
										</td>

										<td>
											${fieldValue(bean: prodInstructObj, field: "lastOne")}
										</td>

										<td>
											${fieldValue(bean: prodInstructObj, field: "comment")}
										</td>

									</tr>
									
									<tr id="bom${prodInstructObj.rootBomActual.id }" style="display: none">
										<td colspan="7">
											<g:render template="form" contextPath="../bomActual" model="[bomActualObj:prodInstructObj.rootBomActual]"></g:render>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>

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
