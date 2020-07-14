<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!-- ---------------------------<header>--------------------------------------- -->
<section id="header" class="header" >
	<div class="header_logo">
		<a class="aside-button" href=""> <i class="fas fa-bars sidemenu"></i></a>
		<a href="/index"><img class="logo" src="../images/indexlogo.png"
			width="230px" alt="campnic_logo"></a>
	</div>
	<ul class="header_menu">
		<form action="/camp/list">
			<input class="search-field" name="query" type="text" style="color: black;">
			<input type="submit" value="" style="display:none;">
		</form>
		<i class="fas fa-search search-icon"></i>
		<a href="/member/join"><li>회원가입</li></a>
		<a href="/member/login"><li>로그인</li></a>
	</ul>
</section>




