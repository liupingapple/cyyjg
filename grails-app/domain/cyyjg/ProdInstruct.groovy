package cyyjg

// 生产指令，领料单
class ProdInstruct {
	
	String code // 领料单号
	
	SaleOrderLine saleOrderLine // 一个领料单会对应多个销售单吗？？？似乎不会

	BomProduce bomProduce
			
	ProdInstruct lastOne // 上次生产的指令单， 包含 lastBomProduce
	
	Date lastProduceDate
	Date lastProduceCode
	
	String status = '领料单还未生成'
	
	String comment

    static constraints = {
		code unique:true
		saleOrderLine nullable:false
		bomProduce nullable:true
		lastOne nullable:true
		status inList:['新建', '正在实验', '正在生产', '生成完成', '关闭']
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		code + "/"+saleOrderLine
	}
}
