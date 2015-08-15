package cyyjg

class CONSTANT {	
	final static PROD_TYPEs = ['原材料', '半成品', '成品', '包装品']
	final static PROD_INVENTORY_TYPEs = ['原材料', '半成品', '成品', '废品', '包装品']
	
	final static INV_PLACEs = ['A', 'B', 'C', 'D', 'E', 'F']
	
	final static PRIVILEGEs = ['管理员'
		,'订单-新建', '订单-查询', '订单-修改','订单-删除', '订单-确认','订单-取消'
		,'生产单-新建', '生产单-查询', '生产单-修改','生产单-删除', '生产单-确认','生产单-取消'
		,'送货单-新建', '送货单-查询', '送货单-修改','送货单-删除', '送货单-确认','送货单-取消', '送货单-打印']
	
	// '新建(可删除)', '确认(可修改地址等不可删除)', '已备料(生产BOM确认，已下领料单)', '生产中', '完成可送货'
	// The default value in domain SaleOrder.groovy is ORDER_STATUSes[0]='新建'
	final static ORDER_STATUSes = ['新建', '确认', '已备料', '生产中', '完成可送货']
	
	final static UNITs = ['克', '千克']
}
