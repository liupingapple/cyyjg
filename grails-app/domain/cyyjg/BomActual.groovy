package cyyjg

class BomActual extends Bom {
	
	EndUser modifiedBy
	
	String status = '草稿'
		
	static belongsTo = [prodInstruct:ProdInstruct]
	
	BomStd refBomStd
	SaleOrderLine saleOrderLine
	static transients = ['refBomStd', 'saleOrderLine']
		
    static constraints = {
		prodInstruct()
		modifiedBy (nullable:false)
		status (inList:['草稿', '确认', '审批通过']) 
    }
	
	SaleOrderLine getSaleOrderLine()
	{
		prodInstruct.saleOrderLine
	}
	
	BomStd getRefBomStd()
	{
		BomStd.get(saleOrderLine.prod.rootBomStdId)
	}
}
