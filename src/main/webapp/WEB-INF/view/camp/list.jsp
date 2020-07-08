<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer src="/js/list/scroll.js"></script>
<nav class="region-list">
	<li><a href="list?reg=se">서울</a></li>
	<li><a href="list?reg=gg">경기도</a></li>
	<li><a href="list?reg=kw">강원도</a></li>
	<li><a href="list?reg=gs">경상도</a></li>
	<li><a href="list?reg=jl">전라도</a></li>
	<li><a href="list?reg=cc">충청도</a></li>
	<li><a href="list?reg=jj">제주도</a></li>
</nav>
<!-- 캠핑장 찾기누르자마자 나오는 화면  -->
<c:if test="${list == null }">
</c:if>

<!-- 지역별 캠핑장을 찾을 때  -->
<c:if test="${list!=null }">
	<c:forEach var="camp" items="${list }">
		<section class="list">
			<div class="list-container">
				<div class="img">
					<img class="image" src="/images/${camp.img1 }" width="200"
						height="150">
				</div>
				<div class="content-container">
					<div class="title">
						<a href="detail?id=${camp.id }">${camp.name }</a>
					</div>
					<div class="local" style="color: rgb(0, 140, 236);">${camp.address }</div>
					<div class="comfor">${camp.faclity }</div>
				</div>
				<div class="icon-list">
					<div class="icons">
						<div class="icon">
							<i class="fas fa-map-marker-alt"></i> <span>지도</span>
						</div>
					</div>
					<div class="icons">
						<div class="icon">
							<i class="fas fa-book"></i> <span>예약</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="inner"></section>
	</c:forEach>
</c:if>