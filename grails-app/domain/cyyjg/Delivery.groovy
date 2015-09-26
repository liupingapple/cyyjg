package cyyjg

import java.math.BigDecimal;
import java.util.Date;

class Delivery {

	String code // 送货单号
	
	ProdInstruct prodInstruct
		
	String addr // 送货地址
	String contact //联系人
	String contactPhone // 联系电话
	
	String status = CONSTANT.DELIVERY_STATUS_DRAFT
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	// transients ...
	Prod prod
	SaleOrder saleOrder
	SaleOrderLine saleOrderLine
	BigDecimal quantity
	static transients = ['prod', 'saleOrder', 'saleOrderLine', 'quantity']
	
    static constraints = {
		code  unique:true
		prodInstruct()
		addr()
		contact()
		contactPhone()
		
		status inList:CONSTANT.DELIVERY_STATUSes
		comment(nullable:true, maxSize:1000)
    }
	
	Prod getProd()
	{
		prodInstruct?.saleOrderLine?.prod
	}
	
	SaleOrder getSaleOrder()
	{
		prodInstruct?.saleOrderLine?.saleOrder
	}
	
	SaleOrderLine getSaleOrderLine()
	{
		prodInstruct?.saleOrderLine
	}
	
	BigDecimal getQuantity()
	{
		prodInstruct?.saleOrderLine?.quantity
	}
	
	@Override
	String toString() {
		code
	}
}
