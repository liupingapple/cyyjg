package cyyjg

class CompGetNote {

	String noteCode
	ProdBase prodBase
	BigDecimal quantity
	String unit
	
	static hasMany = [prodInstructs : ProdInstruct]
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		noteCode(unique: ['prodBase'])
		prodBase()
		quantity()
		unit()
		comment (nullable:true)
    }
}
