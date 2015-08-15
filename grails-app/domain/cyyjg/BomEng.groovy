package cyyjg

// 装配清单
class BomEng {
	
	static belongsTo = [prod: Prod]	
	static hasMany = [components: BomEngComponent]
	
	String comment
		
	Date dateCreated
	Date lastUpdated
		
    static constraints = {
		prod()
		components()
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${prod.toString()} 标准BOM"
	}
}
