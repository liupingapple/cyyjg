package cyyjg

// 生产指令，领料单
class ProdInstruct {
	
	String code // 领料单号
	
	SaleOrderLine saleOrderLine

	BomActual rootBomActual
			
	ProdInstruct lastOne // 上次生产的指令单， 包含 lastBomProduce
	
	// Date lastProduceDate
	// Date lastProduceCode
	
	String status = CONSTANT.INSTRUCT_STATUS_DRAFT
	
	Date produceFinishedDate
	
	// 领料单号
	String compGetNoteCode
	
	String comment
	
	/**
	 * Grails needs to know whether associations are unidirectional or bidirectional, and in the case of the latter, 
	 * which properties are involved from both sides. Normally it can infer this information, 
	 * but when there are multiple properties with the same type its guess can sometimes be wrong. 
	 * The mappedBy property is a simple map of property name pairs, where the key is the name of an association property in the current domain class and the value is the name of an association property in the domain class on the other side of the association (which may be itself). 
	 * You can also specify a value of "none" in the map, which indicates that the association is unidirectional. However, 
	 * this won't work if you actually have a domain property called "none" in the target class! 
	 */
	static mappedBy = [lastOne:'none', rootBomActual:'none']

    static constraints = {
		code unique:true
		saleOrderLine nullable:false
		rootBomActual nullable:true
		lastOne nullable:true
		status inList:CONSTANT.INSTRUCT_STATUSes
		produceFinishedDate nullable:true
		compGetNoteCode nullable:true
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		code
	}
}
