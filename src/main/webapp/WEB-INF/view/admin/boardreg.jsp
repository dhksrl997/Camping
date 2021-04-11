<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script defer src="/js/admin/boardreg.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<div class="adminConWrap">
<form name="Form" method="post" action="">
	<div class="infoWrap">
		<h1 class="adminConTit">게시글 등록</h1>
		<button type="button" class="regbtn" onclick="chkVal()">등록하기</button>
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
						<input type="text" autocomplete="off" name="title" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">파일 선택</td>
					<td class="filebox info-con" colspan="4">
						<input type="file" autocomplete="off" name="file" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">내용 입력</td>
					<td class="info-con" colspan="4">
						<textarea id="contentArea"></textarea>
					</td>
				</tr>
				<tr>
					<td class="info-tit">댓글 설정</td>
					<td class="info-con" colspan="4">
						<input type="radio" autocomplete="off" name="commnet" value="alow" required checked>&nbsp;댓글 허용
						<input type="radio" autocomplete="off" name="commnet" value="notAlow" required style="margin-left: 40px;">&nbsp;댓글 허용 안함
					</td>
				</tr>
				<tr>
					<td class="info-tit">공개 여부</td>
					<td class="info-con">
						<input type="radio" name="posting" value="public" required checked>&nbsp;공개
						<input type="radio" name="posting" value="private" required style="margin-left: 40px;">&nbsp;비공개
					</td>
					<td class="info-tit">등록 일자</td>
					<td class="info-con">
						<input type="date" autocomplete="off" id="name" name="regDate" required minlength="5" readonly maxlength="8" size="15">
					</td>
				</tr>
			</table> 
			
		</div>  
	</div>
	</form>
</div>