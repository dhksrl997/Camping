<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<script defer src="/js/camp/detail.js"></script>
<link rel="stylesheet" href="/css/camp/detail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
	integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
	crossorigin="anonymous">
<c:forEach var="c" items="${list }">
	<div class="name">${c.name }</div>
	<section class="detail">
		<div class="thumbnail">
			<img class="main-img" src="/images/${c.img1 }" width ="1100px" height="740px"> 
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
			<div class="d-none">
			<div class="latitude">${c.latitude}</div>
			<div class="longitude">${c.longitude}</div>
		</div>
		</div>
		<div class="detail-map">
			<div>
				<h2>찾아오시는길</h2>
			</div>

			<div id="map2" class="map2"></div>

		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d381a3bf90a679a591c3eb39a8edfe8"></script>
		</div>
	</section>
</c:forEach>
<div class="comments-text">Comments</div>
<div class="comment-Line"></div>

<!-- 댓글 입력 폼    -->
		<c:forEach var="m" items="${memberList}">
<div class="comment">
	<form method="POST">
		<div class="pub-section">
			<div class="pub">
				비공개<input name="pub" type="checkbox">
			</div>
			<!-- <div class="reservation">
				예약<input name="reservation" type="checkbox">
			</div> -->
		</div>
		<div class="comment-section">
			<div class="writer" name="writer">${sessionScope.userId}</div>
		
		<textarea name="content"  maxlength="100" rows="5" cols="90" placeholder="후기를 남기거나 비공개로 예약을 신청할 수 있습니다."></textarea> 
		<%-- <textarea name="content reservation-check"  rows="5" cols="90" placeholder="">아이디 : ${m.uid}   이름 : ${m.name}
핸드폰번호 : ${m.phone}
------------------------------</textarea> --%> 
			
			<input type="hidden" name="id" value="${param.id }"> <input
				type="submit" value="등록" style="width: 100px; height: 100px;">
		</div>
	</form>
</div>
		</c:forEach>	
<!-- 기존 댓글들(USER일 때)   -->
<s:authorize access="hasRole('ROLE_USER')">			
<c:forEach var="com" items="${getComment }">
	<div class="comment" style="margin-top:10px;height: 100px;">
		<div style=" border-top: 1px solid lightgrey;width: 800px;">
		
		<form class="comment-form" action="comment" method="get">
					<fmt:formatDate var="dateTempParse" pattern="yyyy년 MM월 dd일 hh:mm " value = "${com.regDate}"/>
					<div class="regDate" style="font-size: 13px;">${dateTempParse}</div>
			<div class="comment-section">
				<div class="writer">${com.writer }</div>
				<c:choose>
					<c:when test="${com.pub == 'on' }">
						<c:if test="${com.writer!=sessionScope.userId && sessionScope.userId != 'admin'}">
						<div style="font-weight:bold;font-size:22px;">비공개 댓글입니다.</div>
						</c:if>
						<c:if test="${com.writer==sessionScope.userId || sessionScope.userId == 'admin'}">
						<div class="comment-content">${com.content }</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div class="comment-content">${com.content }</div>
					</c:otherwise>
					
				</c:choose>
			</div>
			
			<c:if test="${com.writer==sessionScope.userId}">
			<button class="comment-delete" data-rno="${com.id}">삭제</button>
			</c:if>
			<s:authorize access="hasRole('ROLE_ADMIN')">			
			<button class="comment-delete" data-rno="${com.id}">삭제</button>
			</s:authorize>
			

		</form>
		</div> 
	</div>
</c:forEach>
</s:authorize>
			<s:authorize access="hasRole('ROLE_ADMIN')">			
			<div class="comment-content">${com.content }</div>
			</s:authorize>
			
			<!-- admin일 때 댓글 -->
			<s:authorize access="hasRole('ROLE_ADMIN')">			
<c:forEach var="com" items="${getComment }">
	<div class="comment" style="margin-top:10px;height: 100px;">
		<div style=" border-top: 1px solid lightgrey;width: 800px;">
		
		<form class="comment-form" action="comment" method="get">
					<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd-hh-mm" value = "${com.regDate}"/>
					<div class="regDate" style="font-size: 13px;">${dateTempParse}</div>
			<div class="comment-section" ">
				<div class="writer">${com.writer }</div>
						<div class="comment-content">${com.content }</div>	
			</div>
			
			<s:authorize access="hasRole('ROLE_ADMIN')">			
			<button class="comment-delete" data-rno="${com.id}">삭제</button>
			</s:authorize>
			

		</form>
		</div>
	</div>
</c:forEach>
			</s:authorize>
			
			
<!-- <div
	style="border-bottom: 1px solid lightgrey; margin-top: 20px; width: 800px; margin-left: auto; margin-right: auto;"></div> -->
<div style="border-bottom: 1px solid lightgrey; margin-top: 100px;"></div>
