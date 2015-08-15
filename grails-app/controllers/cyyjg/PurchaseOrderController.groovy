package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class PurchaseOrderController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [purchaseOrderObjList: PurchaseOrder.list(params), purchaseOrderObjTotal: PurchaseOrder.count()]
    }

    def create() {
        [purchaseOrderObj: new PurchaseOrder(params)]
    }

    def save() {
        def purchaseOrderObj = new PurchaseOrder(params)
        if (!purchaseOrderObj.save(flush: true)) {
            render(view: "create", model: [purchaseOrderObj: purchaseOrderObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderObj.id])
        redirect(action: "show", id: purchaseOrderObj.id)
    }

    def show(Long id) {
        def purchaseOrderObj = PurchaseOrder.get(id)
        if (!purchaseOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "list")
            return
        }

        [purchaseOrderObj: purchaseOrderObj]
    }

    def edit(Long id) {
        def purchaseOrderObj = PurchaseOrder.get(id)
        if (!purchaseOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "list")
            return
        }

        [purchaseOrderObj: purchaseOrderObj]
    }

    def update(Long id, Long version) {
        def purchaseOrderObj = PurchaseOrder.get(id)
        if (!purchaseOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (purchaseOrderObj.version > version) {
                purchaseOrderObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'purchaseOrder.label', default: 'PurchaseOrder')] as Object[],
                          "Another user has updated this PurchaseOrder while you were editing")
                render(view: "edit", model: [purchaseOrderObj: purchaseOrderObj])
                return
            }
        }

        purchaseOrderObj.properties = params

        if (!purchaseOrderObj.save(flush: true)) {
            render(view: "edit", model: [purchaseOrderObj: purchaseOrderObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderObj.id])
        redirect(action: "show", id: purchaseOrderObj.id)
    }

    def delete(Long id) {
        def purchaseOrderObj = PurchaseOrder.get(id)
        if (!purchaseOrderObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "list")
            return
        }

        try {
            purchaseOrderObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), id])
            redirect(action: "show", id: id)
        }
    }
}
