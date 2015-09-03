package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class CustomerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [customerObjList: Customer.list(params), customerObjTotal: Customer.count()]
    }

    def create() {
        [customerObj: new Customer(params)]
    }

    def save() {
		params.code = 'cust'+(Customer.list()*.id?.max()+1)
        def customerObj = new Customer(params)
        if (!customerObj.save(flush: true)) {
            render(view: "create", model: [customerObj: customerObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerObj.id])
        redirect(action: "show", id: customerObj.id)
    }

    def show(Long id) {
        def customerObj = Customer.get(id)
        if (!customerObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerObj: customerObj]
    }

    def edit(Long id) {
        def customerObj = Customer.get(id)
        if (!customerObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        [customerObj: customerObj]
    }

    def update(Long id, Long version) {
        def customerObj = Customer.get(id)
        if (!customerObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (customerObj.version > version) {
                customerObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'customer.label', default: 'Customer')] as Object[],
                          "Another user has updated this Customer while you were editing")
                render(view: "edit", model: [customerObj: customerObj])
                return
            }
        }

        customerObj.properties = params

        if (!customerObj.save(flush: true)) {
            render(view: "edit", model: [customerObj: customerObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerObj.id])
        redirect(action: "show", id: customerObj.id)
    }

    def delete(Long id) {
        def customerObj = Customer.get(id)
        if (!customerObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
            return
        }

        try {
            customerObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), id])
            redirect(action: "show", id: id)
        }
    }
}
