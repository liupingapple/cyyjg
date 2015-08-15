package cyyjg

class BomProduceComponent {
		
	Prod prod
	int level
	int seq
	
	BomEngComponent refBomEngComponent
		
	String op = '不修改'
	
	BigDecimal actualQuantity
	BigDecimal wasteQuantity // 怎么用？
	String unit = '克'
	
	BigDecimal exceedQuantity  // actualQuantity - BOMStandardComponent.standardQuantity
	String exceedQuantityInventory // 超过数量对应库存位
	
	static transients = ['exceedQuantity']
	
	static belongsTo = [bomProduce: BomProduce]
	BomProduceComponent componentParent
	static hasMany = [componentChildren: BomProduceComponent]
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		bomProduce()
		
		prod()
		level()
		seq()
		
		refBomEngComponent nullable:true		
		op inList: ['不修改', '修改数量', '替换', '删除', '增加']
		
		actualQuantity()
		wasteQuantity()
		unit inList: ['克', '公斤']
		exceedQuantityInventory nullable:true
		componentParent()
		componentChildren()
		comment nullable:true, maxSize:1000
    }
	
	BigDecimal getExceedQuantity()
	{
		return actualQuantity - refBomEngComponent?.engQuantity
	}
	
	@Override
	String toString() {
		"${level}.${seq}:${bomProduce}/${prod}"
	}
}
