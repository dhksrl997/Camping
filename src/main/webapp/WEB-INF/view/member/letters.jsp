<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>
<main>


	<h2>받은쪽지함</h2>
	<div class="member-profile">
		<div class="content">
			<!—  —>
			<c:forEach items="${SenderName }" var="s">
				<div class="letter-box"
					OnClick="location.href ='http://localhost:8080/member/readLetter?id=${s.id}&status=get'"

					style="cursor: pointer;">
					<div class="letter-content">${s.content}</div>
					<div class="from">
						<fmt:formatDate var="dateTempParse" pattern="yy.MM.dd일 hh시 mm분 "
							value="${s.sendData}" />
						${dateTempParse }<br> <br>보낸이 :${s.name}
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<h2>보낸쪽지함</h2>
	<div class="member-profile receive-message">
		<div class="content">
			<!—  —>
			<c:forEach items="${recieve}" var="r">
				<div class="letter-box"
					OnClick="location.href ='http://localhost:8080/member/readLetter?id=${r.id}'"

					style="cursor: pointer;">
					<div class="letter-content">${r.content}</div>
					<div class="from">
						<fmt:formatDate var="dateTempParse" pattern="yy.MM.dd일 hh시 mm분 "
							value="${r.sendData}" />
						${dateTempParse }<br> <br>보낸이 : ${r.name}
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script defer src="/js/member/editProfile.js"></script>
</main>

