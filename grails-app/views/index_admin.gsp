<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<p>以下我的理解如果有误，请告知我！
			<h1>关于工程BOM</h1>
			<ul>
			   <li>每个需要加工的 产品/物料 都对应一个工程BOM，预定义所需哪些成分以及数量</li>
			</ul>
			<h1>关于生产BOM</h1>
			<ul>
				<li>每个订单产品都产生一个生产指令/领料单 ，每个生产指令都对应一个生产BOM，该生产BOM最初来源于工程BOM，用户在制作生产指令时候可以修改BOM</li>
			</ul>
			<h1>关于订单</h1>
			<ul>
				<li>订单分为订单头和订单明细，一个订单明细是一个产品，订单确认后，每个订单产品会生成一个生产指令/领料单 ，每个生产指令都对应一个生产BOM</li>
			</ul>
			<h1>关于产品批次</h1>
			<ul>
				<li>生产指令单完成，产品已生成，产品批次生成并更新到订单明细中</li>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to 东莞市彩源有机硅材料有限公司</h1>
			<p>请注意：这仅仅是后台数据库表结构，不是真正的业务操作界面。表与表之间有关联的，会用下拉列表的方式表现出来，表示这个字段是关联了另外一张表，所关联的表的信息通过这个字段可以间接得到.</p>

			<div id="controller-list" role="navigation">
				<h2>请查看下面后台数据库表结构:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<%-- <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li> --%>
						
						<%
							def cname = null
							if (c.name?.equals("Prod")) {
								cname = "产品/物料";
							} 
		                    else if (c.name?.equals("ProdGroup")) {
								cname = "产品组别";
		                    }
		                    else if (c.name?.equals("ProdBatch")) {
								cname = "产品批次";		
		                    }
		                    else if (c.name?.equals("ProdInstruct")) {
								cname = "产品生成指令/领料单 ";
		                    }
		                    else if (c.name?.equals("BomEng")) {
								cname = "工程BOM";
		                    }
		                    else if (c.name?.equals("BomEngComponent")) {
								cname = "工程BOM组件清单";
		                    }
		                    else if (c.name?.equals("BomProduce")) {
								cname = "生产BOM";
		                    }
		                    else if (c.name?.equals("BomProduceComponent")) {
								cname = "生产BOM组件清单";
		                    }
		                    else if (c.name?.equals("Customer")) {
								cname = "客户";
		                    }
		                    else if (c.name?.equals("Complaint")) {
								cname = "投诉单";
		                    }
		                    else if (c.name?.equals("Delivery")) {
								cname = "送货单 ";
		                    }
		                    else if (c.name?.equals("Inventory")) {
								cname = "库存记录";
		                    }
		                    else if (c.name?.equals("PurchaseOrder")) {
								cname = "采购订单 ";
		                    }
							else if (c.name?.equals("PurchaseOrderLine")) {
								cname = "采购订单明细 ";
		                    }
		                    else if (c.name?.equals("SaleOrder")) {
								cname = "销售订单";
		                    }
		                    else if (c.name?.equals("SaleOrderLine")) {
								cname = "销售订单内容";
		                    }
		                    else if (c.name?.equals("Sample")) {
								cname = "样品";
		                    } else {
								if (!c.name?.equals("Dbdoc"))
									cname = c.name
							}
						 %>
						
						<li class="controller"><g:link controller="${c.logicalPropertyName}" action="create">${cname}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
