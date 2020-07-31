<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="btn-area">
	<input type="button" value="수정"> <input type="button"
		value="삭제">
</div>
<b class="commentText">Comments</b>
<div class="Line"></div>
<div class="cmtArea"></div>
<c:if test="${session!=null }">
	<form method="POST" class="comment">
		<div class="cmt-writer">writer</div>
		<textarea cols="80" rows="10"></textarea>
		<input type="submit" value="등록" class="reg-btn">
	</form>
</c:if>
<div class="cmt-area">

	<div class="get-cmt">
		<div class="getCmt-writer">작성자</div>
		<div class="reg-content">기존의 댓글을 불러옴</div>
		<input type="button" value="삭제" class="del-btn">
	</div>

</div>


