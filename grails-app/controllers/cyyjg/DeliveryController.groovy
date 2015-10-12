package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class DeliveryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [deliveryObjList: Delivery.list(params), deliveryObjTotal: Delivery.count()]
    }

    def create() {
        [deliveryObj: new Delivery(params)]
    }

    def save() {
        def deliveryObj = new Delivery(params)
        if (!deliveryObj.save(flush: true)) {
            render(view: "create", model: [deliveryObj: deliveryObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'delivery.label', default: 'Delivery'), deliveryObj.id])
        redirect(action: "show", id: deliveryObj.id)
    }

    def show(Long id) {
        def deliveryObj = Delivery.get(id)
        if (!deliveryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "list")
            return
        }

        [deliveryObj: deliveryObj]
    }
	
	// 打印
	def print(Long id) {
		def deliveryObj = Delivery.get(id)
		if (!deliveryObj) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
			redirect(action: "list")
			return
		}

		[deliveryObj: deliveryObj]
	}

    def edit(Long id) {
        def deliveryObj = Delivery.get(id)
        if (!deliveryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "list")
            return
        }

        [deliveryObj: deliveryObj]
    }

    def update(Long id, Long version) {
        def deliveryObj = Delivery.get(id)
        if (!deliveryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (deliveryObj.version > version) {
                deliveryObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'delivery.label', default: 'Delivery')] as Object[],
                          "Another user has updated this Delivery while you were editing")
                render(view: "edit", model: [deliveryObj: deliveryObj])
                return
            }
        }

        deliveryObj.properties = params

        if (!deliveryObj.save(flush: true)) {
            render(view: "edit", model: [deliveryObj: deliveryObj])
            return
        }
		
		if (deliveryObj.status == CONSTANT.DELIVERY_STATUS_INWAY) {
			deliveryObj.prodInstruct.status = CONSTANT.INSTRUCT_STATUS_DELIVERED
			deliveryObj.prodInstruct.save()
		}
		
		if (deliveryObj.status == CONSTANT.DELIVERY_STATUS_RECEIVED) {
			deliveryObj.prodInstruct.status = CONSTANT.INSTRUCT_STATUS_DONE
			deliveryObj.prodInstruct.save()
		}
		
		SaleOrder saleOrder = deliveryObj.prodInstruct.saleOrderLine.saleOrder
		
		def allDone = true
		saleOrder.orderLines.each { orderLine->
			ProdInstruct pinst = ProdInstruct.findBySaleOrderLine(orderLine)
			if (pinst.status != CONSTANT.INSTRUCT_STATUS_DONE) {
				allDone = false
			}
		}
		
		if (allDone) {
			saleOrder.status = CONSTANT.ORDER_STATUS_FINISHED
			saleOrder.save()
		}

        flash.message = message(code: 'default.updated.message', args: [message(code: 'delivery.label', default: 'Delivery'), deliveryObj.id])
        redirect(action: "show", id: deliveryObj.id)
    }

    def delete(Long id) {
        def deliveryObj = Delivery.get(id)
        if (!deliveryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "list")
            return
        }

        try {
            deliveryObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'delivery.label', default: 'Delivery'), id])
            redirect(action: "show", id: id)
        }
    }
}
