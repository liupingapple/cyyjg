package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class BomStdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [bomStdObjList: BomStd.list(params), bomStdObjTotal: BomStd.count()]
    }
	
	// only used to create the root BOM
    def create() {
		def bomStdObj = null
		
		// for rootBomStd, should be unique
		BomStd checkBom = BomStd.findByMarkAndProd("S", Prod.get(params['prod.id']))
		if (checkBom) {
			bomStdObj = checkBom
		} 
		else 
		{
			if (!params.mark){
				params.mark = "S" // the root of standard BOM is only one char 'S'
			}
			
			if (!params.unit){
				params.unit = "千克"
			}
			
			bomStdObj = new BomStd(params)
			bomStdObj.quantity = 1
			if (!bomStdObj.save(failOnError:true)) {
				render(view: "create", model: [bomStdObj: bomStdObj])
				redirect(action: "edit", id: bomStdObj.id)
				return
			}
		}
			
		redirect(action: "edit", id: bomStdObj.id)
    }

    def save() {		
        def bomStdObj = new BomStd(params)   
		def parentBomStd = BomStd.get(params.parentBomId)
		
		if (!parentBomStd) {
			bomStdObj.mark = "S"
		} 
		else {
			// parentBomStd.children*.seq.max() + 1
			bomStdObj.mark = parentBomStd.mark+(parentBomStd.children?.size()+1)			
		}
		
        if (!bomStdObj.save(flush: true, failOnError:true)) {
            render(view: "create", model: [bomStdObj: bomStdObj])
			redirect(action: "edit", id: bomStdObj.id)
            return
        }
		
		if (parentBomStd) {		
			parentBomStd.addToChildren(bomStdObj)
			parentBomStd.save(failOnError:true)
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'bomStd.label', default: 'BomStd'), bomStdObj.id])
        redirect(action: "edit", id: bomStdObj.id)
    }

    def show(Long id) {
        def bomStdObj = BomStd.get(id)
        if (!bomStdObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "list")
            return
        }

        [bomStdObj: bomStdObj]
    }

    def edit(Long id) {
        def bomStdObj = BomStd.get(id)
        if (!bomStdObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "list")
            return
        }

        [bomStdObj: bomStdObj]
    }

    def update(Long id, Long version) {
        def bomStdObj = BomStd.get(id)
        if (!bomStdObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (bomStdObj.version > version) {
                bomStdObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'bomStd.label', default: 'BomStd')] as Object[],
                          "Another user has updated this BomStd while you were editing")
                render(view: "edit", model: [bomStdObj: bomStdObj])
                return
            }
        }

        bomStdObj.properties = params

        if (!bomStdObj.save(flush: true)) {
            render(view: "edit", model: [bomStdObj: bomStdObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'bomStd.label', default: 'BomStd'), bomStdObj.id])
        redirect(action: "edit", id: bomStdObj.id)
    }

    def delete(Long id) {
        def bomStdObj = BomStd.get(id)
				
		def rootBom = Utils.getRootBom(bomStdObj)
		
        if (!bomStdObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "list")
            return
        }

        try {
            bomStdObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "edit", id:rootBom.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'bomStd.label', default: 'BomStd'), id])
            redirect(action: "edit", id: id)
        }
    }
}
