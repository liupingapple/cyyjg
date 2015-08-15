package cyyjg

import java.math.BigDecimal;

class PurchaseOrderLine {
	int seq
	Prod rawMaterial
	BigDecimal quantity
	String unit
	BigDecimal price
	
	String comment
	
	static belongsTo = [purchaseOrder:PurchaseOrder]
	
    static constraints = {
		purchaseOrder()
		seq()
		rawMaterial()
		quantity()
		unit()
		price()
		comment(nullable:true, maxSize:1000)
    }
}
