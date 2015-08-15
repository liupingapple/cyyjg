
class SecurityFilters {
		
	def filters = {
		// At any Controllers and Actions, if NO user log in, just redirect to login page
		loginCheck(controller: '*', action: '*') {
			before = {
				if (!session.user && actionName != "login" && actionName != "authenticate") {
					flash.message = "请先登录!"
					redirect(controller: "endUser", action: "login")
					return false
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
