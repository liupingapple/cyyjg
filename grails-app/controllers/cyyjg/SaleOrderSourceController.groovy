package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class SaleOrderSourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [saleOrderSourceObjList: SaleOrderSource.list(params), saleOrderSourceObjTotal: SaleOrderSource.count()]
    }

    def create() {
        [saleOrderSourceObj: new SaleOrderSource(params)]
    }

    def save() {
        def saleOrderSourceObj = new SaleOrderSource(params)
        if (!saleOrderSourceObj.save(flush: true)) {
            render(view: "create", model: [saleOrderSourceObj: saleOrderSourceObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), saleOrderSourceObj.id])
        redirect(action: "show", id: saleOrderSourceObj.id)
    }

    def show(Long id) {
        def saleOrderSourceObj = SaleOrderSource.get(id)
        if (!saleOrderSourceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "list")
            return
        }

        [saleOrderSourceObj: saleOrderSourceObj]
    }

    def edit(Long id) {
        def saleOrderSourceObj = SaleOrderSource.get(id)
        if (!saleOrderSourceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "list")
            return
        }

        [saleOrderSourceObj: saleOrderSourceObj]
    }

    def update(Long id, Long version) {
        def saleOrderSourceObj = SaleOrderSource.get(id)
        if (!saleOrderSourceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (saleOrderSourceObj.version > version) {
                saleOrderSourceObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'saleOrderSource.label', default: 'SaleOrderSource')] as Object[],
                          "Another user has updated this SaleOrderSource while you were editing")
                render(view: "edit", model: [saleOrderSourceObj: saleOrderSourceObj])
                return
            }
        }

        saleOrderSourceObj.properties = params

        if (!saleOrderSourceObj.save(flush: true)) {
            render(view: "edit", model: [saleOrderSourceObj: saleOrderSourceObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), saleOrderSourceObj.id])
        redirect(action: "show", id: saleOrderSourceObj.id)
    }

    def delete(Long id) {
        def saleOrderSourceObj = SaleOrderSource.get(id)
        if (!saleOrderSourceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "list")
            return
        }

        try {
            saleOrderSourceObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'saleOrderSource.label', default: 'SaleOrderSource'), id])
            redirect(action: "show", id: id)
        }
    }
}
