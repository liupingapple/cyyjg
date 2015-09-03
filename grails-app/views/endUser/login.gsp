<%@ page import="cyyjg.EndUser"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bmain">
<g:set var="entityName" value="${message(code: 'endUser.label', default: ' ')}" />
<title><g:message code="登录" args=" " />- CYYGJ</title>

	<style type="text/css">
		body {
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #eee;
		}
		
		.form-signin {
		  max-width: 330px;
		  padding: 15px;
		  margin: 0 auto;
		}
		.form-signin .form-signin-heading,
		.form-signin .checkbox {
		  margin-bottom: 10px;
		}
		.form-signin .checkbox {
		  font-weight: normal;
		}
		.form-signin .form-control {
		  position: relative;
		  height: auto;
		  -webkit-box-sizing: border-box;
		     -moz-box-sizing: border-box;
		          box-sizing: border-box;
		  padding: 10px;
		  font-size: 16px;
		}
		.form-signin .form-control:focus {
		  z-index: 2;
		}
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
	</style>
	
</head>
<body>
	<div class="container" role="main">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-warning my-panel-login">
					<div class="panel-heading">
						<h3 class="panel-title">欢迎光临CYYJG系统</h3>
					</div>
					<div class="panel-body">
						<g:if test="${flash.message}">
							<div class="message">${flash.message}</div>
						</g:if>
					
						<g:form name="signin_form" class="form-signin" action="authenticate" method="post">
							<h3 class="form-signin-heading">请登录</h3> <!-- class sr-only 会隐藏-->
							<label for="inputEmail">User Name</label> 
							<!-- not to use type="email" -->
							<input type="text" name="userName" 
								class="form-control" placeholder="User Name" required autofocus> 
							<label for="inputPassword">Password</label> 
								<input type="password" name="password"
								class="form-control" placeholder="Password" required>
								
							<div class="checkbox">
							  <label>
							    <input name="rememberMe" type="checkbox" value="remember-me" checked="checked"> Remember me
							  </label>
							</div>
							<button class="btn btn-lg btn-primary btn-block" id="signin" type="submit">Sign in</button>
						</g:form>
					</div>
					<div class="panel-footer">&nbsp;</div>
				</div>
			</div>
			<!-- End: panel panel-warning -->
			<div class="col-md-3"></div>
		</div>
	</div>
	<!-- End: MAIN CONTENT -->
	
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.cookie.js')}"></script>
	<script type="text/javascript">		
		$(function() {			
			if ($.cookie("cyyjg_userName") != 'null') {
				$("[name='userName']").attr("value", $.cookie("cyyjg_userName"))
			}

			if ($.cookie("cyyjg_password" != 'null')) {
				$("[name='password']").attr("value", $.cookie("cyyjg_password"))
			}

			// doesn't work, why?
			/*$("[name='userName']").change("propertychange", function(){
					$("[name='password']").attr("value","");
				}				
			);*/
			
			$($("[name='signin_form']")).submit(function(){
				if ($("[name='rememberMe']").is(':checked')) {
					$.cookie("cyyjg_userName", $("[name='userName']").val(), {expires:200, path: '/cyyjg'});  
					$.cookie("cyyjg_password", $("[name='password']").val(), {expires:200, path: '/cyyjg'}); 										
				} else {
					$.cookie("cyyjg_userName",null); 
					$.cookie("cyyjg_password",null); 
				}
			});
		});
	</script>
</body>
</html>
