<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%> --%>
<!-- ---------------------------<header>--------------------------------------- -->

<header class="header">
	<ul class="gnb">
		<li class="campniclogo" onclick="location.href='/index';">
			<img src="../images/indexlogo.png" width="230px">
		</li>
		<li>
			<a class="place-admin" href="camplist">
				<i class="fa fa-campground"></i>
				캠핑장관리
			</a>
		</li>
		<li>
			<a class="user-admin" href="userlist">
				<i class="fa fa-user-circle"></i>
				<!-- <span style="color: darkmagenta;">캠핑장관리</span> -->
				회원관리
			</a>
		</li>
		<li>
			<a class="board-admin" href="boardlist">
				<i class="fa fa-tasks"></i>
				게시판관리
			</a>
		</li>
		<!-- 
		<li>
			<a class="sns-admin" href="conectSns">
				<i class="fa fa-toggle-on"></i>
				SNS연동관리
			</a>
		</li>
		 
		<li>
			<a class="customer-admin" href="customerCenter">
				<i class="fas fa-chalkboard-teacher"></i>
				고객센터
			</a>
		</li>
		-->
	</ul>
</header>