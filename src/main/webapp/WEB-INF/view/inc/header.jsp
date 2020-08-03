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
	<ul class="header-menu">
		<form action="/camp/list">
			<input class="search-field" name="query" type="text" style="color: black;">
			<input type="submit" value="" style="display:none;">
		</form>
		<i class="fas fa-search search-icon"></i>
		<s:authorize access="isAuthenticated()">
		<!-- 메시지 알림이 왔을 때 뜨는 new 아이콘 -->
        
        <c:if test="${sessionScope.isRead!=0}">
         <img class="message-new" src="/images/new.png" width="22px"/>
		</c:if>
			<li class="header-login"><a class="header-name">${sessionScope.userName}</a></li>
		</s:authorize>
		

		<s:authorize access="isAnonymous()">
		<li><a href="/member/join">회원가입</a></li>
			<li><a href="/member/login">로그인</a></li>
		</s:authorize>
	</ul>
		<ul class="header-mypage" style="background-color:black; color:white">
			<li><a href="/member/editProfile">정보수정</a></li>
			<li><a href="/member/letters" style="text-decoration: none;">쪽지함</a></li>
			<s:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="/admin/camplist">관리자페이지</a></li>
		</s:authorize>
			<li><a href="/member/logout">로그아웃</a></li>
		</ul>
</section>