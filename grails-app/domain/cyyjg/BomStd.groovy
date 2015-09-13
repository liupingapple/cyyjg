package cyyjg

class BomStd extends Bom {
	// No defined
	
	def afterInsert = {
		if (Utils.isRootBom(this)) {
			Prod prod = Prod.get(this.prod.id)
			prod.rootBomStdId = this.id
			// prod.save()
		}
	}
}
