package cyyjg

import java.math.BigDecimal;
import java.util.Date;

class ProdInventory {
	String place = 'X1'// 库位
	
	Prod prod
	ProdBatch batch
	String prodInvType
	BigDecimal quantity
	String unit = '克'
	
	String fromPlace
	String toPlace
	String status
	
	String opCode // 入库单，出库单，。。。
	String op = '入库' // 记录来源
	
	Date entryDate // 入库日期
	int deadLine //保存期
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	int duration
	boolean expire
	static transients = ['duration', 'expire']
	
    static constraints = {
		place nullable:false, inList:CONSTANT.INV_PLACEs
		prod nullable:false
		batch nullable:true
		prodInvType inList:CONSTANT.PROD_INVENTORY_TYPEs
		quantity()
		unit inList:cyyjg.CONSTANT.UNITs
		
		opCode nullable:true
		op nullable:true, inList:['入库', '移库']
		
		entryDate nullable:false
		deadLine nullable:true
		
		comment nullable:true, maxSize:1000
    }
	
	int getDuration()
	{
		new Date() - entryDate
	}
	
	boolean isExpire() {
		deadLine < getDuration()
	}
	
	@Override
	String toString() {
		place + "/"+prod
	}
}
