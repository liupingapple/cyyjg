package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class ProdInstructController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodInstructObjList: ProdInstruct.list(params), prodInstructObjTotal: ProdInstruct.count()]
    }

    def create() {
        [prodInstructObj: new ProdInstruct(params)]
    }
	
	def approveByManager()
	{
		def prodInstIdList = []
		prodInstIdList << params.prodInstMselected
		prodInstIdList = prodInstIdList.flatten()
		
		prodInstIdList.each { id->
			def prodInstruct = ProdInstruct.get(id)
			if (prodInstruct) {
				if (params.approveByManagerRadio == 'approved') {
					prodInstruct.status = CONSTANT.INSTRUCT_STATUS_APPROVED_BY_MANAGER
				} else if (params.approveByManagerRadio == 'rejected') {
					prodInstruct.status = CONSTANT.INSTRUCT_STATUS_REJECTED_BY_MANAGER
				} else {
					flash.message = "Error: params.approveByManagerRadio is: ${params.approveByManagerRadio}"
				}
				
				if (!prodInstruct.save()) {
					flash.message = "审批${prodInstruct}失败"
					return
				}
			}
			else {
				flash.message = "没有操作合适的生产单"
			}
		}
		
		redirect(action: "list")
	}
	
	def approveByFinance()
	{
		def prodInstIdList = []
		prodInstIdList << params.prodInstFselected
		prodInstIdList = prodInstIdList.flatten()
		
		prodInstIdList.each { id->
			def prodInstruct = ProdInstruct.get(id)
			if (prodInstruct) {
				if (params.approveByFinanceRadio == 'approved') {
					prodInstruct.status = CONSTANT.INSTRUCT_STATUS_APPROVED_BY_FINANCE
				} else if (params.approveByFinanceRadio == 'rejected') {
					prodInstruct.status = CONSTANT.INSTRUCT_STATUS_REJECTED_BY_FINANCE
				} else {
					flash.message = "Error: params.approveByManagerRadio is: ${params.approveByFinanceRadio}"
				}
				
				if (!prodInstruct.save()) {
					flash.message = "审批${prodInstruct}失败"
					return
				}
			}
			else {
				flash.message = "没有操作合适的生产单"
			}
		}
		
		redirect(action: "list")
	}
	
	def getComponents()
	{
		def rootBomActualIdList = []
		rootBomActualIdList << params.rootBomActual_selected
		rootBomActualIdList = rootBomActualIdList.flatten()
				
		// def noteCode = "LLD-"+new Date().format("yyMMddHHmmss")
		def noteCode = "LLD-${rootBomActualIdList.join('-')}"
		
		if (CompGetNote.findByNoteCode(noteCode)) {
			flash.message = "已经生成过领料单:${noteCode}, 请不要重复生成"
			redirect(action: "list")
			return
		}
		
		/*def componentMap = new TreeMap<String, BigDecimal>()
		def componentMapComment = new TreeMap<String, BigDecimal>()*/
		def relatedProdInstList = []
		
		rootBomActualIdList.each { id ->
			def rootBomActual = BomActual.get(id)
			if (rootBomActual) {
				rootBomActual.children.each { child->
					String key = child.prod.prodBase.toString()+" (${child.unit})"
					
					CompGetNote compGetNote = CompGetNote.findByNoteCodeAndProdBase(noteCode, child.prod.prodBase)
					if (!compGetNote) {
						compGetNote = new CompGetNote(noteCode:noteCode, prodBase:child.prod.prodBase, quantity:child.quantity, unit:child.unit)
						compGetNote.comment = "${rootBomActual.prodInstruct} 含 ${child.quantity}"
					}
					else {
						compGetNote.quantity = compGetNote.quantity + child.quantity
						compGetNote.comment = compGetNote.comment + "<br>${rootBomActual.prodInstruct} 含 ${child.quantity}"
					}
					
					if (compGetNote.save()) {
						compGetNote.addToProdInstructs(rootBomActual.prodInstruct)
					} else {
						flash.message = "保存领料单出错--> ${child}"
						return
					}
															
					child.children.each {  grandChild->
						
						CompGetNote compGetNote2 = CompGetNote.findByNoteCodeAndProdBase(noteCode, grandChild.prod.prodBase)
						if (!compGetNote2) {
							compGetNote2 = new CompGetNote(noteCode:noteCode, prodBase:grandChild.prod.prodBase, quantity:grandChild.quantity, unit:grandChild.unit)
							compGetNote2.comment = "${rootBomActual.prodInstruct} 含 ${grandChild.quantity}"
						}
						else {
							compGetNote2.quantity = compGetNote2.quantity + grandChild.quantity
							compGetNote2.comment = compGetNote2.comment + "<br>${rootBomActual.prodInstruct} 含 ${grandChild.quantity}"
						}
						
						if (compGetNote2.save()) {
							compGetNote2.addToProdInstructs(rootBomActual.prodInstruct)
						} else {
							flash.message = "保存领料单出错 --> ${grandChild}"
							return
						}						
					}
				}
				
				rootBomActual.prodInstruct.status = CONSTANT.INSTRUCT_STATUS_COMPONENTS_GOT
				rootBomActual.prodInstruct.compGetNoteCode = noteCode
				relatedProdInstList << rootBomActual.prodInstruct
			}
			else {
				flash.message = "没有操作合适的生产单"
			}
		}
						
		def compGetNoteList = CompGetNote.findAllByNoteCode(noteCode, [sort:'prodBase']).asList()
				
		
		/*def componentMap = new TreeMap<String, BigDecimal>()
		def componentMapComment = new TreeMap<String, BigDecimal>()
		def relatedProdInstList = []
		
		bomActualIdList.each { id ->
			def rootBomActual = BomActual.get(id)
			if (rootBomActual) {
				rootBomActual.children.each { child->
					String key = child.prod.prodBase.toString()+" (${child.unit})"
					def existVal = componentMap[key]
					if (existVal) {
						componentMap[key] = child.quantity + existVal
						componentMapComment[key] = componentMapComment[key] + "<br>${rootBomActual.prodInstruct} 含 ${child.quantity}"
					}
					else {
						componentMap.put(key, child.quantity)
						componentMapComment.put(key, "${rootBomActual.prodInstruct} 含 ${child.quantity}")
					}
										
					child.children.each {  grandChild->
						String key2 = grandChild.prod.prodBase.toString()+" (${child.unit})"
						def existVal2 = componentMap[key2]
						if (existVal2) {
							componentMap[key2] = grandChild.quantity + existVal2
							componentMapComment[key2] = componentMapComment[key2] + "<br>${rootBomActual.prodInstruct} 含 ${grandChild.quantity}"
						}
						else {
							componentMap.put(key2, grandChild.quantity)
							componentMapComment.put(key2, "${rootBomActual.prodInstruct} 含 ${grandChild.quantity}")
						}
					}
				}	
				
				mActual.prodInstruct.status = CONSTANT.INSTRUCT_STATUS_COMPONENTS_GOT
				relatedProdInstList << rootBomActual.prodInstruct
			}
			else {
				flash.message = "没有操作合适的生产单"
			}			
		}*/
		
		if (relatedProdInstList.size() == 0) {
			flash.message = "没有操作合适的生产单"
			redirect(action: "list")
			return
		}
				
		//[componentMap:componentMap, componentMapComment:componentMapComment, relatedProdInstList:relatedProdInstList]
		[noteCode:noteCode, compGetNoteList:compGetNoteList, relatedProdInstList:relatedProdInstList]
	}
	
	def showCompGetNote()
	{
		def compGetNoteList = CompGetNote.findAllByNoteCode(params.noteCode)
		render(view: "getComponents", model: [compGetNoteList: compGetNoteList, noteCode:params.noteCode])
	}

    def save() {
        def prodInstructObj = new ProdInstruct(params)
        if (!prodInstructObj.save(flush: true)) {
            render(view: "create", model: [prodInstructObj: prodInstructObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), prodInstructObj.id])
        redirect(action: "show", id: prodInstructObj.id)
    }

    def show(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        [prodInstructObj: prodInstructObj]
    }

    def edit(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

		session.fromController = 'prodInstruct'
		session.fromAction = 'edit'
		session.fromId = id
		
        [prodInstructObj: prodInstructObj]
    }

    def update(Long id, Long version) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodInstructObj.version > version) {
                prodInstructObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodInstruct.label', default: 'ProdInstruct')] as Object[],
                          "Another user has updated this ProdInstruct while you were editing")
                render(view: "edit", model: [prodInstructObj: prodInstructObj])
                return
            }
        }

        prodInstructObj.properties = params

        if (!prodInstructObj.save(flush: true)) {
            render(view: "edit", model: [prodInstructObj: prodInstructObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), prodInstructObj.id])
        redirect(action: "show", id: prodInstructObj.id)
    }

    def delete(Long id) {
        def prodInstructObj = ProdInstruct.get(id)
        if (!prodInstructObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
            return
        }

        try {
            prodInstructObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodInstruct.label', default: 'ProdInstruct'), id])
            redirect(action: "show", id: id)
        }
    }
}
