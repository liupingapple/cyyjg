package cyyjg

import java.util.Date;

class Customer {

	String code
	String name
	String abrrName 
	
	String country = "中国"
	String province
	String city
	String addr
	
	String contactInfo
	String financeContact
		
	String cellphone
	String phone
	
	String buyer
	String buyerPhone
	
	String salesman
	String salesmanPhone
	
	BigDecimal grossProfitRate
	
	String deliveryAddr1
	String deliveryAddr2
	String deliveryAddr3
	
	String paymentItems	
	String paymentCondition = '现金'	
	String packageType	
	String currency = '人民币' // 币种
	boolean isTax  // 是否含税
	
	Date billDate // 对账日期
	
	Date dateCreated
	Date lastUpdated
	
	String comment
	
    static constraints = {
		code (unique:true)
		name()
		abrrName nullable: true
		country nullable:true
		province nullable:true, inList:CONSTANT.PROVINCEs
		city nullable: true
		addr nullable: true
		contactInfo nullable:true
		financeContact nullable:true
		cellphone nullable:true
		phone nullable:true
		buyer nullable:false
		buyerPhone nullable:false
		salesman nullable:true
		salesmanPhone nullable:true
		grossProfitRate nullable:true
		deliveryAddr1 nullable:false
		deliveryAddr2 nullable:true
		deliveryAddr3 nullable:true
		
		paymentItems nullable:true
		paymentCondition nullable:true, inList:CONSTANT.PAYMENTs		
		packageType nullable:true		
		currency nullable:true, inList:CONSTANT.CURRENCYs
		isTax nullable:true
		
		billDate nullable:true
		
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		code+"("+name+")"
	}
}
