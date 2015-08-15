<%@ page import="cyyjg.BomEng" %>



<div class="fieldcontain ${hasErrors(bean: bomEngObj, field: 'prod', 'error')} required">
	<label for="prod">
		<g:message code="bomEng.prod.label" default="Prod" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prod" name="prod.id" from="${cyyjg.Prod.list()}" optionKey="id" required="" value="${bomEngObj?.prod?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bomEngObj, field: 'components', 'error')} ">
	<label for="components">
		<g:message code="bomEng.components.label" default="Components" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bomEngObj?.components?}" var="c">
    <li><g:link controller="bomEngComponent" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bomEngComponent" action="create" params="['bomEng.id': bomEngObj?.id]">${message(code: 'default.add.label', args: [message(code: 'bomEngComponent.label', default: 'BomEngComponent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: bomEngObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bomEng.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${bomEngObj?.comment}"/>
</div>

