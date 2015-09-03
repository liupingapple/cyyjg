dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            //dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            //url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			// 可以用浏览器查看DB，主页地址带上： dbconsole
			
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
			
			dbCreate = "create-drop"
			url = "jdbc:mysql://localhost/cyyjg?useUnicode=yes&characterEncoding=UTF-8"
			username = "cyyjg"
			password = "cyyjg"
			
			properties {
				// http://tomcat.apache.org/tomcat-7.0-doc/jdbc-pool.html#Common_Attributes
			   // 初始化N个连接
			   initialSize = 3
			   // 每隔timeBetweenEvictionRunsMillis检查超过空闲minEvictableIdleTimeMillis的连接，注意Tomcat默认设置的session超时时间为30分钟
			   timeBetweenEvictionRunsMillis = 600000
			   minEvictableIdleTimeMillis = 600000
			   testOnBorrow = true
			   validationQuery = "select 1"
			}
			
			//logSql = true
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:cyyjgProdDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
