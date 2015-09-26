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
		bomActualObj.modifiedBy = session.user
		
		def parentBomActual = BomActual.get(params.parentBomId)
		
		bomActualObj.prodInstruct = parentBomActual?.prodInstruct
		
		if (!parentBomActual) {
			bomActualObj.mark = "P"
		}
		else {
			// parentBomActual.children*.seq.max() + 1
			bomActualObj.mark = parentBomActual.mark+(parentBomActual.children?.size()+1)
			println "bomActualObj.mark: ${bomActualObj.mark}"
		}
		
		if (!bomActualObj.save(flush: true, failOnError:true)) {
			render(view: "create", model: [bomStdObj: bomActualObj])
			redirect(action: "edit", id: bomActualObj.id)
			return
		}
		
		if (parentBomActual) {
			parentBomActual.addToChildren(bomActualObj)
			parentBomActual.save(failOnError:true)
		}
		
		flash.message = message(code: 'default.created.message', args: [message(code: 'bomStd.label', default: 'BomStd'), bomActualObj.id])
		redirect(action: "edit", id: bomActualObj.id)
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
	
	def prodInstConfirm(Long id)
	{
		def bomActualObj = BomActual.get(id)
		bomActualObj?.prodInstruct?.status = CONSTANT.INSTRUCT_STATUS_CONFIRMED
		bomActualObj?.prodInstruct?.save(failOnError:true)
						
		redirect(action: "edit", id: id)
	}
	
	def prodInstProduced(Long id)
	{
		def bomActualObj = BomActual.get(id)
		bomActualObj?.prodInstruct?.status = CONSTANT.INSTRUCT_STATUS_PRODUCED
		bomActualObj?.prodInstruct?.produceFinishedDate = new Date()
		bomActualObj?.prodInstruct?.save(failOnError:true)
		
		SaleOrderLine orderLine = bomActualObj?.prodInstruct?.saleOrderLine
		
		Delivery delivery = new Delivery(code:"S"+bomActualObj?.prodInstruct?.code, prodInstruct:bomActualObj?.prodInstruct, 
			addr:orderLine?.saleOrder?.cust?.deliveryAddr1,contact:orderLine?.saleOrder?.cust?.buyer, 
			contactPhone:orderLine?.saleOrder?.cust?.buyerPhone).save(failOnError:true)
			
		if (delivery) {
			flash.message = "生产单已经完成，生成送货单: ${delivery}"
		} else {
			flash.message = "生产单已经完成，生成送货单失败"
		}
				
		redirect(action: "edit", id: id)
	}
}
