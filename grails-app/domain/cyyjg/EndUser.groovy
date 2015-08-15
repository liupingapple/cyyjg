package cyyjg

class EndUser {
	String code // 员工编号
	String userName
	String password
	
	String fullName
	String position // 职位
	
	String privileges // e.g: 订单-*,生产单-查询,
	
	Date onBoardDate // 入职时间
	
	Date lastAccessDate // 最近登录日期
	
	String comment

	Date dateCreated
	Date lastUpdated
	
    static constraints = {
		code unique:true
		userName unique:true
		password()
		fullName ()
		position(nullable:true)
		privileges(nullable:true, blank:true)
		onBoardDate nullable:true
		lastAccessDate nullable:true
		
		comment nullable:true, maxSize:1000
    }
	
	def beforeInsert = {
		password = password.encodeAsSHA()
	}
	
	/* Please don't do below, password will be updated although user.save() with no change of password!!!
	def beforeUpdate = {
		password = password.encodeAsSHA()
	}*/
	
	String toString(){
		"${userName}(${fullName})"
	}
}
