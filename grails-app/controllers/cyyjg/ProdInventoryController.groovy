package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdInventoryController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [inventoryObjList: ProdInventory.list(params), inventoryObjTotal: ProdInventory.count()]
    }

    def create() {
        [inventoryObj: new ProdInventory(params)]
    }

    def save() {
        def inventoryObj = new ProdInventory(params)
        if (!inventoryObj.save(flush: true)) {
            render(view: "create", model: [inventoryObj: inventoryObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'inventory.label', default: 'Inventory'), inventoryObj.id])
        redirect(action: "show", id: inventoryObj.id)
    }

    def show(Long id) {
        def inventoryObj = ProdInventory.get(id)
        if (!inventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "list")
            return
        }

        [inventoryObj: inventoryObj]
    }

    def edit(Long id) {
        def inventoryObj = ProdInventory.get(id)
        if (!inventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "list")
            return
        }

        [inventoryObj: inventoryObj]
    }

    def update(Long id, Long version) {
        def inventoryObj = ProdInventory.get(id)
        if (!inventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (inventoryObj.version > version) {
                inventoryObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'inventory.label', default: 'Inventory')] as Object[],
                          "Another user has updated this Inventory while you were editing")
                render(view: "edit", model: [inventoryObj: inventoryObj])
                return
            }
        }

        inventoryObj.properties = params

        if (!inventoryObj.save(flush: true)) {
            render(view: "edit", model: [inventoryObj: inventoryObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'inventory.label', default: 'Inventory'), inventoryObj.id])
        redirect(action: "show", id: inventoryObj.id)
    }

    def delete(Long id) {
        def inventoryObj = ProdInventory.get(id)
        if (!inventoryObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "list")
            return
        }

        try {
            inventoryObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'inventory.label', default: 'Inventory'), id])
            redirect(action: "show", id: id)
        }
    }
}
