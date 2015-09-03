package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodGroupObjList: ProdGroup.list(params), prodGroupObjTotal: ProdGroup.count()]
    }

    def create() {
        [prodGroupObj: new ProdGroup(params)]
    }

    def save() {
        def prodGroupObj = new ProdGroup(params)
        if (!prodGroupObj.save(flush: true)) {
            render(view: "create", model: [prodGroupObj: prodGroupObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), prodGroupObj.id])
        redirect(action: "show", id: prodGroupObj.id)
    }

    def show(Long id) {
        def prodGroupObj = ProdGroup.get(id)
        if (!prodGroupObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "list")
            return
        }

        [prodGroupObj: prodGroupObj]
    }

    def edit(Long id) {
        def prodGroupObj = ProdGroup.get(id)
        if (!prodGroupObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "list")
            return
        }

        [prodGroupObj: prodGroupObj]
    }

    def update(Long id, Long version) {
        def prodGroupObj = ProdGroup.get(id)
        if (!prodGroupObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodGroupObj.version > version) {
                prodGroupObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodGroup.label', default: 'ProdGroup')] as Object[],
                          "Another user has updated this ProdGroup while you were editing")
                render(view: "edit", model: [prodGroupObj: prodGroupObj])
                return
            }
        }

        prodGroupObj.properties = params

        if (!prodGroupObj.save(flush: true)) {
            render(view: "edit", model: [prodGroupObj: prodGroupObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), prodGroupObj.id])
        redirect(action: "show", id: prodGroupObj.id)
    }

    def delete(Long id) {
        def prodGroupObj = ProdGroup.get(id)
        if (!prodGroupObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            prodGroupObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodGroup.label', default: 'ProdGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
