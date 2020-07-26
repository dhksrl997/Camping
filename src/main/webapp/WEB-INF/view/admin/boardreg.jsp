<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/admin/reg.css">

<div class="adminConWrap">
	<div class="infoWrap">
		<h1 class="adminConTit">게시글 등록</h1>
		<button type="button" onclick="location.href='boardlist'">목록보기</button>
	</div>
	<div class="conListWrap">
		<div class="regTable">
			<table class="table-part2">
				<tr>  
					<td class="info-tit">게시판 선택</td>
					<td class="info-con">
						<select class="selectCenter" name ="type">
							<option value="공지사항">공지사항</option>
							<option value="문의하기">문의하기</option>
							<option value="자유게시판">자유게시판</option>
						</select>
					</td>
					<td class="info-tit">타이틀</td>
					<td class="info-con">
						<input type="text" name="title" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">파일 선택</td>
					<td class="filebox info-con" colspan="4">
						<input type="file" name="file" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">내용 입력</td>
					<td class="info-con" colspan="4">
						<textarea></textarea>
					</td>
				</tr>
				<tr>
					<td class="info-tit">댓글 설정</td>
					<td class="info-con" colspan="4">
						<form>
							<input type="radio" name="use" required>
							<label for="comments">댓글 허용</label> 
							<input type="radio" name="disable" required style="margin-left: 40px;">
							<label for="comments">댓글 허용 안함</label> 
						</form>
					</td>
				</tr>
				<tr>
					<td class="info-tit">공개 여부</td>
					<td class="info-con">
						<form>
							<input type="radio" name="posting" required>
							<label for="posting">공개</label> 
							
							<input type="radio" name="private" required style="margin-left: 40px;">
							<label for="private">비공개</label> 
						</form>
					</td>
					<td class="info-tit">등록 일자</td>
					<td class="info-con">
						<input type="date" id="name" name="regdate" required minlength="5" maxlength="8" size="15">
					</td>
				</tr>
			</table> 
			
		</div>  
	</div>
</div>