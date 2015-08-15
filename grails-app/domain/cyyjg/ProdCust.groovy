package cyyjg

class ProdCust {

	String custRefCode
	Prod prod
	Customer cust
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		custRefCode unique:true
		cust nullable:false
		prod nullable:false
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		custRefCode + " "+prod+" "+cust
	}
}
