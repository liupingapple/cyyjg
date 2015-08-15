package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomEngComponentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomEngComponentObjList: BomEngComponent.list(params), bomEngComponentObjTotal: BomEngComponent.count()]
    }

    def create() {
        [bomEngComponentObj: new BomEngComponent(params)]
    }

    def save() {
        def bomEngComponentObj = new BomEngComponent(params)
        if (!bomEngComponentObj.save(flush: true)) {
            render(view: "create", model: [bomEngComponentObj: bomEngComponentObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), bomEngComponentObj.id])
        redirect(action: "show", id: bomEngComponentObj.id)
    }

    def show(Long id) {
        def bomEngComponentObj = BomEngComponent.get(id)
        if (!bomEngComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "list")
            return
        }

        [bomEngComponentObj: bomEngComponentObj]
    }

    def edit(Long id) {
        def bomEngComponentObj = BomEngComponent.get(id)
        if (!bomEngComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "list")
            return
        }

        [bomEngComponentObj: bomEngComponentObj]
    }

    def update(Long id, Long version) {
        def bomEngComponentObj = BomEngComponent.get(id)
        if (!bomEngComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomEngComponentObj.version > version) {
                bomEngComponentObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomEngComponent.label', default: 'BomEngComponent')] as Object[],
                          "Another user has updated this BomEngComponent while you were editing")
                render(view: "edit", model: [bomEngComponentObj: bomEngComponentObj])
                return
            }
        }

        bomEngComponentObj.properties = params

        if (!bomEngComponentObj.save(flush: true)) {
            render(view: "edit", model: [bomEngComponentObj: bomEngComponentObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), bomEngComponentObj.id])
        redirect(action: "show", id: bomEngComponentObj.id)
    }

    def delete(Long id) {
        def bomEngComponentObj = BomEngComponent.get(id)
        if (!bomEngComponentObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "list")
            return
        }

        try {
            bomEngComponentObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent'), id])
            redirect(action: "show", id: id)
        }
    }
}
