package cyyjg

class Utils {
	
	static boolean isRootBom(Bom bom) {
		// sometimes when create new child, before it added into parent, its !bom.parent==true, so we add more condition to verify mark
		!bom?.parent && (bom?.mark == "S" || bom?.mark == "P" )
	}
	
	static Bom getRootBom(Bom bom)
	{
		if (!bom.parent) {
			return bom
		}
		else if (!bom.parent.parent){
			return bom.parent
		}
		else if (!bom.parent.parent.parent) {
			return bom.parent.parent
		}
		else {
			return null
		}
	}
	
	static Prod getRootProd(Bom bom)
	{
		getRootBom(bom)?.prod
	}
	
	static String generateProdCustRefCode(Customer cust, ProdBase prodBase)
	{
		cust.code+"-"+prodBase.code
	}
}
