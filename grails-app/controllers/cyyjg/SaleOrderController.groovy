package cyyjg


import org.springframework.dao.DataIntegrityViolationException

class SaleOrderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [saleOrderObjList: SaleOrder.list(params), saleOrderObjTotal: SaleOrder.count()]
    }

    def create() {
		params.code = "正在创建中..."
        [saleOrderObj: new SaleOrder(params)]
    }
	
	def prodSearch(Long id)
	{
		println "params: ${params}"
		def cust = Customer.get(id)
		def c = Prod.createCriteria()
		def searchedProdList = c.list(sort: 'code') {
			eq('cust', cust)
			prodBase {
				or {
					ilike("name", "%${params.nameFilter}%")
					ilike("code", "%${params.nameFilter}%")
				}
			}
		}
		
		println "searchedProdList is: ${searchedProdList}, cust: ${cust}"
		if (searchedProdList.size() < 1) {
			searchedProdList = Prod.findAllByCust(cust, [max:50])
		}
		render(template: 'prodInput_template', model:  [cust:cust, searchedProdList: searchedProdList])
	}

    def save() {
        def saleOrderObj = new SaleOrder(params)
		
		saleOrderObj.code = "temp"+System.currentTimeMillis()
		saleOrderObj.crtUser = session.user
		// moved to domain beforeInsert()
		
        if (!saleOrderObj.save(flush: true)) {
            render(view: "create", model: [saleOrderObj: saleOrderObj])
            return
        }
		
		// def currSeq = SaleOrder.list()*.id.max()+1 // 目前id最大值 + 1
		// saleOrderObj.code = "C"+params['cust.id']+"-"+params['orderSource.id']+"-"+params['signDate'].format('yyMMdd')+"-"+currSeq
		
		saleOrderObj.code = "${saleOrderObj.cust.code}-${saleOrderObj.orderSource.code}-${saleOrderObj.signDate.format('yyMMdd')}-${saleOrderObj.id}"
		saleOrderObj.save()		
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), saleOrderObj.id])
        redirect(action: "show", id: saleOrderObj.id)
    }
	
	def insert_saleOrderLine() {
		Prod p = Prod.get(params['prod.id'])
		
		params.priceFlag = "C"
		if (params.price == 'A-上次订单价格') {
			def lastOrderLine = SaleOrderLine.findByProd(p, [sort:'id', order:'desc'])
			params.price = lastOrderLine?.price
			params.priceFlag = "A"
		} else { // if (params.price == 'B-产品标准价格') 
			params.price = p?.prodBase?.stdPrice
			params.priceFlag = "B"
		}
		
		if (!params.price) {
			params.price = p?.prodBase?.stdPrice
			flash.message = "没有取到上次订单的价格，给您选用该产品标准价格"
			params.priceFlag = "B"
		}
		
		if (!params.price) {
			params.price = p?.prodBase?.stdPrice
			flash.message = "没有取到上次订单的价格以及产品标准价格，请核实产品标准价格是否已经定义"
		}
				
		def saleOrderLineObj = new SaleOrderLine(params)
						
		if (!saleOrderLineObj.save(flush: true)) {
			SaleOrder saleOrderObj = SaleOrder.load(params['saleOrder.id'])
			render(view: "show", model: [saleOrderLineObj: saleOrderLineObj, saleOrderObj:saleOrderObj])
			return
		}
				
		flash.message = flash.message+", "+message(code: 'default.created.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), saleOrderLineObj.id])
		redirect(action: "show", id: params['saleOrder.id'])
	}
	
	def update_saleOrderLine(Long id, Long version)
	{
		def saleOrderLineObj = SaleOrderLine.get(id)
		if (!saleOrderLineObj) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
			render(view: "show", model: [saleOrderLineObj: saleOrderLineObj])
			return
		}

		if (version != null) {
			if (saleOrderLineObj.version > version) {
				saleOrderLineObj.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'saleOrderLine.label', default: 'SaleOrderLine')] as Object[],
						  "Another user has updated this SaleOrderLine while you were editing")
				render(view: "show", model: [saleOrderLineObj: saleOrderLineObj])
				return
			}
		}

		saleOrderLineObj.properties = params

		if (!saleOrderLineObj.save(flush: true, failOnError:true)) {
			render(view: "show", model: [saleOrderLineObj: saleOrderLineObj])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), saleOrderLineObj.id])
		redirect(action: "show", id: params['saleOrder.id'])
	}
	
	def del_saleOrderLine(Long id) {
		
        def saleOrderLineObj = SaleOrderLine.get(id)
        if (!saleOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            render(view: "show", model: [saleOrderLineObj: saleOrderLineObj])
            return
        }

        try {
            saleOrderLineObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "show", id: params['saleOrder.id'])
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            render(view: "show", model: [saleOrderLineObj: saleOrderLineObj])
        }
	}

    def show(Long id) {
        def saleOrderObj = SaleOrder.get(id)
        if (!saleOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "list")
            return
        }
		
        [saleOrderObj: saleOrderObj]
    }

    def edit(Long id) {
        def saleOrderObj = SaleOrder.get(id)
        if (!saleOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "list")
            return
        }

        [saleOrderObj: saleOrderObj]
    }

    def update(Long id, Long version) {
        def saleOrderObj = SaleOrder.get(id)
				
        if (!saleOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "list")
            return
        }
		
		saleOrderObj.lastUpdatedUser = session.user

        if (version != null) {
            if (saleOrderObj.version > version) {
                saleOrderObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'saleOrder.label', default: 'SaleOrder')] as Object[],
                          "Another user has updated this SaleOrder while you were editing")
                render(view: "edit", model: [saleOrderObj: saleOrderObj])
                return
            }
        }

        saleOrderObj.properties = params

        if (!saleOrderObj.save(flush: true)) {
            render(view: "edit", model: [saleOrderObj: saleOrderObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), saleOrderObj.id])
        redirect(action: "show", id: saleOrderObj.id)
    }

    def delete(Long id) {
        def saleOrderObj = SaleOrder.get(id)
        if (!saleOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "list")
            return
        }

        try {
            saleOrderObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), id])
            redirect(action: "show", id: id)
        }
    }
}
