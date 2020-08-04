<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="/js/board/reg.js"></script>
<link rel="stylesheet" href="/css/board/reg.css">
<div class="reg-message">${param.cate }</div>
<div class="reg-message2">*후기 입력란*</div>
<span class="side-message1">CampNic</span>
<span class="side-message2">Board</span>
<section class="reg-box">

	<div class="title-wrapper">
		<div
			style="width: 90px; font-size: 30px; font-family: S-CoreDream-3Light;">제목
			:</div>

		<div class="reg-title" contenteditable="true"></div>
	</div>
	<div class="wrapper">
		<div class="buttons">
			<input type="button" class="BOLD" value="Bold"
				onclick="document.execCommand('bold')" /> <input type="button"
				class="ITALIC" value="Italic"
				onclick="document.execCommand('Italic')" /> <input type="button"
				class="UNDERBAR" value="underline"
				onclick="document.execCommand('Underline')" />
			<button type="button" class="aignLeft"
				onclick="document.execCommand('justifyleft')">
				<i class="fas fa-align-left"></i>
			</button>
			<button type="button" class="aignCenter"
				onclick="document.execCommand('justifycenter')">
				<i class="fas fa-align-center"></i>
			</button>
			<button type="button" class="aignRight" value="오른쪽 정렬"
				onclick="document.execCommand('justifyright')">
				<i class="fas fa-align-right"></i>
			</button>
			<select id="fontSize" width="50px">
				<option value="">글자 크기</option>
				<option value="3">10px</option>
				<option value="4">12px</option>
				<option value="5">16px</option>
				<option value="6">20px</option>
				<option value="7">30px</option>
			</select>

			<div class="file-btn" style="margin-top: 20px;">사진업로드</div>
			<form action="/uploadImgs" id="forms" accept-charset="UTF-8">
				<input type="file" name="img" accept=".gif, .jpg, .png, .jpeg "
					id="images" multiple />
			</form>
		</div>
		<div class="reg-search">
			<br>
			<div>캠핑장 검색 :</div>
			<div class="reg-search-box" contenteditable="true"></div>
			<button type="button" class="btn-search">찾기</button>
		</div>
	</div>
	<div class="content" contenteditable="true"></div>
	<div class="submit-box">
		<input type="button" value="등록" id="submit">
		<input type="button" value="목록" onclick="location.href='list?cate=${param.cate}&index=1'" id="submit">
	</div>



</section>