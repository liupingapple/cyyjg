import cyyjg.*

class BootStrap {

    def init = { servletContext ->
		/*switch(grails.util.GrailsUtil.isDevelopmentEnv()){
			case "development":
				initProdAndEngBom()
				initUsers()
				break
			default:
				println "do nothing in BootStrap.init!"
		}*/
		
		initProdAndEngBom()
		initUsers()
		initCustomer()
    }
	
    def destroy = {
    }
	
	void initProdAndEngBom()
	{
		println "init Prod and bomEng ..."
		Prod p0 = new Prod(code:'PT－305C', name:'色胶').save(failOnError:true)
		BomEng bomEng = new BomEng(prod:p0, comment:'This is a example of EngBOM for '+p0).save(failOnError:true)
		
		//------ Level-0 done
		
		Prod p1s1 = new Prod(code:'C001', name:'红色半成品', type:'半成品').save(failOnError:true)
		BomEngComponent comp_p1s1 = new BomEngComponent('bomEng': bomEng, prod:p1s1, level:1, seq:1,engQuantity:0.3,unit:'克').save(failOnError:true)
		
		Prod p1s2 = new Prod(code:'CY924', custRefCode:'CY924', name:'白色', type:'半成品').save(failOnError:true)
		BomEngComponent comp_p1s2 = new BomEngComponent('bomEng': bomEng, prod:p1s2, level:1, seq:2,engQuantity:0.21,unit:'克').save(failOnError:true)
		
		bomEng.addToComponents(comp_p1s1)
		bomEng.addToComponents(comp_p1s2)
		
		//----------------- Level-1 done
		
		Prod p2s1 = new Prod(code:'R-001', name:'色粉', type:'原材料').save(failOnError:true)
		BomEngComponent comp_p2s1 = new BomEngComponent('bomEng':bomEng, prod:p2s1, level:2, seq:1,engQuantity:0.1,unit:'克').save()
		comp_p1s1.addToComponentChildren(comp_p2s1)
		
		Prod p2s2 = new Prod(code:'E50', name:'硅胶', type:'原材料').save(failOnError:true)
		BomEngComponent comp_p2s2 = new BomEngComponent('bomEng':bomEng, prod:p2s2, level:2, seq:2,engQuantity:0.2,unit:'克').save()
		comp_p1s2.addToComponentChildren(comp_p2s2)
		
		Prod p2s3 = new Prod(code:' W-001', name:'色粉', type:'原材料').save(failOnError:true)
		BomEngComponent comp_p2s3 = new BomEngComponent('bomEng':bomEng, prod:p2s3, level:2, seq:3,engQuantity:0.2,unit:'克').save()
		comp_p1s2.addToComponentChildren(comp_p2s3)
		
		Prod p2s4 = p2s2
		BomEngComponent comp_p2s4 = new BomEngComponent('bomEng':bomEng, prod:p2s4, level:2, seq:4,engQuantity:0.2,unit:'克').save()
		comp_p1s1.addToComponentChildren(comp_p2s4)
		
		comp_p1s1.save()
		comp_p1s2.save(failOnError:true)
		
		//----------------- Level-2 done
	}
	
	void initUsers()
	{
		println "init users ..."
		new EndUser(code:"user001", userName:"admin", password:"admin", fullName:"AdminUser", privileges:"管理员").save(failOnError:true)
		new EndUser(code:"user002", userName:"order", password:"order", fullName:"OrderInputer", privileges:"订单-新建,订单-查询,订单-修改,订单-删除,订单-确认,订单-取消").save(failOnError:true)
		new EndUser(code:"user003", userName:"prod", password:"prod", fullName:"Producer", privileges:"生产单-*,订单-查询").save(failOnError:true)
		new EndUser(code:"user004", userName:"manager", password:"manager", fullName:"Manager", privileges:"管理员").save(failOnError:true)
	}
	
	void initCustomer()
	{
		println "init initCustomer ..."
		new Customer(code:"cust-1", name:"测试客户-1", abrrName:"客户-1").save(failOnError:true)
		new Customer(code:"cust-2", name:"测试客户-2", abrrName:"客户-2").save(failOnError:true)
	}
}
