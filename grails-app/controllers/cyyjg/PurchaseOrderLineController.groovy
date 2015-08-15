package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class PurchaseOrderLineController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [purchaseOrderLineObjList: PurchaseOrderLine.list(params), purchaseOrderLineObjTotal: PurchaseOrderLine.count()]
    }

    def create() {
        [purchaseOrderLineObj: new PurchaseOrderLine(params)]
    }

    def save() {
        def purchaseOrderLineObj = new PurchaseOrderLine(params)
        if (!purchaseOrderLineObj.save(flush: true)) {
            render(view: "create", model: [purchaseOrderLineObj: purchaseOrderLineObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), purchaseOrderLineObj.id])
        redirect(action: "show", id: purchaseOrderLineObj.id)
    }

    def show(Long id) {
        def purchaseOrderLineObj = PurchaseOrderLine.get(id)
        if (!purchaseOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "list")
            return
        }

        [purchaseOrderLineObj: purchaseOrderLineObj]
    }

    def edit(Long id) {
        def purchaseOrderLineObj = PurchaseOrderLine.get(id)
        if (!purchaseOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "list")
            return
        }

        [purchaseOrderLineObj: purchaseOrderLineObj]
    }

    def update(Long id, Long version) {
        def purchaseOrderLineObj = PurchaseOrderLine.get(id)
        if (!purchaseOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (purchaseOrderLineObj.version > version) {
                purchaseOrderLineObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine')] as Object[],
                          "Another user has updated this PurchaseOrderLine while you were editing")
                render(view: "edit", model: [purchaseOrderLineObj: purchaseOrderLineObj])
                return
            }
        }

        purchaseOrderLineObj.properties = params

        if (!purchaseOrderLineObj.save(flush: true)) {
            render(view: "edit", model: [purchaseOrderLineObj: purchaseOrderLineObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), purchaseOrderLineObj.id])
        redirect(action: "show", id: purchaseOrderLineObj.id)
    }

    def delete(Long id) {
        def purchaseOrderLineObj = PurchaseOrderLine.get(id)
        if (!purchaseOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "list")
            return
        }

        try {
            purchaseOrderLineObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'purchaseOrderLine.label', default: 'PurchaseOrderLine'), id])
            redirect(action: "show", id: id)
        }
    }
}
