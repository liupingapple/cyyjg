package cyyjg

import java.util.Date;

class SaleOrderLine {
	
	Prod prod
	ProdBatch prodBatch
	BigDecimal quantity
	String unit = '克'
	
	BigDecimal price
	String priceFlag = "C"
	
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
		priceFlag nullable:true, inList:["A","B", "C"] //A-上次订单价格, B-产品标准价格, C-自定义
		prodBatch nullable:true
		
		deliveryDate nullable:true
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${saleOrder.code} - ${prod}"
	}
}
