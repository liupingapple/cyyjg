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
	
	// '新建(可删除)', '确认(可下生产单，可修改地址等不可删除)', '已备料(生产BOM确认，已下领料单)', '生产中', '完成可送货'
	// The default value in domain SaleOrder.groovy is ORDER_STATUSes[0]='新建'
	final static String ORDER_STATUS_NEW = '新建'
	final static String ORDER_STATUS_PROCEEDING = '订单/生产单处理中' 
	final static String ORDER_STATUS_HOLD = '订单暂停'	
	final static String ORDER_STATUS_FINISHED = '已完成'	
	final static String ORDER_STATUS_CLOSED = '已关闭'
	final static String ORDER_STATUS_CANCELED = '已取消'
	final static ORDER_STATUSes = [ORDER_STATUS_NEW, ORDER_STATUS_PROCEEDING, ORDER_STATUS_HOLD, ORDER_STATUS_FINISHED, ORDER_STATUS_CLOSED, ORDER_STATUS_CANCELED]
	
	final static String INSTRUCT_STATUS_DRAFT = '草稿'
	final static String INSTRUCT_STATUS_CONFIRMED = '已确定'
	final static String INSTRUCT_STATUS_APPROVED_BY_MANAGER = '经理审核通过'	
	final static String INSTRUCT_STATUS_REJECTED_BY_MANAGER = '经理审核不通过'	
	final static String INSTRUCT_STATUS_APPROVED_BY_FINANCE = '财务审核通过'
	final static String INSTRUCT_STATUS_REJECTED_BY_FINANCE = '财务审核不通过'
	final static String INSTRUCT_STATUS_COMPONENTS_GOT = '领料-生产'
	final static String INSTRUCT_STATUS_PRODUCED = '已生产'
	final static String INSTRUCT_STATUS_DELIVERED = '已发货'
	final static String INSTRUCT_STATUS_DONE = '已完成'
	final static INSTRUCT_STATUSes = [INSTRUCT_STATUS_DRAFT, INSTRUCT_STATUS_CONFIRMED, 
		INSTRUCT_STATUS_APPROVED_BY_MANAGER,INSTRUCT_STATUS_REJECTED_BY_MANAGER,
		INSTRUCT_STATUS_APPROVED_BY_FINANCE, INSTRUCT_STATUS_REJECTED_BY_FINANCE,
		INSTRUCT_STATUS_COMPONENTS_GOT,
		INSTRUCT_STATUS_PRODUCED, INSTRUCT_STATUS_DELIVERED, INSTRUCT_STATUS_DONE]
	
	final static String DELIVERY_STATUS_DRAFT = '制单'
	final static String DELIVERY_STATUS_INWAY = '在途'
	final static String DELIVERY_STATUS_RECEIVED = '已签收'
	final static String DELIVERY_STATUS_RETURN = '退货'
	final static DELIVERY_STATUSes = [DELIVERY_STATUS_DRAFT, DELIVERY_STATUS_INWAY, DELIVERY_STATUS_RECEIVED, DELIVERY_STATUS_RETURN]
	
	final static UNITs = ['克', '千克']
	
	final static AM_PM_LIST = ["", "下午", "上午"]
	
	final static String PROD_IMAGE_DIR = "prod_images";
	
	final static PAYMENTs = ['现金', '月结30天','月结60天','月结90天','其他']
	final static CURRENCYs = ['人民币', '美元', '日元', '欧元','港币','其他-具体请见备注']
	
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
