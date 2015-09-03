package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class SaleOrderLineController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [saleOrderLineObjList: SaleOrderLine.list(params), saleOrderLineObjTotal: SaleOrderLine.count()]
    }

    def create() {
        [saleOrderLineObj: new SaleOrderLine(params)]
    }

    def save() {
        def saleOrderLineObj = new SaleOrderLine(params)
        if (!saleOrderLineObj.save(flush: true)) {
            render(view: "create", model: [saleOrderLineObj: saleOrderLineObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), saleOrderLineObj.id])
        redirect(action: "show", id: saleOrderLineObj.id)
    }

    def show(Long id) {
        def saleOrderLineObj = SaleOrderLine.get(id)
        if (!saleOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "list")
            return
        }

        [saleOrderLineObj: saleOrderLineObj]
    }

    def edit(Long id) {
        def saleOrderLineObj = SaleOrderLine.get(id)
        if (!saleOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "list")
            return
        }

        [saleOrderLineObj: saleOrderLineObj]
    }

    def update(Long id, Long version) {
        def saleOrderLineObj = SaleOrderLine.get(id)
        if (!saleOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (saleOrderLineObj.version > version) {
                saleOrderLineObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'saleOrderLine.label', default: 'SaleOrderLine')] as Object[],
                          "Another user has updated this SaleOrderLine while you were editing")
                render(view: "edit", model: [saleOrderLineObj: saleOrderLineObj])
                return
            }
        }

        saleOrderLineObj.properties = params

        if (!saleOrderLineObj.save(flush: true)) {
            render(view: "edit", model: [saleOrderLineObj: saleOrderLineObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), saleOrderLineObj.id])
        redirect(action: "show", id: saleOrderLineObj.id)
    }

    def delete(Long id) {
        def saleOrderLineObj = SaleOrderLine.get(id)
        if (!saleOrderLineObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "list")
            return
        }

        try {
            saleOrderLineObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'saleOrderLine.label', default: 'SaleOrderLine'), id])
            redirect(action: "show", id: id)
        }
    }
}
