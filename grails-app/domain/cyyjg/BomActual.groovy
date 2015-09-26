package cyyjg

class BomActual extends Bom {
		
	// String status = '新建'
		
	static belongsTo = [prodInstruct:ProdInstruct]
	
	long refBomStdId	
	String batch // 批次, 领料员将会在最终确认生产单之后填写上半成品或者原材料的批次
	EndUser modifiedBy
	
	// transients
	SaleOrderLine saleOrderLine
	static transients = ['saleOrderLine']
		
    static constraints = {
		prodInstruct()
		refBomStdId(nullable:true)
		modifiedBy (nullable:false)
		batch (nullable:true)
		// status (inList:['草稿', '确认', '审批通过']) 
    }
	
	SaleOrderLine getSaleOrderLine()
	{
		prodInstruct.saleOrderLine
	}
	
	def afterInsert = {
		if (Utils.isRootBom(this)) {
			ProdInstruct prodInstruct = ProdInstruct.get(this.prodInstruct.id)
			prodInstruct.rootBomActual = this
			// prod.save()
		}
	}
}
