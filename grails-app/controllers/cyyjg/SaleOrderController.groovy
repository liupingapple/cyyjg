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
		params.code = "Order"+System.currentTimeMillis()
        [saleOrderObj: new SaleOrder(params)]
    }

    def save() {
		println "params: ${params}"
        def saleOrderObj = new SaleOrder(params)
		
		saleOrderObj.crtUser = session.user
		
        if (!saleOrderObj.save(flush: true)) {
            render(view: "create", model: [saleOrderObj: saleOrderObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'saleOrder.label', default: 'SaleOrder'), saleOrderObj.id])
        redirect(action: "show", id: saleOrderObj.id)
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
