<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>


<main class="editProfile-main">
	<section class="member-information">
		<div
			style="text-align: center; font-size: 40px; margin-bottom: 20px; margin-top: 20px;">쪽지
			답장하기</div>
		<form action="sendletter">
			<div class="areaWrap">
				<div class="letter-form">
					<input name="id" type="hidden" value="${param.id }">
					<textarea rows="20" cols="70" name="content"></textarea>
				</div>
				<input type="submit" value="답장" class="response">
			</div>
		</form>
	</section>
	<script defer src="/js/member/editProfile.js"></script>
</main>