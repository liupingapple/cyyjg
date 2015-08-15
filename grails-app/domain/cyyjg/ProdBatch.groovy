package cyyjg

import java.util.Date;

class ProdBatch {

	String code
			
	Date producedDate

	Date dateCreated
	Date lastUpdated
	
	String comment
	
	static belongsTo = [prod: Prod]
	static hasMany = [saleOrderLine: SaleOrderLine]
	
    static constraints = {
		code()
		saleOrderLine()
		prod()
		producedDate()
		
		comment(nullable:true, maxSize:1000)
    }
	
	@Override
	String toString() {
		code
	}
}
