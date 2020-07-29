<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script defer src="/js/member/join.js"></script>

<main class="editProfile-main">
	<section class="member-information">
		<c:forEach var="proFile" items="${proFile}">
		<fmt:formatDate var="modifiTempParse" pattern="MM월dd일" value = "${proFile.modifiDate}"/>
			<h1>정보 수정</h1>
			<div class="member-profile">
				<h2>프로필</h2>
				<h3>수정하시려면 해당사항을 클릭하세욘</h3>
				<div class="profile-content">
					<div class="profile-block profile-block-id">
						<div class="profile-uid">아이디</div>
						<div class="member-uid">${proFile.uid}</div>
						<div class="">></div>
					</div>
				</div>
				<div class="profile-content">
					<div class="profile-block profile-block-name">
						<div class="profile-name">이름</div>
						<div class="member-name">${proFile.name}</div>
						<div class="">></div>
					</div>
				</div>
				<div class="profile-content">
					<div class="profile-block profile-block-pwd">
						<div class="profile-pwd">패스워드</div>
						<div class="member-pwd">
							* * * * * * <br>최종변경일 : ${modifiTempParse}
						</div>
						<div class="">></div>
					</div>
				</div>

			</div>

			<div class="phone-profile">
				<h2>연락처 정보</h2>
				<h3>수정하시려면 해당사항을 클릭하세욘</h3>
				<div class="phone-content">
					<div class="phone-block phone-block-number">
						<div class="profile-phone">휴대전화</div>
						<div class="member-phone">${proFile.phone}</div>
						<div class="">></div>
					</div>
				</div>
			</div>
			
			<!-- 네임수정  -->
			<div class="name-detail d-none">
				<h4>이름변경</h4>
				<div>
					<div>이름</div>
					<div>
					<input class="name-input"  value="${proFile.name}"></input>
					</div>
				</div>
				<div class="different-name"></div>
				<div>
				<button class="name-detail-cancle">취소</button>
				<button class="name-detail-save">저장</button>
				</div>
			</div>
			<!-- 비밀번호 수정 -->
			<div class="pwd-detail d-none">
				<h4>비밀번호 변경</h4>
				<div>
					<div>비밀번호 </div>
					<div>
					<input type="password" class="pwd-input" placeholder="******"></input>
					</div>
				</div>
				<div>
					<div class="check-pwd">비밀번호 확인</div>
					<div>
					<input type="password" class="pwd-check-input" placeholder="******"></input>
					</div>
				</div>
				<div class="different-pwd"></div>
				<div>
				<button class="pwd-detail-cancle">취소</button>
				<button class="pwd-detail-save">저장</button>
				</div>
			</div>
			<!-- 폰번호 수정 -->
			<div class="phone-detail d-none">
				<h4>번호변경</h4>
				<div>
					<div>핸드폰번호</div>
					<div>
					<input class="phone-input" value="${proFile.phone}"></input>
					</div>
				</div>
				<div class="different-phone"></div>
				<div>
				<button class="phone-detail-cancle">취소</button>
				<button class="phone-detail-save">저장</button>
				</div>
			</div>
		</c:forEach>
	</section>
	<script defer src="/js/member/editProfile.js"></script>
</main>