package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdInstructController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodInstructObjList: ProdInstruct.list(params), prodInstructObjTotal: ProdInstruct.count()]
    }

    def create() {
        [prodInstructObj: new ProdInstruct(params)]
    }

    def save() {
        def prodInstructObj = new ProdInstruct(params)
        if (!prodInstructObj.save(flush: true)) {
            render(view: "create", model: [prodInstructObj: prodInstructObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), prodInstructObj.id])
        redirect(action: "show", id: prodInstructObj.id)
    }

    def show(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        [prodInstructObj: prodInstructObj]
    }

    def edit(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

		session.fromController = 'prodInstruct'
		session.fromAction = 'edit'
		session.fromId = id
		
        [prodInstructObj: prodInstructObj]
    }

    def update(Long id, Long version) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodInstructObj.version > version) {
                prodInstructObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodInstruct.label', default: 'ProdInstruct')] as Object[],
                          "Another user has updated this ProdInstruct while you were editing")
                render(view: "edit", model: [prodInstructObj: prodInstructObj])
                return
            }
        }

        prodInstructObj.properties = params

        if (!prodInstructObj.save(flush: true)) {
            render(view: "edit", model: [prodInstructObj: prodInstructObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), prodInstructObj.id])
        redirect(action: "show", id: prodInstructObj.id)
    }

    def delete(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        try {
            prodInstructObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "show", id: id)
        }
    }
}
