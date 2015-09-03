package cyyjg

import java.util.Date;

class ProdBase {
	
	String code // 比如国际标准号 international standard code
	String name
	
	String type = "成品"
	ProdGroup group
		
	BigDecimal stdCost
	BigDecimal stdPrice
	BigDecimal agentPrice
	BigDecimal batchPrice
	
	BigDecimal minStock // 最小库存量，安全库存，Inventory中该产品小于此值
	
	String comment
	
	String unit = '克' // 标准计量单位
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {	
		code unique:true
		name unique:true
		type inList:cyyjg.CONSTANT.PROD_TYPEs
		group nullable:true
		stdCost nullable:true
		stdPrice nullable:true
		agentPrice nullable:true
		batchPrice nullable:true
		minStock nullable:true
		unit inList:cyyjg.CONSTANT.UNITs
		comment nullable:true, maxSize:1000		
    }
	
	@Override
	String toString() {
		"${code} - ${name}"
	}
}
