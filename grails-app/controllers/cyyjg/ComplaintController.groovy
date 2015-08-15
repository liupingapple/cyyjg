package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ComplaintController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [complaintObjList: Complaint.list(params), complaintObjTotal: Complaint.count()]
    }

    def create() {
        [complaintObj: new Complaint(params)]
    }

    def save() {
        def complaintObj = new Complaint(params)
        if (!complaintObj.save(flush: true)) {
            render(view: "create", model: [complaintObj: complaintObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'complaint.label', default: 'Complaint'), complaintObj.id])
        redirect(action: "show", id: complaintObj.id)
    }

    def show(Long id) {
        def complaintObj = Complaint.get(id)
        if (!complaintObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "list")
            return
        }

        [complaintObj: complaintObj]
    }

    def edit(Long id) {
        def complaintObj = Complaint.get(id)
        if (!complaintObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "list")
            return
        }

        [complaintObj: complaintObj]
    }

    def update(Long id, Long version) {
        def complaintObj = Complaint.get(id)
        if (!complaintObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (complaintObj.version > version) {
                complaintObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'complaint.label', default: 'Complaint')] as Object[],
                          "Another user has updated this Complaint while you were editing")
                render(view: "edit", model: [complaintObj: complaintObj])
                return
            }
        }

        complaintObj.properties = params

        if (!complaintObj.save(flush: true)) {
            render(view: "edit", model: [complaintObj: complaintObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'complaint.label', default: 'Complaint'), complaintObj.id])
        redirect(action: "show", id: complaintObj.id)
    }

    def delete(Long id) {
        def complaintObj = Complaint.get(id)
        if (!complaintObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "list")
            return
        }

        try {
            complaintObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'complaint.label', default: 'Complaint'), id])
            redirect(action: "show", id: id)
        }
    }
}
