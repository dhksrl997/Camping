<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Campnic</title>
<main>
	<div class="login">
	<div class="login-form">
		<h1>Login</h1>
		<form method="post">
			<input type="text" name="username" autocomplete="off" placeholder="Username"
				required="required" /> <input type="password" name="password"
				placeholder="Password" required="required" />
			<button type="submit" class="btn btn-primary btn-block btn-large">Let
				me in.</button>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    <font style="margin-top:5px;"color="red">
        <p>로그인 실패!!</p>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    </font>
</c:if>
		</form>
	</div>
</div>


</main>