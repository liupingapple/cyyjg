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
		
		initCustomer()
		
		initProdAndEngBom()
		initUsers()
		
		initOthers()
    }
	
    def destroy = {
    }
	
	void initProdAndEngBom()
	{
		println "init Prod and bomStd ..."
		
		Customer cust = Customer.findByCode('Cust1')
		
		new ProdGroup(name:"硅胶").save()
		new ProdGroup(name:"色母").save()

		def pbase1 = new ProdBase(code:"305C", name:"色母C", stdPrice:5).save(failOnError:true)
		def pbase2 = new ProdBase(code:"C001", name:"红色半成品", type:'半成品', stdPrice:2).save(failOnError:true)
		def pbase3 = new ProdBase(code:"CY924", name:"白色半成品", type:'半成品', stdPrice:4).save(failOnError:true)
		def pbase4 = new ProdBase(code:"R-001", name:"色粉", type:'原材料', stdPrice:7).save(failOnError:true)
		def pbase5 = new ProdBase(code:"E50", name:"硅胶E50", type:'原材料', stdPrice:8).save(failOnError:true)
		def pbase6 = new ProdBase(code:"W-001", name:"色粉W", type:'原材料', stdPrice:3).save(failOnError:true)

		Prod p0 = new Prod(code:"${cust.code}-305C", custRefCode:"${cust.code}-305C", cust:cust, prodBase:pbase1).save(failOnError:true)
		BomStd bomP0 = new BomStd(prod:p0, mark:'S', quantity:1, unit:'千克', comment:"This is a example of EngBOM for ${p0}").save(failOnError:true)
		p0.save()
		//------ Level-0 done
		
		Prod p1s1 = Prod.findByCode(pbase2.code) // new Prod(code:'C001', prodBase:pbase2).save(failOnError:true)
		BomStd comp_p1s1 = new BomStd(prod:p1s1, mark:'S1', quantity:300, unit:'克').save(failOnError:true)
		
		Prod p1s2 = Prod.findByCode(pbase3.code) // new Prod(code:'CY924', custRefCode:'CY924', prodBase:pbase3).save(failOnError:true)
		BomStd comp_p1s2 = new BomStd(prod:p1s2, mark:'S2', quantity:700, unit:'克').save(failOnError:true)
		
		bomP0.addToChildren(comp_p1s1)
		bomP0.addToChildren(comp_p1s2)
				
		//----------------- Level-1 done
		
		Prod p2s1 = Prod.findByCode(pbase4.code) // new Prod(code:'R-001', prodBase:pbase4).save(failOnError:true)
		BomStd comp_p2s1 = new BomStd(prod:p2s1, mark:'S11', quantity:100, unit:'克').save()
		comp_p1s1.addToChildren(comp_p2s1)
		
		Prod p2s2 = Prod.findByCode(pbase5.code) // new Prod(code:'E50', prodBase:pbase5).save(failOnError:true)
		BomStd comp_p2s2 = new BomStd(prod:p2s2, mark:'S21', quantity:200, unit:'克').save(failOnError:true)
		comp_p1s2.addToChildren(comp_p2s2)
		
		Prod p2s3 = Prod.findByCode(pbase6.code) // new Prod(code:' W-001', prodBase:pbase6).save(failOnError:true)
		BomStd comp_p2s3 = new BomStd(prod:p2s3, mark:'S22', quantity:500, unit:'克').save(failOnError:true)
		comp_p1s2.addToChildren(comp_p2s3)
		
		Prod p2s4 = p2s2
		BomStd comp_p2s4 = new BomStd(prod:p2s4, mark:'S12', quantity:200, unit:'克').save(failOnError:true)
		comp_p1s1.addToChildren(comp_p2s4)
		
		comp_p1s1.save(failOnError:true)
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
		// virtual customer, just used for top-level prod
		new Customer(code:"0", name:"内部", abrrName:"0", buyer:"0", buyerPhone:"00000000000", deliveryAddr1:"0").save(failOnError:true)
		new Customer(code:"Cust1", name:"测试客户1", abrrName:"客户1", buyer:"小王", buyerPhone:"18943238898", deliveryAddr1:"北京市海淀区").save(failOnError:true)
		new Customer(code:"Cust2", name:"测试客户2", abrrName:"客户2", buyer:"小马", buyerPhone:"13643230987", deliveryAddr1:"深圳市南山区").save(failOnError:true)
	}
	
	void initOthers()
	{
		println "init others ..."
		new SaleOrderSource(code:'A', sourceType:'销售员').save(failOnError:true)
		new SaleOrderSource(code:'B', sourceType:'客户联系采购员采购').save(failOnError:true)
		new SaleOrderSource(code:'C', sourceType:'客户联系老板采购').save(failOnError:true)
		
	}
}
