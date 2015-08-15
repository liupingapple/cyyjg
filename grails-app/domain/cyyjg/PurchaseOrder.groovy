package cyyjg

import java.util.Date;

class PurchaseOrder {

	String code
	String supplier
	String supplierContact
	Date signDate
	String status = '新建'
	
	String buyer  // TODO - change to user
		
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [purchaseOrderLines: PurchaseOrderLine]
	
    static constraints = {
		code unique:true
		supplier()
		supplierContact(nullable:true)
		signDate()
		status(inList:['新建','进行中', '完成'])
		buyer(nullable:true)
		purchaseOrderLines()
		comment(nullable:true, maxSize:1000)
    }
}
