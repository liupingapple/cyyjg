package cyyjg

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest;


class ProdBaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prodBaseObjList: ProdBase.list(params), prodBaseObjTotal: ProdBase.count()]
    }

    def create() {
        [prodBaseObj: new ProdBase(params)]
    }

    def save() {
        def prodBaseObj = new ProdBase(params)
        if (!prodBaseObj.save(flush: true)) {
            render(view: "create", model: [prodBaseObj: prodBaseObj])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), prodBaseObj.id])
        redirect(action: "show", id: prodBaseObj.id)
    }

    def show(Long id) {
        def prodBaseObj = ProdBase.get(id)
        if (!prodBaseObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "list")
            return
        }

        [prodBaseObj: prodBaseObj]
    }

    def edit(Long id) {
        def prodBaseObj = ProdBase.get(id)
        if (!prodBaseObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "list")
            return
        }

        [prodBaseObj: prodBaseObj]
    }

    def update(Long id, Long version) {
        def prodBaseObj = ProdBase.get(id)
        if (!prodBaseObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prodBaseObj.version > version) {
                prodBaseObj.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prodBase.label', default: 'ProdBase')] as Object[],
                          "Another user has updated this ProdBase while you were editing")
                render(view: "edit", model: [prodBaseObj: prodBaseObj])
                return
            }
        }

        prodBaseObj.properties = params

        if (!prodBaseObj.save(flush: true)) {
            render(view: "edit", model: [prodBaseObj: prodBaseObj])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), prodBaseObj.id])
        redirect(action: "show", id: prodBaseObj.id)
    }

    def delete(Long id) {
        def prodBaseObj = ProdBase.get(id)
        if (!prodBaseObj) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "list")
            return
        }

        try {
            prodBaseObj.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prodBase.label', default: 'ProdBase'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def uploadImage(Long id) {		
		// the request will be org.springframework.web.multipart.MultipartHttpServletRequest if <form enctype="multipart/form-data">
		def f = request.getFile('myFile')
		if (f.empty) {
			flash.message = '文件不能为空'
			redirect(action: "edit", id: id)
			return
		}
		
		if (f.size > 1024*100 || f.size < 1024*1) {
			flash.message = '文件大小必须小于200K，大于1K'
			redirect(action: "edit", id: id)
			return
		}
				
		def realDir = servletContext.getRealPath("/")+CONSTANT.PROD_IMAGE_DIR
		def orgFileName = ((org.springframework.web.multipart.commons.CommonsMultipartFile)f).originalFilename //fileItem.name; 
		
		def dir = new File(realDir);
		if (!dir.exists()) {
			dir.mkdir()
		}
		
		f.transferTo(new File(realDir+"/"+orgFileName))
								
		redirect(action: "edit", id: id, params:[imageName:orgFileName])
	}
}
