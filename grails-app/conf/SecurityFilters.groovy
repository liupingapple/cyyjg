
class SecurityFilters {
		
	def filters = {
		// At any Controllers and Actions, if NO user log in, just redirect to login page
		// Please note, if we do redirect in views/index.gsp, the redirect will trigger below check again and throw exception
		loginCheck(controller: '*', action: '*') {
			before = {		
				if (!session.user && actionName != "login" && actionName != "authenticate") {
					flash.message = "请先登录!"
					// println "controllerName is: ${controllerName}, actionName is: ${actionName}"
					redirect(controller: "endUser", action: "login")
					
					if (actionName) {
						return false // must return false if actionName has value, otherwise will get CannotRedirectException - A previous call to redirect(..) has already redirected the response.
					} else {						
						// do nothing or return true if no actionName  // don't return false, otherwise, we will get 'HTTP Status 404 - "/index.gsp" not found..' for /cyyjg
					}
				}
			}
		}
		
		// in product, we will use: controller: '(endUser|prod|prodGroup|prodCust|bomEng|Customer)', action: '(create|edit|update|delete|save)'
		adminCheck(controller: '(endUser|prod|prodGroup|prodCust|bomEng|Customer)', action: '(delete)') {
			before = {
				if (session.user && !session.user.privileges.contains("管理员")) {
					flash.message = "您没有权限这么操作，只有管理员才可以进行操作!"
					redirect(action: "list")
					return false
				}
			}
		}
	}
	
}
