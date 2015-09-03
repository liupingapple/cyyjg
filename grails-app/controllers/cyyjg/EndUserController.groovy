package cyyjg

import org.springframework.dao.DataIntegrityViolationException

class EndUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	/* No need to use beforeInterceptor anymore, we use conf/SecurityFilters mechanism for authentication
	def beforeInterceptor = [action:this.&checkUser, except: [
		'login',
		'logout',
		'authenticate',
		'create',
		'save'
	]]

	def checkUser() {
		if (!session.user) {
			// i.e. user not logged in
			redirect(controller:'endUser',action:'login')
			return false
		}		
	}*/
	
	def login = {		
		// do nothing, just redirect to login.gsp. The button "Sign in" will trigger authenticate action 
	}
	
	def logout = {
		if (session.user) {
			flash.message = "再见, ${session.user?.fullName}"
		} else {
			flash.message = "再见!"
		}
		
		// clear session store attr...
		session.user = null
				
		redirect(controller:'endUser', action:"login")
	}
	
	def authenticate = {
		def user = EndUser.findByUserName(params.userName)
		if(user){
			if (user.password == params.password?.encodeAsSHA()) {
			
				user.lastAccessDate = new Date()
				
				session.user = user
				
				flash.message = "您好, ${user.fullName}!"
				
				redirect(controller:"saleOrder", action:"list")
			} else {
				flash.message = "${params.userName}， 密码错误，请重试."
				redirect(action:"login")
			}
		
		} else {
			flash.message = "没有该用户 ${params.userName}，请重试."
			redirect(action:"login")
		}
	}
	
	def index() {
		redirect(action: "list", params: params)
	}

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [endUserObjList: EndUser.list(params), endUserObjTotal: EndUser.count()]
    }

    def create() {
        [endUserObj: new EndUser(params)]
    }

    def save() {
        def endUserObj = new EndUser(params)
				
        if (!endUserObj.save(flush: true)) {
            render(view: "create", model: [endUserObj: endUserObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'endUser.label', default: 'EndUser'), endUserObj.id])
        redirect(action: "show", id: endUserObj.id)
    }

    def show(Long id) {
        def endUserObj = EndUser.get(id)
        if (!endUserObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        [endUserObj: endUserObj]
    }

    def edit(Long id) {
        def endUserObj = EndUser.get(id)
        if (!endUserObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        [endUserObj: endUserObj]
    }

    def update(Long id, Long version) {
        def endUserObj = EndUser.get(id)
        if (!endUserObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }
		
		if (endUserObj != session.user) {
			flash.message = "您不能修改别的用户的信息"
			redirect(action: "list")
			return
		}

        if (version != null) {
            if (endUserObj.version > version) {
                endUserObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'endUser.label', default: 'EndUser')] as Object[],
                          "Another user has updated this EndUser while you were editing")
                render(view: "edit", model: [endUserObj: endUserObj])
                return
            }
        }
		
		if (params.password && params.password != endUserObj.password) {
			params.password = params.password.encodeAsSHA()
		}

		if (!params.password) {
			params.remove("password")
		}
        endUserObj.properties = params
		
        if (!endUserObj.save(flush: true)) {
            render(view: "edit", model: [endUserObj: endUserObj])
            return
        }
				
        flash.message = message(code: 'default.updated.message', args: [message(code: 'endUser.label', default: 'EndUser'), endUserObj.id])
        redirect(action: "show", id: endUserObj.id)
    }

    def delete(Long id) {
        def endUserObj = EndUser.get(id)
        if (!endUserObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
            return
        }

        try {
            endUserObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'endUser.label', default: 'EndUser'), id])
            redirect(action: "show", id: id)
        }
    }
}
