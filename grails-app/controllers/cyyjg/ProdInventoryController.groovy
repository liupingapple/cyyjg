package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdInventoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodInventoryObjList: ProdInventory.list(params), prodInventoryObjTotal: ProdInventory.count()]
    }

    def create() {
        [prodInventoryObj: new ProdInventory(params)]
    }

    def save() {
        def prodInventoryObj = new ProdInventory(params)
        if (!prodInventoryObj.save(flush: true)) {
            render(view: "create", model: [prodInventoryObj: prodInventoryObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), prodInventoryObj.id])
        redirect(action: "show", id: prodInventoryObj.id)
    }

    def show(Long id) {
        def prodInventoryObj = ProdInventory.get(id)
        if (!prodInventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "list")
            return
        }

        [prodInventoryObj: prodInventoryObj]
    }

    def edit(Long id) {
        def prodInventoryObj = ProdInventory.get(id)
        if (!prodInventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "list")
            return
        }

        [prodInventoryObj: prodInventoryObj]
    }

    def update(Long id, Long version) {
        def prodInventoryObj = ProdInventory.get(id)
        if (!prodInventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodInventoryObj.version > version) {
                prodInventoryObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodInventory.label', default: 'ProdInventory')] as Object[],
                          "Another user has updated this ProdInventory while you were editing")
                render(view: "edit", model: [prodInventoryObj: prodInventoryObj])
                return
            }
        }

        prodInventoryObj.properties = params

        if (!prodInventoryObj.save(flush: true)) {
            render(view: "edit", model: [prodInventoryObj: prodInventoryObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), prodInventoryObj.id])
        redirect(action: "show", id: prodInventoryObj.id)
    }

    def delete(Long id) {
        def prodInventoryObj = ProdInventory.get(id)
        if (!prodInventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "list")
            return
        }

        try {
            prodInventoryObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodInventory.label', default: 'ProdInventory'), id])
            redirect(action: "show", id: id)
        }
    }
}
