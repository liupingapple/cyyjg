package cyyjg

import java.util.Date;

class BomProduce {
				
	static belongsTo = [saleOrderLine: SaleOrderLine]	
	static hasMany = [components: BomProduceComponent]
	
	String comment
	
	Date dateCreated
	Date lastUpdated
		
    static constraints = {
		saleOrderLine()
		components()
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${saleOrderLine} 的生产BOM"
	}
}
