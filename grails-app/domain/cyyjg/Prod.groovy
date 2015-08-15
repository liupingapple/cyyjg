package cyyjg

class Prod {
	
	// Prod attr
	String code  // internal used code, 
	String iterStdCode // international standard code
	String name
	
	String type = "成品"
	ProdGroup group
	
	BigDecimal stdCost
	BigDecimal stdPrice
	BigDecimal agentPrice
	BigDecimal batchPrice
	
	BigDecimal minStock // 最小库存量，安全库存，Inventory中该产品小于此值
		
	BomEng bomEng // standard require items
	
	String comment
	
	String unit = '克' // 标准计量单位
		
	Date dateCreated
	Date lastUpdated
	
	static constraints = {
		code unique:true
		iterStdCode(nullable:true) 
		name()
		type inList:cyyjg.CONSTANT.PROD_TYPEs
		group nullable:true
		stdCost nullable:true
		stdPrice nullable:true
		agentPrice nullable:true
		batchPrice nullable:true
		
		unit inList:cyyjg.CONSTANT.UNITs
		
		minStock nullable:true
		
		bomEng nullable:true
		
		comment nullable:true, maxSize:1000
	}
	
	@Override
	String toString() {
		code+"("+name+")"
	}
	
	// ...
	def beforeInsert = {
	// your code goes here
	}
	def beforeUpdate = {
	// your code goes here
	}
	def beforeDelete = {
	// your code goes here
	}
	def onLoad = {
	// your code goes here
	}

//		static hasMany = [childItems: Item, parentItems: Item]
//		static mapping = { childItems joinTable: [name:'child_item', key:'item_Id', column:'child_Id']
//			parentItems joinTable: [name:'parent_item', key:'item_Id', column:'parent_Id']
//			sort "id"
//		   }
	
}
