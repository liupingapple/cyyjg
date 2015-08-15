package cyyjg

class LoginTagLib {
	def loginControl = {
		if(request.getSession(false) && session.user){
			// out << "${session.user.fullName} - " // fix for bootstrap
			out << """${link(action:"logout", controller:"endUser"){""+"[${session.user.fullName} - "+"退出]"}}"""
		} else {
			// out << """[${link(action:"login", controller:"adminUser"){"Login"}}]"""
			out << "<g:link uri='/'/>"
		}
	}
	
	def preference = {
		if(request.getSession(false) && session.user){
			out << """${link(action:"show", controller:"endUser", id:"$session.user.id"){"设置"}}"""
		}
	}
}