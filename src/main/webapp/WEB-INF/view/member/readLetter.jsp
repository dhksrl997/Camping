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
			<div
				style="text-align: center; font-size: 40px; margin-bottom: 20px;">${c.name }</div>
			<div class="letter-form">
				<div class="member-profile">${c.content }</div>
				<div class="letter-date">${modifiTempParse}</div>
			</div>
		<c:if test="${status!= null }">
			<input type="button" value="답장" class="response" onclick="location.href='responseLetter?id=${c.id}'">
		</c:if>
		</c:forEach>
	</section>
	<script defer src="/js/member/editProfile.js"></script>
</main>