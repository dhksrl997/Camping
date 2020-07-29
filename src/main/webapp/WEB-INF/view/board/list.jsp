<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/list.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script defer src="/js/board/list.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="list-title">
	<!-- <span class="list-message1">캠핑족</span> <span class="list-message2">수다쉼터</span> -->
	<span class="list-message3"><i class="fas fa-caravan"></i></span> <span
		class="list-message4"><i class="fas fa-caravan"></i></span>
	<!-- <img style="margin:auto;" src="../../images/list.jpg" width='50%' height='500px' />  -->
</div>

<c:if test="${param.cate =='free' }">
	<h1 style="text-align: center;">자유 게시판</h1>
</c:if>
<c:if test="${param.cate =='review' }">
	<h1 style="text-align: center;">후기 게시판</h1>
</c:if>


<div class="board-background">
	<c:if test="${sessionScope.userName!=null}">
		<form action="/board/reg" method="post">
			<input type="button" value="글쓰기" onclick="location.href='reg'"
				style="margin-left: 77%; margin-bottom: 20px;"> <input
				type="hidden" value="${param.cate }">
		</form>
	</c:if>
	<div class="table-box">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${content }">
					<tr>
						<td>${l.id }</td>
						<td><a href="detail?cate=${param.cate}&id=${l.id}">${l.title }</a></td>
						<td>${l.writer }</td>
						<td>${l.regDate }</td>
						<td>${l.hit }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="">1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li><a href="">5</a></li>
		</ul>
	</div>

</div>
