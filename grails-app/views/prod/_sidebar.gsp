<div id="sidebar-wrapper">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><g:message code="default.manage.label" args="[entityName]" /></li>
		<%--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
		--%>
		<li><g:link action="create"><g:message code="default.create.label" args="[entityName]" /></g:link>
		<li><g:link action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
		</li>
		
		<li>
			<g:if test="${session.fromController}">
				<g:link class="glyphicon glyphicon-arrow-left" controller="${session.fromController}" action="${session.fromAction}" id="${session.fromId }">
					${session.fromController}/${session.fromAction}/${session.fromId }
				</g:link>
			</g:if>
		</li>
		
		<li>
			<g:if test="${session.fromController2}">
				<g:link class="glyphicon glyphicon-arrow-left" controller="${session.fromController2}" action="${session.fromAction2}" id="${session.fromId2 }">
					${session.fromController2}/${session.fromAction2}/${session.fromId2 }
				</g:link>
			</g:if>
		</li>
		
	</ul>
		
</div>