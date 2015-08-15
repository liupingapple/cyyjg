package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdBatchController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodBatchObjList: ProdBatch.list(params), prodBatchObjTotal: ProdBatch.count()]
    }

    def create() {
        [prodBatchObj: new ProdBatch(params)]
    }

    def save() {
        def prodBatchObj = new ProdBatch(params)
        if (!prodBatchObj.save(flush: true)) {
            render(view: "create", model: [prodBatchObj: prodBatchObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), prodBatchObj.id])
        redirect(action: "show", id: prodBatchObj.id)
    }

    def show(Long id) {
        def prodBatchObj = ProdBatch.get(id)
        if (!prodBatchObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "list")
            return
        }

        [prodBatchObj: prodBatchObj]
    }

    def edit(Long id) {
        def prodBatchObj = ProdBatch.get(id)
        if (!prodBatchObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "list")
            return
        }

        [prodBatchObj: prodBatchObj]
    }

    def update(Long id, Long version) {
        def prodBatchObj = ProdBatch.get(id)
        if (!prodBatchObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodBatchObj.version > version) {
                prodBatchObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodBatch.label', default: 'ProdBatch')] as Object[],
                          "Another user has updated this ProdBatch while you were editing")
                render(view: "edit", model: [prodBatchObj: prodBatchObj])
                return
            }
        }

        prodBatchObj.properties = params

        if (!prodBatchObj.save(flush: true)) {
            render(view: "edit", model: [prodBatchObj: prodBatchObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), prodBatchObj.id])
        redirect(action: "show", id: prodBatchObj.id)
    }

    def delete(Long id) {
        def prodBatchObj = ProdBatch.get(id)
        if (!prodBatchObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "list")
            return
        }

        try {
            prodBatchObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodBatch.label', default: 'ProdBatch'), id])
            redirect(action: "show", id: id)
        }
    }
}
