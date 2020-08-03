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
			<h1 class="title-style">캠핑&여행 후기</h1>
			<div class="bgimgWrap">
				<div class="backgroundimg"></div>
			</div>
		</div>
	</c:if>
</div>	
<div class="board-backput contentWrap" type="hidden" value="${param.cate }">
	<c:if test="${sessionScope.userName!=null}">
		<form action="/board/reg" method="get">
         <input type="button" value="글쓰기"  class="regbtn" onclick="location.href='reg?cate=${param.cate}'"> 
            <input type="hidden" value="${param.cate }">
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
			<c:if test="${param.cate =='free' }">
			<tbody class="tbodyfont-style">
				<c:forEach var="free" items="${boardList}">
					<fmt:formatDate var="dateTempParse"
						pattern="yyyy-MM-dd" value = "${free.regDate}"/>
					<tr>
						<td>${free.id }</td>
						<td><a style="text-indent: 1em;" href="detail?cate=${param.cate}&id=${free.id}">${free.title }</a></td>
						<td>${free.writer }</td>
						<td>${dateTempParse}</td>
						<td>${free.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
			</c:if>

			<c:if test="${param.cate =='review' }">
				<tbody class="tbodyfont-style">
					<c:forEach var="review" items="${reviewBoardList}">
						<fmt:formatDate var="dateTempParse2" pattern="yyyy-MM-dd"
							value="${review.regDate}" />
						<tr>
							<td>${review.id }</td>
							<td><a style="text-indent: 1em;"
								href="detail?cate=${param.cate}&id=${review.id}">${review.title }</a></td>
							<td>${review.writer }</td>
							<td>${dateTempParse2}</td>
							<td>${review.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>


		</table>
	</div>
	<div class="text-center">
		<ul class="pagination">

			<c:if test="${param.cate =='free' }">
				<li><a href=?cate=free&index=1><</a></li>
				<c:forEach var="i" begin="${startPage}" end="${lastPage}">

					<c:if test="${i==param.index}">
						<li><a class="orange" href="?cate=free&index=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i!=param.index}">
						<li><a class="" href="?cate=free&index=${i}">${i}</a></li>
					</c:if>

				</c:forEach>
				<li><a href=?cate=free&index=${lastPage}>></a></li>
			</c:if>

		


			<c:if test="${param.cate =='review' }">
				<li><a href=?cate=review&index=1><</a></li>
				<c:forEach var="i" begin="${reviewStartPage}" end="${reviewLastPage}">

					<c:if test="${i==param.index}">
						<li><a class="orange" href="?cate=review&index=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i!=param.index}">
						<li><a class="" href="?cate=review&index=${i}">${i}</a></li>
					</c:if>

				</c:forEach>
				<li><a href=?cate=review&index=${reviewLastPage}>></a></li>
			</c:if>

			<c:if test="${param.cate =='review' }">
			</c:if>
			<!-- 	<li><a href="">1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li><a href="">5</a></li> -->
		</ul>
	</div>

</div>
