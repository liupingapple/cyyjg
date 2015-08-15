
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

	<div class="panel panel-default"><div class="panel-body">
		<g:link class="btn btn-info btn-sm" controller="saleOrderLine" action="create" params="['saleOrder.id': saleOrderObj?.id]">${message(code: 'default.add.label', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine')])}</g:link>
	</div></div>
	
	<g:each in="${saleOrderObj?.orderLines?}" var="o">

		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="heading${o.id }">
				<h4 class="panel-title">
					<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${o.id }"
						aria-expanded="true" aria-controls="collapse${o.id }"> ${o.id } - ${o.prod }
					</a>
				</h4>
			</div>
			<div id="collapse${o.id }" class="panel-collapse collapse in" role="tabpanel"
				aria-labelledby="heading${o.id }">
				<div class="panel-body">
					<g:link controller="saleOrderLine" action="show" id="${o.id}">
							${o?.encodeAsHTML()}
					</g:link>
					数量：${o.quantity }
					<g:showBOM prod="${o.prod }"/>
					<g:link controller="prod" action="edit" id="${o.prod.id}" >编辑产品以及BOM</g:link>
				</div>
			</div>
		</div>

	</g:each>

</div>