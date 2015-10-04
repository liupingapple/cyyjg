package cyyjg

import javassist.bytecode.stackmap.BasicBlock.Catch;

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
		flash.message = ""
		
		def bomRoot = cyyjg.Utils.getRootBom(BomActual.get(id))
		
		// check the quantity of children
		def childTotalQuantity = 0
		
		bomRoot.children.each { child ->
			childTotalQuantity += child.quantity
			
			def grandChildTotalQuantity = 0
			child.children.each { grandChild ->
				grandChildTotalQuantity += grandChild.quantity
			}
			
			if (child.quantity != grandChildTotalQuantity) {
				flash.message += "${child}的数量与其所有下级组成成分数量之和不一致！<br>"
			}
		}
		
		if (bomRoot.quantity*1000 != childTotalQuantity) {
			flash.message += "${bomRoot}的数量与其所有下级组成成分数量之和不一致！<br>"
		}
		
		if (!flash.message) {
			bomRoot?.prodInstruct?.status = CONSTANT.INSTRUCT_STATUS_CONFIRMED
			bomRoot?.prodInstruct?.save(failOnError:true)
		}
						
		redirect(action: "edit", id: id)
	}
	
	def prodInstProduced(Long id)
	{
		def bomRoot = cyyjg.Utils.getRootBom(BomActual.get(id))
		
		bomRoot?.prodInstruct?.status = CONSTANT.INSTRUCT_STATUS_PRODUCED
		bomRoot?.prodInstruct?.produceFinishedDate = new Date()
		bomRoot?.prodInstruct?.save(failOnError:true)
		
		bomRoot.batch = bomRoot?.prodInstruct?.produceFinishedDate.toString()
		
		SaleOrderLine orderLine = bomRoot?.prodInstruct?.saleOrderLine
		
		Delivery delivery = new Delivery(code:"S"+bomRoot?.prodInstruct?.code, prodInstruct:bomRoot?.prodInstruct, 
			addr:orderLine?.saleOrder?.cust?.deliveryAddr1,contact:orderLine?.saleOrder?.cust?.buyer, 
			contactPhone:orderLine?.saleOrder?.cust?.buyerPhone).save(failOnError:true)
			
		if (delivery) {
			flash.message = "生产单已经完成，生成送货单: ${delivery}"
		} else {
			flash.message = "生产单已经完成，生成送货单失败"
		}
				
		redirect(action: "edit", id: id)
	}
		
	def prodInstSplit(Long id)
	{		
		def bomRoot = cyyjg.Utils.getRootBom(BomActual.get(id))
		println "prodInstSplit, bomRoot: ${bomRoot}"
		
		def splitQuantity = Integer.parseInt(params["split_quantity"])
		def remainQuantity = bomRoot.quantity - splitQuantity
		
		def splitRate = splitQuantity/bomRoot.quantity
		def remainRate = remainQuantity/bomRoot.quantity
						
		ProdInstruct remainProdInst = bomRoot.prodInstruct
		
		
		// 事物处理
		ProdInstruct.withTransaction { status ->
			ProdInstruct splitProdInst = new ProdInstruct(code:remainProdInst.code+"X",
				saleOrderLine:remainProdInst.saleOrderLine, lastOne:remainProdInst.lastOne)
			
			BomActual splitBomRoot = null
			
			if (splitProdInst.save()) {
				splitBomRoot = new BomActual(prodInstruct:splitProdInst, refBomStdId:bomRoot.refBomStdId, modifiedBy:session.user,
				prod:bomRoot.prod, mark:bomRoot.mark, quantity:splitQuantity, unit:'千克')
	
				if (splitBomRoot.save()) {
					bomRoot.children.each { child->
	
						def splitChildQuantity = splitRate * child.quantity
						def p_child = new BomActual(prod:child.prod, mark:child.mark, quantity:splitChildQuantity, prodInstruct:splitProdInst,
						refBomStdId:child?.refBomStdId, modifiedBy:session.user, unit:child?.unit).save(flush:true)
	
						splitBomRoot.addToChildren(p_child)
						splitBomRoot.save(flush:true)
	
						child.children.each { grandChild ->
							def splitGrandChildQuantity = splitRate * grandChild.quantity
							def p_grandChild = new BomActual(prod:grandChild.prod, mark:grandChild.mark,
							quantity:splitGrandChildQuantity, prodInstruct:splitProdInst, refBomStdId:grandChild.refBomStdId, modifiedBy:session.user,
							unit:grandChild?.unit).save(flush:true)
	
							p_child.addToChildren(p_grandChild)
							p_child.save(flush:true)
						}
					}
					
				} else {
					flash.message = "1- 错误！Failed to split BOM ${bomRoot}"
					status.setRollbackOnly()
				}
			} else {
				flash.message = "2 - 错误！Failed to split BOM ${bomRoot}"
				status.setRollbackOnly()
			}
			
			if (splitBomRoot?.save()) {
				bomRoot.children.each { child ->
					child.children.each { grandChild ->
						grandChild.quantity = remainRate * grandChild.quantity
					}
					child.quantity = remainRate * child.quantity
				}
				bomRoot.quantity = remainRate * bomRoot.quantity
				bomRoot.save()
			}
			else {
				flash.message = "3 - 错误！Failed to split BOM ${bomRoot}"
				status.setRollbackOnly()
			}
		}
							
		redirect(action: "edit", id: id)
	}
}
