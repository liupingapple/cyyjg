package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomActualController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomActualObjList: BomActual.list(params), bomActualObjTotal: BomActual.count()]
    }

	// only used to create the root BOM
    def create() {
        if (!params.flag){
			params.flag = "P" // the root of standard BOM is only one char 'P'
		}
		
		def bomActualObj = new BomStd(params)
		
		if (!bomActualObj.save(flush: true, failOnError:true)) {
			render(view: "create", model: [bomActualObj: bomActualObj])
			redirect(action: "edit", id: bomActualObj.id)
			return
		}
		
		redirect(action: "edit", id: bomActualObj.id)
    }

    def save() {
        def bomActualObj = new BomActual(params)
        if (!bomActualObj.save(flush: true)) {
            render(view: "create", model: [bomActualObj: bomActualObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'bomActual.label', default: 'BomActual'), bomActualObj.id])
        redirect(action: "show", id: bomActualObj.id)
    }

    def show(Long id) {
        def bomActualObj = BomActual.get(id)
        if (!bomActualObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "list")
            return
        }

        [bomActualObj: bomActualObj]
    }

    def edit(Long id) {
        def bomActualObj = BomActual.get(id)
        if (!bomActualObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "list")
            return
        }

        [bomActualObj: bomActualObj]
    }

    def update(Long id, Long version) {
        def bomActualObj = BomActual.get(id)
        if (!bomActualObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomActualObj.version > version) {
                bomActualObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomActual.label', default: 'BomActual')] as Object[],
                          "Another user has updated this BomActual while you were editing")
                render(view: "edit", model: [bomActualObj: bomActualObj])
                return
            }
        }

        bomActualObj.properties = params

        if (!bomActualObj.save(flush: true)) {
            render(view: "edit", model: [bomActualObj: bomActualObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomActual.label', default: 'BomActual'), bomActualObj.id])
        redirect(action: "edit", id: bomActualObj.id)
    }

    def delete(Long id) {
        def bomActualObj = BomActual.get(id)
		
		def rootBom = Utils.getRootBom(bomActualObj)
		
        if (!bomActualObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "list")
            return
        }

        try {
            bomActualObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "edit", id:rootBom.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomActual.label', default: 'BomActual'), id])
            redirect(action: "edit", id: id)
        }
    }
	
	def confirmProdInst(Long id)
	{
		def bomActualObj = BomActual.get(id)
		ProdInstruct prodInst = bomActualObj?.prodInstruct
		println "prodInst is: ${prodInst}"
		bomActualObj?.prodInstruct?.status = CONSTANT.INSTRUCT_STATUS_CONFIRMED
		bomActualObj?.prodInstruct?.save(failOnError:true)
						
		redirect(action: "edit", id: id)
	}
}
