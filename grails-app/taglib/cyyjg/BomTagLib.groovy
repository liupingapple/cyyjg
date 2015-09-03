package cyyjg

class BomTagLib {
	def showBOM = { attrs ->
		def bom = attrs.bom
		def prod = attrs.prod
		
		if (!bom) {
			out << "注意: 没有定义该产品的标准BOM！！&nbsp;"
			out <<"<a class='btn btn-primary btn-xs' href='${createLink(uri: '/')}bomStd/create?prod.id=${prod.id}'>定义</a>"
		}
		else if (bom instanceof Bom) {
			
			def quan0 = bom.quantity+bom.unit
						
			out << "<p><table class='text-right'>"
			out << "<tr><td>&nbsp;${bom}，${quan0}</td> <td>&nbsp;</td> <td>&nbsp;</td></tr>"
			bom.children.each {  c->
				def quan1 = c.quantity+bom.unit
				out << "<tr><td>&nbsp;</td> <td>&nbsp;${c}，${quan1}</td> <td>&nbsp;</td></tr>"
				c.children.each {  c2 ->	
					def quan2 = c2.quantity+bom.unit
					out << "<tr><td>&nbsp;</td> <td>&nbsp;</td> <td>&nbsp;${c2}，${quan2}</td></tr>"
				}
			}
			out << "</table>"
						
		} else {
			out << "ERROR: bom attr should be instance of BomEng or BomProduce"
		}
		
	}
}
