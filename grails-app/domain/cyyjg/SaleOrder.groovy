package cyyjg

import java.util.Date;

class SaleOrder {

	String code
	Customer cust
	String status = '新建'
	
	Date signDate
	Date deliveryDate
	
	String comment
	
	EndUser crtUser
	EndUser lastUpdatedUser
	
	Date dateCreated
	Date lastUpdated
		
	static hasMany = [orderLines:SaleOrderLine, complaints:Complaint]
	
    static constraints = {
		code unique:true
		cust()
		status inList:CONSTANT.ORDER_STATUSes
		
		signDate nullable:false
		deliveryDate nullable:false
		crtUser nullable:false
		lastUpdatedUser nullable:true
		comment nullable:true, maxSize:1000
		// orderLines()
    }
	
	@Override
	String toString() {
		code+": "+cust+""
	}
}
