<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>
<main>
	<div class="content">
		<!—  —>
		<c:forEach items="${SenderName }" var="s">
			<div class="letter-box" OnClick="location.href ='http://localhost:8080/member/readLetter?id=${s.id}'" style="cursor:pointer;">
				<div class="letter-content">${s.content}</div>
				<div class="from">
					<fmt:formatDate var="dateTempParse" pattern="yy.MM.dd일 hh시 mm분 "
						value="${s.sendData}" />
					${dateTempParse }<br> <br>from :${s.name}
				</div>
			</div>
			<!-- <div id="letter-popup" class="letter-popup hide">
				<div class="letter-popup-exit">Exit</div>
			</div> -->
		</c:forEach>
	</div>
</main>
