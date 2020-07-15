<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/detail/detail.js"></script>
<link rel="stylesheet" href="/css/camp/detail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
	integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
	crossorigin="anonymous">
<c:forEach var="c" items="${list }">
	<div class="name">${c.name }</div>
	<section class="detail">
		<div class="thumbnail">
			<img class="main-img" src="/images/${c.img1 }" width="620px" height="450px">
		</div>
		<div class="sub-img">
			<div class="img1 smallimg">
				<img class="imgs" src="/images/${c.img1 }" width="220px"
					height="130px">
			</div>
			<div class="img2 smallimg">
				<img class="imgs" src="/images/${c.img2 }" width="220px"
					height="130px">
			</div>
			<div class="img3 smallimg">
				<img class="imgs" src="/images/${c.img3 }" width="220px"
					height="130px">
			</div>
			<div class="img4 smallimg">
				<img class="imgs" src="/images/${c.img4 }" width="220px"
					height="130px">
			</div>
		</div>
		<div class="title"></div>
		<div class="info">
			<div class="left">
				<div class="components">
					<i class="fas fa-map-marked-alt">&nbsp;</i>
					<div class="address icons2">주 소</div>
				</div>
				<div class="data">${c.address }</div>
				<div class="components">
					<i class="fas fa-phone">&nbsp;</i>
					<div class="number icons2">전 화 번 호</div>
				</div>
				<div class="data">${c.phone }</div>
				<div class="components">
					<i class="fas fa-users">&nbsp;</i>
					<div class="peopleNums icons2">수 용 인 원</div>
				</div>
				<div class="data">${c.acceptNum }명</div>
				<div class="components">
					<i class="fas fa-car">&nbsp;</i>
					<div class="parking icons2">주 차 장</div>
				</div>
				<div class="data">${c.parking }대</div>
			</div>
			<div class="right">
				<div class="components">
					<i class="fas fa-store">&nbsp;</i>
					<div class="facility icons2">편 의 시 설</div>
				</div>
				<div class="data">${c.faclity }</div>
				<div class="components">
					<i class="fas fa-hospital-user">&nbsp;</i>
					<div class="security icons2">안 전 시 설</div>
				</div>
				<div class="data">${c.safety }</div>
				<div class="components">
					<i class="fas fa-door-open">&nbsp;</i>
					<div class="time icons2">영 업 시 간</div>
				</div>
				<div class="data">${c.open }</div>
				<div class="components">
					<i class="fas fa-won-sign">&nbsp;</i>
					<div class="price icons2">요 금</div>
				</div>
				<div class="data">${c.price }</div>
			</div>
		</div>
	</section>
</c:forEach>
<div class="comments-text">Comments</div>
<div class="comment-Line"></div>

<!-- 댓글 입력 폼    -->
<div class="comment">
	<form method="POST">
		<div class="pub-section">
			<div class="pub">
				비공개<input name="pub" type="checkbox">
			</div>
		</div>
		<div class="comment-section">
			<div class="writer" name="writer">wangi</div>
			<textarea name="content" rows="5" cols="90" placeholder="후기를 남기거나 비공개로 예약을 신청할 수 있습니다."></textarea>
			<input type="hidden" name="id" value="${param.id }"> <input
				type="submit" value="등록" style="width: 100px; height: 100px;">
		</div>
	</form>
</div>
<!-- 기존 댓글들   -->
<c:forEach var="com" items="${getComment }">
	<div class="comment">
		<div style="margin-top: 20px; border-top: 1px solid lightgrey;"></div>
		<form action="comment" method="get">
			<div class="comment-section" style="margin-top: 30px;">
				<div class="writer">${com.writer }</div>
				<c:choose>
					<c:when test="${com.pub == 'on' }">
						<div style="font-weight:bold;font-size:22px;">비공개 댓글입니다.</div>
					</c:when>
					<c:otherwise>
						<div>${com.content }</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="regDate" style="margin-left: 10%;float:right;">${com.regDate }</div>
		</form>
	</div>
</c:forEach>

<div
	style="border-bottom: 1px solid lightgrey; margin-top: 20px; width: 55%; margin-left: auto; margin-right: auto;"></div>
<div style="border-bottom: 1px solid lightgrey; margin-top: 100px;"></div>
