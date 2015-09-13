package cyyjg

class BomActual extends Bom {
	
	EndUser modifiedBy
	
	String status = '草稿'
		
	static belongsTo = [prodInstruct:ProdInstruct]
	
	long refBomStdId
	
	// transients
	SaleOrderLine saleOrderLine
	static transients = ['saleOrderLine']
		
    static constraints = {
		prodInstruct()
		refBomStdId(nullable:true)
		modifiedBy (nullable:false)
		status (inList:['草稿', '确认', '审批通过']) 
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
