package cyyjg

class SaleOrderSource {

	String code
	String sourceType
	
	String comment
	
    static constraints = {
		code(unique:true)
		sourceType()
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		code+"-"+sourceType
	}
}
