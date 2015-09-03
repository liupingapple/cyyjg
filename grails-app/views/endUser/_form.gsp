<%@ page import="cyyjg.EndUser" %>



<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="endUser.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${endUserObj?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="endUser.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${endUserObj?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="endUser.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="endUser.position.label" default="Position" />
		
	</label>
	<g:textField name="position" value="${endUserObj?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'privileges', 'error')} ">
	<label for="privileges">
		<g:message code="endUser.privileges.label" default="Privileges" />
		
	</label>
	<g:textField name="privileges" value="${endUserObj?.privileges}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'onBoardDate', 'error')} ">
	<label for="onBoardDate">
		<g:message code="endUser.onBoardDate.label" default="On Board Date" />
		
	</label>
	<g:datePicker name="onBoardDate" precision="day"  value="${endUserObj?.onBoardDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: endUserObj, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="endUser.comment.label" default="Comment" />
		
	</label>
	<g:textArea name="comment" cols="40" rows="5" maxlength="1000" value="${endUserObj?.comment}"/>
</div>

