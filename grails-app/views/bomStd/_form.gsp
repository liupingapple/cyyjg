<%@page import="cyyjg.Utils"%>
<%@ page import="cyyjg.BomStd" %>

<!--主要样式-->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bom_tree_style.css')}" type="text/css"/>	

<script type="text/javascript">
$(function(){
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '折叠');
    $('.tree li.parent_li > span').on('click', function (e) {
        // only click the label will trigger the event
        if ($(this).children('label').length > 0) {
        	var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', '展开').find(' > i').addClass('glyphicon glyphicon-plus').removeClass('glyphicon glyphicon-minus');
            } else {
                children.show('fast');
                $(this).attr('title', '折叠').find(' > i').addClass('glyphicon glyphicon-minus').removeClass('glyphicon glyphicon-plus');
            }
            e.stopPropagation();
        }
        
    });

    $(".tree span .btn").hide();
    $(".tree li #new_x").hide();
    $(".tree li .just_for_hide").hide();
});

function mouseover(i) {
	$("#btnX"+i).show();
	$("#btnY"+i).show();
	$("#btnZ"+i).show();
}
function mouseout(i) {
	$("#btnX"+i).hide();
	$("#btnY"+i).hide();
	$("#btnZ"+i).hide();
}
function tog(new_xy) {
	$("#"+new_xy).toggle();
}
</script>

<g:set var="rootBom" value="${Utils.getRootBom(bomStdObj) }"></g:set>
<div class="tree">
<ul>
	<li>
		<span>
			<i class="glyphicon glyphicon-minus"></i><label>${rootBom? rootBom:'新...' }</label>	
		</span>		
		<span onmouseover="mouseover(${rootBom.id})" onmouseout="mouseout(${rootBom.id})">
			<g:form>
				<g:render template="fields" model="[bom:rootBom]" contextPath="../bomStd"></g:render> 
				<g:actionSubmit id="btnX${rootBom.id }" class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<%-- <g:actionSubmit class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				<a href="#" id="btnZ${rootBom.id }" class="btn btn-warning btn-xs" onClick="tog('new_x')">增加下级</a>
			</g:form>
		</span>
		
		<ul>
		<g:each in="${rootBom?.children }" var="child" status="i">
				<li>
					<span><i class="glyphicon glyphicon-minus"></i><label>${child }</label>	
						<g:if test="${bomStdObj==child }"><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>&nbsp;</g:if>
					</span>		
					<span onmouseover="mouseover(${child.id})" onmouseout="mouseout(${child.id})">
						<g:form>					
							<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]" contextPath="../bomStd"></g:render>
							<g:actionSubmit id="btnX${child.id }" class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit id="btnY${child.id }" class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							<a href="#" id="btnZ${child.id }" class="btn btn-warning btn-xs" onClick="tog('new_${child.id}')">增加下级</a>
						</g:form>
					</span>
					<ul>
						<g:each in="${child?.children }" var="grandChild" status="ii">
							<li>
								<span>
									<i class="icon-leaf"></i><label>${grandChild }</label>
									<g:if test="${bomStdObj==grandChild }"><span class="glyphicon glyphicon-hand-left" aria-hidden="true"></span>&nbsp;</g:if>
								</span>
								<span onmouseover="mouseover(${grandChild.id})" onmouseout="mouseout(${grandChild.id})">
									<g:form>
										<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]" contextPath="../bomStd"></g:render>
										<g:actionSubmit id="btnX${grandChild.id }" class="btn btn-primary btn-xs" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
										<g:actionSubmit id="btnY${grandChild.id }" class="btn btn-danger btn-xs" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
									</g:form>								
								</span>
							</li>
						</g:each>
							
						<li class="just_for_hide" id="new_${child.id }">
							<span>
								<i class="glyphicon glyphicon-minus"></i>新...
							</span>
							<span onmouseover="mouseover(${-1*child.id})" onmouseout="mouseout(${-1*child.id})">
								<g:form>
								<g:render template="fields" model="[bom:grandChild, parentBomId:child?.id]" contextPath="../bomStd"></g:render>
								<g:actionSubmit id="btnX${-1*child.id }" class="btn btn-warning btn-xs" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />								
								</g:form>
							</span>
						</li>
					</ul>
				</li>
		</g:each>

		<li id="new_x">
			<span>
				<i class="glyphicon glyphicon-minus"></i>新...
			</span>
			<span onmouseover="mouseover(${-1*rootBom.id})" onmouseout="mouseout(${-1*rootBom.id})">
				<g:form>
				<g:render template="fields" model="[bom:child, parentBomId:rootBom?.id]" contextPath="../bomStd"></g:render>
				<g:actionSubmit id="btnX${-1*rootBom.id }" class="btn btn-warning btn-xs" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</g:form>
			</span>
		</li>
		</ul>
		
</ul>
</div>
