<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>


<main class="editProfile-main">
	<div class="loginId" style="display:none;">${loginId}</div>
	<div class="sendId" style="display:none;">${sendId}</div>
	<section class="member-information">
		<div style="text-align: center; font-size: 40px; margin-bottom: 20px; margin-top: 20px;">쪽지
			답장하기</div>
		<div class="areaWrap">
			<div class="letter-form">
				<textarea rows="20" cols="70" name="content" class="content"></textarea>
			</div>
			<input type="button" value="전송" class="response">
		</div>
	</section>
	<script defer src="/js/member/responseLetter.js"></script>
</main>