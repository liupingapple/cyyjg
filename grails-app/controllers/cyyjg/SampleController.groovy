package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class SampleController {

	def scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sampleObjList: Sample.list(params), sampleObjTotal: Sample.count()]
    }

    def create() {
        [sampleObj: new Sample(params)]
    }

    def save() {
        def sampleObj = new Sample(params)
        if (!sampleObj.save(flush: true)) {
            render(view: "create", model: [sampleObj: sampleObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sample.label', default: 'Sample'), sampleObj.id])
        redirect(action: "show", id: sampleObj.id)
    }

    def show(Long id) {
        def sampleObj = Sample.get(id)
        if (!sampleObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "list")
            return
        }

        [sampleObj: sampleObj]
    }

    def edit(Long id) {
        def sampleObj = Sample.get(id)
        if (!sampleObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "list")
            return
        }

        [sampleObj: sampleObj]
    }

    def update(Long id, Long version) {
        def sampleObj = Sample.get(id)
        if (!sampleObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sampleObj.version > version) {
                sampleObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sample.label', default: 'Sample')] as Object[],
                          "Another user has updated this Sample while you were editing")
                render(view: "edit", model: [sampleObj: sampleObj])
                return
            }
        }

        sampleObj.properties = params

        if (!sampleObj.save(flush: true)) {
            render(view: "edit", model: [sampleObj: sampleObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sample.label', default: 'Sample'), sampleObj.id])
        redirect(action: "show", id: sampleObj.id)
    }

    def delete(Long id) {
        def sampleObj = Sample.get(id)
        if (!sampleObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "list")
            return
        }

        try {
            sampleObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sample.label', default: 'Sample'), id])
            redirect(action: "show", id: id)
        }
    }
}
