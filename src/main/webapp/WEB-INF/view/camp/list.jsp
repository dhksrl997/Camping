<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer src="/js/list/scroll.js"></script> 
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
	integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
	crossorigin="anonymous">
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
<c:if test="${param.reg == null }">
	<span class="Message">&nbsp;이런 캠핑장은 어때요&nbsp;?</span>
	<div class="container">
		<div class="box-wrap">
			<c:forEach var="r" items="${recommend }">
				<div class="box">
						<a href="detail?id=${r.id }"><img src="/images/${r.img1 }" class="rec-img"></a>
					<div class="name-sec">
						<a href="detail?id=${r.id }"><span class="rec-name"><i class="fas fa-map-signs">&nbsp;&nbsp;${r.name }</i></span></a>
					</div>
					<div class="address-sec">
						<a href="detail?id=${r.id }"><span class="rec-address"> ${r.address } </span></a>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>


</c:if>

<!-- 지역별 캠핑장을 찾을 때  -->
<c:if test="${list!=null }">
	<c:forEach var="camp" items="${list }">
		<section class="list">
			<div class="list-container">
				<div class="img">
					<a href="detail?id=${camp.id }"><img class="image" src="/images/${camp.img1 }" width="200"
						height="150"></a>
				</div>
				<div class="content-container">
					<div class="title">
						<a style="color: rgb(255, 72, 82);" href="detail?id=${camp.id }">${camp.name }</a>
					</div>
					<div style="color: rgb(0, 140, 236);" class="local">${camp.address }</div>
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