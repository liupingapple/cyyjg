
<%@ page import="cyyjg.Prod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bmain">
		<g:set var="entityName" value="${message(code: 'prod.label', default: 'Prod')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="wrapper">

        <!-- Sidebar -->        
        <g:render template="sidebar"/>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                    
                    	<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						
						<div class="panel panel-default">
						<div class="panel-heading text-left"><g:message code="default.show.label" args="[entityName]" /></div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<dl class="dl-horizontal">
										<dt><g:message code="prod.custRefCode.label" default="Cust Ref Code" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="custRefCode"/><dd>
									</dl>
																
									<dl class="dl-horizontal">
										<dt><g:message code="prod.cust.label" default="Cust" /><dt>
										<dd><g:link controller="customer" action="show" id="${prodObj?.cust?.id}">${prodObj?.cust?.encodeAsHTML()}</g:link><dd>
									</dl>
																
									<dl class="dl-horizontal">
										<dt><g:message code="prod.code.label" default="Code" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="code"/><dd>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prod.prodBase.label" default="prodBase" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase"/><dd>
										<%--
										<dd><g:link controller="prodBase" action="show" id="${prodObj?.prodBase?.id}">${prodObj?.prodBase?.encodeAsHTML()}</g:link><dd>
										 --%>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prod.rootBomStdId.label" default="RootBom Std Id" /><dt>
										<dd>
											<g:if test="${prodObj?.rootBomStdId}">
												<g:link class="property-value" aria-labelledby="rootBomStdId-label" controller="bomStd" action="edit" id="${prodObj.rootBomStdId }">标准BOM</g:link>
											</g:if>
											<g:else>
												<g:link class="property-value" aria-labelledby="rootBomStdId-label" controller="bomStd" action="create" params="${['prod.id':prodObj.id, 'cust.id':prodObj?.cust?.id] }">创建标准BOM</g:link>
											</g:else>
										<dd>
									</dl>
															
									
									<dl class="dl-horizontal">
										<dt><g:message code="prod.comment.label" default="Comment" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="comment"/><dd>
									</dl>
								</div>
								
								<div class="col-lg-6">
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.type.label" default="Type" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.type"/><dd>
									</dl>
															
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.group.label" default="group" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.group"/><dd>
									</dl>
															
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.stdCost.label" default="stdCost" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.stdCost"/><dd>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.stdPrice.label" default="stdPrice" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.stdPrice"/><dd>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.agentPrice.label" default="agentPrice" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.agentPrice"/><dd>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.batchPrice.label" default="batchPrice" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.batchPrice"/><dd>
									</dl>
									 
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.unit.label" default="unit" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.unit"/><dd>
									</dl>
									
									<dl class="dl-horizontal">
										<dt><g:message code="prodBase.minStock.label" default="minStock" /><dt>
										<dd><g:fieldValue bean="${prodObj}" field="prodBase.minStock"/><dd>
									</dl>
								</div>
							</div>
						</div>
						<div class="panel-footer text-center">
							<g:link class="btn btn-warning btn" action="edit" id="${prodObj.id }">更新客户参考编码或备注</g:link>
							<g:if test="${prodObj?.rootBomStdId}">
								<g:link class="btn btn-success btn" controller="bomStd" action="edit" id="${prodObj.rootBomStdId }">标准BOM</g:link>
							</g:if>
							<g:else>
								<g:link class="btn btn-success btn" controller="bomStd" action="create" params="${['prod.id':prodObj.id, 'cust.id':prodObj?.cust?.id] }">创建标准BOM</g:link>
							</g:else>
							<g:link class="btn btn-danger btn" controller="prodBase" action="edit" id="${prodObj.prodBase.id }" onclick="return confirm('修改产品定义可能会影响所有用到该产品的客户和订单');">更新产品定义</g:link>
						</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
