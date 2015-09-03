package cyyjg

class Prod {
	String code  // internal used code, 
	
	/*
	Question：首先有个标准产品，这个标准产品是针对所有客户都适用的，以公司内部定义的 “产品唯一编码”为索引，这么理解对吗？
	Answer：对于目前的状况来说，不太准确。对于某类产品，我们第一个选择的是客户， 然后这个客户下，某个产品的定义。
	比如，对外销售的PT－151C，对于不同客户，内容是有差异的。 当然，这是目前的情况。我也在想如何改善或者如何实现。
	Solution：直接在Prod中增加 Customer 字段
	*/
	ProdBase prodBase
	
	// 如果该产品是原材料或者不是针对具体客户的，则客户栏为空
	Customer cust
	// 如果该产品是原材料或者不是针对具体客户的，则客户参考代码等于内部唯一代码或者为空
	String custRefCode // 客户参考编号
		
	// BomStd bomStd // don't link the associate with BomStd, we just use its id, so the reference will maintained by user
	long rootBomStdId
			
	Date dateCreated
	Date lastUpdated
	
	String comment
	
	static constraints = {
		custRefCode nullable:true
		cust nullable:true
		code unique:true
		prodBase(nullable:false, unique:['cust'])
		
		rootBomStdId nullable:true
		
		comment nullable:true, maxSize:1000
	}
	
	@Override
	String toString() {
		code+"("+prodBase.name+")"
	}
		
}
