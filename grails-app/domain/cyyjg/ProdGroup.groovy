package cyyjg

import java.util.Date;

class ProdGroup {
	
	String name
	
	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		name nullable:true
    }
	
	@Override
	String toString() {
		name
	}
}
