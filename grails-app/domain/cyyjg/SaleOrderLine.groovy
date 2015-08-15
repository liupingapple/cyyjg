package cyyjg

import java.util.Date;

class SaleOrderLine {
	
	String seq
	Prod prod
	ProdBatch prodBatch
	BigDecimal quantity
	String unit = '克'
	
	Date deliveryDate
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [saleOrder:SaleOrder]
	
    static constraints = {
		saleOrder()
		seq nullable:false
		prod nullable:false
		quantity nullable:false
		unit inList:cyyjg.CONSTANT.UNITs
		prodBatch nullable:true
		
		deliveryDate nullable:true
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		seq+": "+prod+""
	}
}
