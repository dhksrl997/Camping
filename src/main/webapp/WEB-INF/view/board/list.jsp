<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/board/list.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script defer src="/js/board/list.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="board-headerWrap">
	<c:if test="${param.cate =='free' }">
		<div class="main-background">
			<h1 class="title-style">자유게시판</h1>
			<div class="bgimgWrap">
				<div class="backgroundimg"></div>
			</div>
		</div>
	</c:if>

	<c:if test="${param.cate =='review' }">
		<div class="main-background">
			<h1>후기게시판</h1>
			<div class="bgimgWrap">
				<div class="backgroundimg"></div>
			</div>
		</div>
	</c:if>
</div>	
<div class="board-backput contentWrap" type="hidden" value="${param.cate }">
	<c:if test="${sessionScope.userName!=null}">
		<form action="/board/reg" method="post">
			<input type="button" value="글쓰기" onclick="location.href='reg'"
				style="margin-left: 77%; margin-bottom: 20px;" /> 
		</form>
	</c:if>
	<div class="table-box">
		<table class="table table-bordered table-hover">
			<thead class="thead-style">
				<tr>
					<td style="border-right: white 1px solid;">번호</td>
					<td style="border-right: white 1px solid;">제목</td>
					<td style="border-right: white 1px solid;">글쓴이</td>
					<td style="border-right: white 1px solid;">작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody class="tbodyfont-style">
				<c:forEach var="l" items="${content }">
					<fmt:formatDate var="dateTempParse"
						pattern="yyyy-MM-dd" value = "${l.regDate}"/>
					<tr>
						<td>${l.id }</td>
						<td><a style="text-indent: 1em;" href="detail?cate=${param.cate}&id=${l.id}">${l.title }</a></td>
						<td>${l.writer }</td>
						<td>${dateTempParse}</td>
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
