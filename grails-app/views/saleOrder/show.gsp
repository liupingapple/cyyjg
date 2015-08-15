
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
						<div class="panel-heading text-left"><g:message code="default.show.label" args="[entityName]" /></div>
						<table class="table text-left">
						<tr>
							<!-- column -->
    						<td class="text-right">
								<span id="code-label" class="property-label"><g:message code="saleOrder.code.label" default="Code" /></span>
							</td>
							<td>
								<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${saleOrderObj}" field="code"/></span>								
							</td>
						
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
						</tr>
						<tr>
							<!-- column -->
    						<td class="text-right">
								<span id="signDate-label" class="property-label"><g:message code="saleOrder.signDate.label" default="Sign Date" /></span>
							</td>
							<td>	
								<span class="property-value" aria-labelledby="signDate-label"><g:formatDate date="${saleOrderObj?.signDate}" format="yyyy-MM-dd"/></span>								
							</td>
							
							<!-- column -->
    						<td class="text-right">
								<span id="deliveryDate-label" class="property-label"><g:message code="saleOrder.deliveryDate.label" default="Delivery Date" /></span>
							</td>
							<td colspan="5">	
								<span class="property-value" aria-labelledby="deliveryDate-label"><g:formatDate date="${saleOrderObj?.deliveryDate}" format="yyyy-MM-dd" /></span>								
							</td>
						</tr>
						<tr>						
							<!-- column -->
    						<td class="text-right">
								<span id="comment-label" class="property-label"><g:message code="saleOrder.comment.label" default="Comment" /></span>
							</td>
							<td colspan="7">	
								<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${saleOrderObj}" field="comment"/></span>								
							</td>						
						</tr>
						
						<tr>
							<td colspan="8" class="text-center">
							<g:form>
									<g:hiddenField name="id" value="${saleOrderObj?.id}" />
									<g:link class="btn btn-primary" action="edit" id="${saleOrderObj?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
									<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
	</body>
</html>
