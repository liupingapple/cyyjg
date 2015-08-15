package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomEngController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomEngObjList: BomEng.list(params), bomEngObjTotal: BomEng.count()]
    }

    def create() {
        [bomEngObj: new BomEng(params)]
    }

    def save() {
        def bomEngObj = new BomEng(params)
        if (!bomEngObj.save(flush: true)) {
            render(view: "create", model: [bomEngObj: bomEngObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bomEng.label', default: 'BomEng'), bomEngObj.id])
        redirect(action: "show", id: bomEngObj.id)
    }

    def show(Long id) {
        def bomEngObj = BomEng.get(id)
        if (!bomEngObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "list")
            return
        }

        [bomEngObj: bomEngObj]
    }

    def edit(Long id) {
        def bomEngObj = BomEng.get(id)
        if (!bomEngObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "list")
            return
        }

        [bomEngObj: bomEngObj]
    }

    def update(Long id, Long version) {
        def bomEngObj = BomEng.get(id)
        if (!bomEngObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomEngObj.version > version) {
                bomEngObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomEng.label', default: 'BomEng')] as Object[],
                          "Another user has updated this BomEng while you were editing")
                render(view: "edit", model: [bomEngObj: bomEngObj])
                return
            }
        }

        bomEngObj.properties = params

        if (!bomEngObj.save(flush: true)) {
            render(view: "edit", model: [bomEngObj: bomEngObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomEng.label', default: 'BomEng'), bomEngObj.id])
        redirect(action: "show", id: bomEngObj.id)
    }

    def delete(Long id) {
        def bomEngObj = BomEng.get(id)
        if (!bomEngObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "list")
            return
        }

        try {
            bomEngObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomEng.label', default: 'BomEng'), id])
            redirect(action: "show", id: id)
        }
    }
}
