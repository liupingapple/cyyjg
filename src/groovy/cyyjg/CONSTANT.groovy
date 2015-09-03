package cyyjg

import java.util.ArrayList;

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
	
	final static ArrayList PROVINCEs = [
		'安徽',
		'北京',
		'重庆',
		'福建',
		'甘肃',
		'广东',
		'广西',
		'贵州',
		'海南',
		'河北',
		'黑龙江',
		'河南',
		'香港',
		'湖北',
		'湖南',
		'江苏',
		'江西',
		'吉林',
		'辽宁',
		'澳门',
		'内蒙古',
		'宁夏',
		'青海',
		'山东',
		'上海',
		'山西',
		'陕西',
		'四川',
		'天津',
		'台湾',
		'新疆',
		'西藏',
		'云南',
		'浙江'
	]
}
