<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer src="/js/member/join.js"></script>

<main>
	<div class="login-background">

		<div class="join">
			<form id="form1" method="post" action="join">
				<div class="join-form">
					<fieldset>
						<legend class="d-none">회원정보</legend>
						<table class="table margin-top first">
							<tbody class="signup-body">
								<th class="body-th"><label>아이디</label></th>
								<tr style="display: block">
									<td colspan="3" class="text-align-left indent"><input
										id="id-text" type="text"  autocomplete="off" name="uid" autocomplete="off" class="width-half"
										required="required" value="" placeholder="영문과 숫자 4~11자 이내"
										pattern="^\w{4,11}$" /></td>
								</tr>
								<tr>
									<td id="id-danger" style="color: #d92742; font-weight: bold;">아이디가
										이미 존재합니다.</td>
								</tr>
								<th class="body-th"><label>비밀번호</label></th>
								<tr>

									<td colspan="3" class="text-align-left indent"><input
										type="password" name="pwd" class="pwd1" required
										placeholder="비밀번호 입력" /></td>

								</tr>
								<th class="body-th"><label>비밀번호 확인</label></th>
								<tr>
									<td colspan="3" class="text-align-left indent ">
										<!-- <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> -->
										<input name="pwd2" type="password" class="pwd2" required /> 
									</td>
								</tr>
								<tr>
									<td id="pwd-danger" style="color: #d92742; font-weight: bold;">일치하지 않습니다.</td>
								</tr>
								<th class="body-th"><label>이름</label></th>
								<tr>
									<td colspan="3" class="text-align-left indent"><input
										class="width-half" name="name" type="text" value=""
										required="required" /></td>

								</tr>


								<th class="body-th"><label>핸드폰번호</label></th>
								<tr>
									<td colspan="3" class="text-align-left indent"><input
										name="phone" type="text" class="width-half"
										pattern="^01[016789]-\d{3,4}-\d{4}$"
										placeholder="예) 010-1111-2222" required value="" /></td>
								</tr>


								<tr>
									<td colspan="4"><input id="submit-Button" type="submit"
										name="btn" value="가입하기" class="btn-text btn-default" /></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>
			</form>
		</div>
</main>
