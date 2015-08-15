package cyyjg

import java.util.Date;

class Sample {

	String code
	Prod prod
	BigDecimal quantity
	ProdBatch prodBatch
	Customer cust
	String status = '登记'
	
	String feedback // 客户反馈
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		code  unique:true
		prod()
		prodBatch()
		quantity()
		cust()
		status inList:['登记', '在途', '跟踪']
		feedback(nullable:true)
		comment nullable:true, maxSize:1000
    }
}
