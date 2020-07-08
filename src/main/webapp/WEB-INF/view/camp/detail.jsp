<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/camp/detail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
	integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
	crossorigin="anonymous">
<c:forEach var="c" items="${list }">
	<div class="name">${c.name }</div>
	<section class="detail">
		<div class="thumbnail">
			<img class="main-img" src="/images/${c.img1 }">
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
					<div class="price icons2">가 격</div>
				</div>
				<div class="data">${c.price }</div>
			</div>
		</div>
	</section>
</c:forEach>