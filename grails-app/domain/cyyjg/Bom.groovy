package cyyjg

abstract class Bom implements java.lang.Comparable {

	Prod prod
	
	/**
	 * Standard BOM is begin with S, produce BOM is begin with P. Take a standard BOM example
	 * 
	 *                S
	 *        S1______|_____S2
	 *  S11___|___S12   S21__|___S22
	 *
	 */	
	String mark
	
	
	BigDecimal quantity  //如果是标准BOM，则为标准用量，如果是生产BOM，则为实际用量
	String unit = '克'
		
	//---------------------------------
	// NOTE: below definition will not create joinTable bom_children, while parent will be used to maintain the hasMany children relationshipe
	Bom parent  // or we can use blongsTo
	SortedSet<Bom> children
	static hasMany = [children: Bom] 	
	// If call bom.addToChildren(child), bom.save() will trigger child.save() although child.save is not called,
	// and child.parent will be set back with bom, see http://grails.github.io/grails-doc/2.1.0/ref/Domain%20Classes/addTo.html
	//---------------------------------
	
	String comment
	
	Date dateCreated
	Date lastUpdated
	
	// we must specify below mappedBy, otherwise the one-many relationship will be broken by rootBom property if rootBom is defined
	// Bom rootBom
	static mappedBy = [children:'parent']  // parent.addToChildren(child) will set child's parent value indirectly
	
	static mapping = {
		tablePerHierarchy true
	}
			
    static constraints = {		
		prod ()
		mark(nullable:false, maxSize:9)
		quantity(nullable:true)
		unit inList: cyyjg.CONSTANT.UNITs
		parent nullable:true
		children()
		comment nullable:true, maxSize:1000
    }
	
	@Override
	String toString() {
		"${mark}:${prod}"
	}
	
	@Override
	int compareTo(obj) {
		if (obj) {
			return mark.compareTo(((Bom)obj).mark)
		} else {
			return -1
		}
	}
		
}
