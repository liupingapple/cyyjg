package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def showProdBase()
	{
		println "params is: ${params}"
		ProdBase pbase = ProdBase.get(params.prodBaseId)
		render(template:"prodBaseItems", model:[prodBaseObj:pbase])
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def prodList = Prod.where {
			rootBomStdId > 0 || cust != null
		}.list(params)
		
		def prodCount = Prod.where {
			rootBomStdId > 0 || cust != null		
		}.list().size()
		
        [prodObjList: prodList, prodObjTotal: prodCount]
    }

    def create() {
        [prodObj: new Prod(params)]
    }

    def save() {
		Customer cust = Customer.load(params['cust.id'])
		ProdBase prodBase = ProdBase.load(params['prodBase.id'])
				
		params.code = Utils.generateProdCustRefCode(cust, prodBase)
		if (!params.custRefCode || params.custRefCode.contains("由系统生成")) {
			params.custRefCode = params.code
		}
		
        def prodObj = new Prod(params)
        if (!prodObj.save(flush: true)) {
            render(view: "create", model: [prodObj: prodObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prod.label', default: 'Prod'), prodObj.id])
        redirect(action: "show", id: prodObj.id)
    }

    def show(Long id) {
        def prodObj = Prod.get(id)
        if (!prodObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "list")
            return
        }

        [prodObj: prodObj]
    }

    def edit(Long id) {
        def prodObj = Prod.get(id)
        if (!prodObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "list")
            return
        }

        [prodObj: prodObj]
    }

    def update(Long id, Long version) {
        def prodObj = Prod.get(id)
        if (!prodObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodObj.version > version) {
                prodObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prod.label', default: 'Prod')] as Object[],
                          "Another user has updated this Prod while you were editing")
                render(view: "edit", model: [prodObj: prodObj])
                return
            }
        }
		
		params.code = Utils.generateProdCustRefCode(prodObj.cust, prodObj.prodBase)
		if (!params.custRefCode || params.custRefCode.contains("由系统生成")) {
			params.custRefCode = params.code
		}
		
        prodObj.properties = params

        if (!prodObj.save(flush: true)) {
            render(view: "edit", model: [prodObj: prodObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prod.label', default: 'Prod'), prodObj.id])
        redirect(action: "show", id: prodObj.id)
    }

    def delete(Long id) {
        def prodObj = Prod.get(id)
        if (!prodObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "list")
            return
        }

        try {
            prodObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prod.label', default: 'Prod'), id])
            redirect(action: "show", id: id)
        }
    }	
}
