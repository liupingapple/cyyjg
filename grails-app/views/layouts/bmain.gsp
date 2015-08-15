<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="description">
    <meta name="author" content="taliu">
    <link rel="icon" href="../../cyyjg.ico">

    <title><g:layoutTitle default="CYYJG" /></title>
    
    <!-- ........................................................ -->

	<!-- 不再使用BuildConfig.groovy 中安装的JQuery插件，因为版本太低，直接引入文件 -->
	<%--<NOUSED_r:require modules="jquery" /> 
	<NOUSED_r:layoutResources />--%>
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">	
	<!-- 可选的Bootstrap主题文件（可以有更好的视觉效果，比如渐变色） -->
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" type="text/css">
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'toggle-sidebar.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'cyyjg.css')}" type="text/css">
	
	<!-- We need to load JQuery firstly, maybe some customer JS will be defined in gsp file -->
	<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> 不用网络上的js, 已下载到本地 -->
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script> <!-- jquery.js 必须放在 bootstrap.js前面 -->
	<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'toggle-sidebar.js')}"></script>
		
	<g:layoutHead />
	<r:layoutResources/>
	</head>

	<body>
	
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		    <div class="container">  <!-- 如果用 container-fluid 则会 width=100% -->
		      <div class="navbar-header">
		        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		          <span class="sr-only">Toggle navigation</span>
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>
		          <span class="icon-bar"></span>
		        </button>
		        <a class="navbar-brand" href="#">CYYJG</a>
		      </div>
		      <div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">		          	
		        	<g:if test="${session.user }">
		        		<li><g:link controller="saleOrder" action="list">订单管理</g:link></li>
		        		<li><g:link controller="prodInstruct" action="list">生产单管理</g:link></li>
		        		<li><g:link controller="delivery" action="list">送货单管理</g:link></li>
		        		<li><g:link controller="accountReceivable" action="list">应收帐管理</g:link></li>
		        		<li><g:link controller="sample" action="list">样品管理</g:link></li>
		        		<li><g:link controller="complaint" action="list">投诉管理</g:link></li>
		        		
		        		<li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">基础信息管理<span class="caret"></span></a>
				          <ul class="dropdown-menu">
				            <li><g:link controller="prod" action="list">产品信息维护</g:link></li>
				            <li><g:link controller="bomEng" action="list">产品BOM维护</g:link></li>
				            <li><g:link controller="prodGroup" action="list">产品组别维护</g:link></li>
				            <li><g:link controller="prod" action="listBycatalog">产品类别维护</g:link></li>
				            <li><g:link controller="prodCust" action="list">产品客户维护</g:link></li>
				            <li role="separator" class="divider"></li>
				            <li><g:link controller="customer" action="list">客户信息维护</g:link></li>
				            <li><g:link controller="inventory" action="list">仓库信息维护</g:link></li>
				            <li><g:link controller="endUser" action="list">用户信息维护</g:link></li>
				          </ul>
				        </li>
		        		
						<li><g:preference/></li>
						<li><g:loginControl /></li>
					</g:if>
					<g:else>
						<li><a href="#">Help</a></li>
					</g:else>
				</ul>
		      </div>
		    </div>
		</nav>
		
		<g:layoutBody /> 
		
		<hr class="footer-divider">
	    	    
		<footer class="footer" style="height:40px">
		  <div class="container text-center">
		  	<span><a href="#menu-toggle" id="menu-toggle">展开/收缩侧边菜单栏</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		     &copy; 2013-2014 AppleHead Software Inc. All Rights Reserved.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a data-toggle="modal" data-target="#about" href="#">关于CYYJG</a>		    
		  </div>
		</footer>
	      	      
	    <!-- About Modal -->
		<div class="modal fade" id="about" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title" id="myModalLabel">
							CYYJG在线测试系统
						</h3>
					</div>
					<div class="modal-body">
						版本：<g:message code="about.version"/>
						<br>名称：<g:message code="about.prod" />
						<br>网址：<g:message code="about.website" />
						<br>版权：<g:message code="about.copyright" />
						<br>详细：<g:message code="about.desc" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		<g:javascript library="application" />
		<!-- 不再使用BuildConfig.groovy 中安装的JQuery插件，因为版本太低，直接引入文件，参考 Bootstrap中文网：http://v3.bootcss.com/getting-started/ -->
		<%--<NOUSED_r:require module="jquery" />   
		<NOUSED_r:layoutResources />--%>
		
		<!-- The js will be used after ALL page loaded, and we no need to write JS in gsp based on below .js  -->
		<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>
	<r:layoutResources/>		
	</body>
</html>

