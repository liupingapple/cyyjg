package cyyjg

import java.util.Date;

class SaleOrder {

	String code
	SaleOrderSource orderSource
	
	Customer cust
	String status = CONSTANT.ORDER_STATUS_NEW  // 新建
	
	Date signDate
	Date deliveryDate
	
	String comment
	
	EndUser crtUser
	EndUser lastUpdatedUser
	
	String paymentCondition // 付款条件与方式
	String paymentItems
	String packageType
	String currency
	boolean isTax
		
	Date dateCreated
	Date lastUpdated
		
	static hasMany = [orderLines:SaleOrderLine, complaints:Complaint]
	
	static mapping = {
		orderLines sort: 'id', order: 'asc'
	}
	
    static constraints = {
		code unique:true
		orderSource: nullable:true
		cust()
		status inList:CONSTANT.ORDER_STATUSes
		
		signDate nullable:false
		deliveryDate nullable:true
		crtUser nullable:false
		lastUpdatedUser nullable:true
		comment nullable:true, maxSize:1000
		
		paymentItems nullable:true
		paymentCondition nullable:true, inList:CONSTANT.PAYMENTs		
		packageType nullable:true		
		currency nullable:true, inList:CONSTANT.CURRENCYs
		isTax nullable:true
		// orderLines()
    }
		
	@Override
	String toString() {
		code+": "+cust
	}
}
