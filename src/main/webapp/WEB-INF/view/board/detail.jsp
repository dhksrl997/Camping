<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script defer src="/js/board/detail.js"></script>
<link rel="stylesheet" href="/css/board/detail.css">
<h1 class="slogan">후기</h1>
<c:forEach var="res" items="${result }">
	<div class="content-area">
		<div class="title">${res.title }</div>
		<div class="info">
			<div>
				<div class="writer">작성자 : ${res.writer }</div>
			</div>
			<div>
				<div class="hit">조회수 : ${res.hit }</div>
			</div>
			<div>
				<div class="Date">작성일자 : ${res.regDate }</div>
			</div>
		</div>

		<div class="review-content">${res.content }</div>
	</div>
</c:forEach>

<b class="commentText">Comments</b>
<div class="Line"></div>
<div class="cmtArea"></div>
<form method="POST" class="comment">
	<div class="cmt-writer">${sessionScope.userId }</div>
	<textarea cols="80" rows="10" name="content" class="cmt-content"></textarea>
	<input type="submit" value="등록" class="reg-btn">
</form>
<div class="cmt-area">
	<c:forEach var="l" items="${lists}">
		<fmt:formatDate var="dateTemp" pattern="yyyy-MM-dd"
			value="${l.regDate}" />
		<div class="get-cmt">
			<div class="getCmt-writer">${l.writer}</div>
			<div class="reg-content">${l.content }</div>
			<div class="reg-Date">${dateTemp }</div>
			<s:authorize access="hasRole('ROLE_ADMIN')">
				<input type="button" value="삭제" class="del-btn" data-rno="${l.id }">
			</s:authorize>
			<c:if
				test="${sessionScope.userId == l.writer&&sessionScope.userId ne 'admin'}">
				<input type="button" value="삭제" class="del-btn" data-rno="${l.id }">
			</c:if>
		</div>
	</c:forEach>
</div>

