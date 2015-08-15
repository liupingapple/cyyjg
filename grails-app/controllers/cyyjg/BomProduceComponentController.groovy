package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomProduceComponentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomProduceComponentObjList: BomProduceComponent.list(params), bomProduceComponentObjTotal: BomProduceComponent.count()]
    }

    def create() {
        [bomProduceComponentObj: new BomProduceComponent(params)]
    }

    def save() {
        def bomProduceComponentObj = new BomProduceComponent(params)
        if (!bomProduceComponentObj.save(flush: true)) {
            render(view: "create", model: [bomProduceComponentObj: bomProduceComponentObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), bomProduceComponentObj.id])
        redirect(action: "show", id: bomProduceComponentObj.id)
    }

    def show(Long id) {
        def bomProduceComponentObj = BomProduceComponent.get(id)
        if (!bomProduceComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "list")
            return
        }

        [bomProduceComponentObj: bomProduceComponentObj]
    }

    def edit(Long id) {
        def bomProduceComponentObj = BomProduceComponent.get(id)
        if (!bomProduceComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "list")
            return
        }

        [bomProduceComponentObj: bomProduceComponentObj]
    }

    def update(Long id, Long version) {
        def bomProduceComponentObj = BomProduceComponent.get(id)
        if (!bomProduceComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomProduceComponentObj.version > version) {
                bomProduceComponentObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent')] as Object[],
                          "Another user has updated this BomProduceComponent while you were editing")
                render(view: "edit", model: [bomProduceComponentObj: bomProduceComponentObj])
                return
            }
        }

        bomProduceComponentObj.properties = params

        if (!bomProduceComponentObj.save(flush: true)) {
            render(view: "edit", model: [bomProduceComponentObj: bomProduceComponentObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), bomProduceComponentObj.id])
        redirect(action: "show", id: bomProduceComponentObj.id)
    }

    def delete(Long id) {
        def bomProduceComponentObj = BomProduceComponent.get(id)
        if (!bomProduceComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "list")
            return
        }

        try {
            bomProduceComponentObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomProduceComponent.label', default: 'BomProduceComponent'), id])
            redirect(action: "show", id: id)
        }
    }
}
