package cyyjg

import java.util.Date;

class Complaint {
	
	String code	
	Customer customer
	SaleOrder saleOrder
	Prod prod
	String type
	String status
	
	String content	
	String solution	
	String comment
	
	Date dateCreated
	Date lastUpdated

    static constraints = {
		code unique:true
		customer nullable:false
		saleOrder nullable:true
		prod nullable:true
		type nullable:true
		status nullable:true
		content nullable:false, maxSize:1000
		solution nullable:true
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${code}: ${customer}/${saleOrder}"
	}
}
