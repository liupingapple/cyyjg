package cyyjg

class BomTagLib {
	def showBOM = { attrs ->
		def prod = attrs.prod
		def bom = prod.bomEng
		
		if (!bom) {
			out << "注意: 没有定义该产品的标准BOM！！"
		}
		else if (bom instanceof BomEng) {
			StringBuffer bomStruct = new StringBuffer()
			bomStruct.append(bom.prod)
			
			bom.components.each {  bomEngComponent->
				bomStruct.append( "<br>|-1--${bomEngComponent.prod}")
				bomEngComponent.each {  bomEngComponent2 ->
					bomStruct.append( "<br>|--2----${bomEngComponent2.prod}")
				}
			}
			
			out << bomStruct.toString()
			
		} else if (bom instanceof BomProduce) {
		
		} else {
			out << "ERROR: bom attr should be instance of BomEng or BomProduce"
		}
		
	}
}
