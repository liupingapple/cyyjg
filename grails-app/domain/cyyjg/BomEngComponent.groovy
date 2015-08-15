package cyyjg

import java.util.Date;

class BomEngComponent {

	Prod prod
	int level
	int seq
	
	BigDecimal engQuantity
	BigDecimal wasteQuantity // 怎么用？
	String unit = '克'
		
	BomEngComponent componentParent
	static hasMany = [componentChildren: BomEngComponent] 
	// componentParent will be assigned if addToComponentChildren() called
	
	static belongsTo = [bomEng: BomEng]
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		bomEng()
		prod()
		level ()
		seq() 
		engQuantity()
		wasteQuantity nullable:true
		unit inList: ['克', '公斤']
		componentParent nullable:true
		componentChildren()
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${level}.${seq}:${bomEng}/${prod}"
	}
}
