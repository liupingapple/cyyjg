package cyyjg

import java.util.Date;

class SaleOrderLine {
	
	Prod prod
	ProdBatch prodBatch
	BigDecimal quantity
	String unit = '克'
	
	BigDecimal price
	
	Date deliveryDate
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [saleOrder:SaleOrder]
	
    static constraints = {
		// 如何定义一个 prod 和 一个 saleOrder 唯一性？
		saleOrder(unique:['prod'])
		prod (nullable:false)
		quantity nullable:false
		unit inList:cyyjg.CONSTANT.UNITs
		price nullable:false
		prodBatch nullable:true
		
		deliveryDate nullable:true
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${saleOrder.code} - ${prod}"
	}
}
