package cyyjg

import java.util.Date;

class Delivery {

	String code // 送货单号
	
	SaleOrder saleOrder	
	Prod prod
	
	String addr // 送货地址
	String contact //联系人
	String contactPhone // 联系电话
	
	String status = '制单'
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		code  unique:true
		saleOrder()
		prod()
		addr()
		contact()
		contactPhone()
		
		status inList:['制单', '在途', '完成']
		comment(nullable:true, maxSize:1000)
    }
	
	@Override
	String toString() {
		code+"(订单"+saleOrder+")"
	}
}
