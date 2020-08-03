<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>


<main class="editProfile-main">
	<section class="member-information">
		<c:forEach items="${content }" var="c">
			<fmt:formatDate var="modifiTempParse" pattern="MM월dd일"
				value="${c.sendData}" />
			<h1 style="text-align: center;">${c.name }</h1>
			<div class="letter-form">
			<div class="member-profile">${c.content }</div>
			<div class="letter-date">${modifiTempParse}</div>
			</div>
		</c:forEach>
	</section>
	<script defer src="/js/member/editProfile.js"></script>
</main>