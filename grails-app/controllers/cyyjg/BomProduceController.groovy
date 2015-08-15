package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomProduceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomProduceObjList: BomProduce.list(params), bomProduceObjTotal: BomProduce.count()]
    }

    def create() {
        [bomProduceObj: new BomProduce(params)]
    }

    def save() {
        def bomProduceObj = new BomProduce(params)
        if (!bomProduceObj.save(flush: true)) {
            render(view: "create", model: [bomProduceObj: bomProduceObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), bomProduceObj.id])
        redirect(action: "show", id: bomProduceObj.id)
    }

    def show(Long id) {
        def bomProduceObj = BomProduce.get(id)
        if (!bomProduceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "list")
            return
        }

        [bomProduceObj: bomProduceObj]
    }

    def edit(Long id) {
        def bomProduceObj = BomProduce.get(id)
        if (!bomProduceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "list")
            return
        }

        [bomProduceObj: bomProduceObj]
    }

    def update(Long id, Long version) {
        def bomProduceObj = BomProduce.get(id)
        if (!bomProduceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomProduceObj.version > version) {
                bomProduceObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomProduce.label', default: 'BomProduce')] as Object[],
                          "Another user has updated this BomProduce while you were editing")
                render(view: "edit", model: [bomProduceObj: bomProduceObj])
                return
            }
        }

        bomProduceObj.properties = params

        if (!bomProduceObj.save(flush: true)) {
            render(view: "edit", model: [bomProduceObj: bomProduceObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), bomProduceObj.id])
        redirect(action: "show", id: bomProduceObj.id)
    }

    def delete(Long id) {
        def bomProduceObj = BomProduce.get(id)
        if (!bomProduceObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "list")
            return
        }

        try {
            bomProduceObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomProduce.label', default: 'BomProduce'), id])
            redirect(action: "show", id: id)
        }
    }
}
