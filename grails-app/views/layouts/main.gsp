<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script> <!-- jquery.js 必须放在 bootstrap.js前面 -->
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jqprint-0.3.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-migrate-1.1.0.js')}"></script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
					
		<div id="grailsLogo" role="banner">
			<g:if test="${session.fromController}">
				<g:link controller="${session.fromController}" action="${session.fromAction}" id="${session.fromId }">返回</g:link>
			</g:if>
			<g:else>
				<g:link controller="saleOrder">东莞市彩源有机硅材料有限公司</g:link>
			</g:else>
				<a href="#">|</a>
				<g:link controller="prodBase" action="list">产品定义</g:link>
	            <g:link controller="customer" action="list">客户信息定义</g:link>
	            <g:link controller="prod" action="list">客户产品定义</g:link>
	            <g:link controller="prodGroup" action="list">产品组别定义</g:link>
	            <%--<g:link controller="prodInventory" action="list">仓库信息维护</g:link> --%>
	            <g:link controller="endUser" action="list">用户信息维护</g:link>
		</div>
				
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
