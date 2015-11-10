<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.11.3.min.js')}"></script> <!-- jquery.js 必须放在 bootstrap.js前面 -->
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.jqprint-0.3.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-migrate-1.1.0.js')}"></script> 
<p>
<div id="printArea" class="container">
<div class="panel panel-warning">

	<div class="panel-heading">
		领料单号: ${noteCode }<g:if test="${relatedProdInstList != null }">, &nbsp;&nbsp;&nbsp;包括：${relatedProdInstList.size() }个生产单</g:if>
	</div>
	<div class="panel-body">
		<table class="table table-striped table-condensed">
			<thead><tr style="font-weight:bold "><td>名称(单位)</td><td>数量</td><td>备注</td></tr></thead>
			<g:each in="${compGetNoteList }" var="m">
				<tr>
					<td>
						${m.prodBase }(${m.unit })
					</td>
					<td>
						${m.quantity }
					</td>
					<td>
						${m.comment }
					</td>
				</tr>
			</g:each>
			
		</table>
	</div>

<%--<div class="panel-heading">
		领料单生成时间: <g:formatDate date="${new Date() }" format="yyyy-MM-dd HH:mm:ss z"/>, 包括生产单：${relatedProdInstList }
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<g:each in="${componentMap }" var="m">
				<tr>
					<td>
						${m.key }
					</td>
					<td>
						${m.value }
					</td>
					<td>
						${componentMapComment[m.key] }
					</td>
				</tr>
			</g:each>
		</table>
	</div>--%>
	
</div>
</div>

<!-- 打印 -->
<script type="text/javascript">
 function myPrint(){
     $("#printArea").jqprint();
 }    
</script>

<div class="container">
	<input class="btn btn-success btn-sm" type="button" onclick="myPrint()" value="打印"/>
	<g:link class="btn btn-success btn-sm" action="list">返回</g:link>
</div>