<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script defer src="/js/board/reg.js"></script>
<link rel="stylesheet" href="/css/board/reg.css"> 
<div class="reg-message">당신의 후기를 모아모아</div>
<div class="reg-message2">*후기 입력란*</div>
<span class="side-message1">CampNic</span>
<span class="side-message2">Board</span>
<section class="reg-box">

		<div class="title-wrapper">
		<div style="width:90px;font-size:30px;font-family:S-CoreDream-3Light; ">제목 : </div>
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
			
				 <input type="file"	accept=".gif, .jpg, .png, .jpeg" 
				 id="images" multiple />
					<div class="file-btn">사진업로드</div>
			
		</div>
		<div class="reg-search"> 
				<div>캠핑장 검색 :</div> 
				<div class="reg-search-box" contenteditable="true"> </div>
				<button type="button" class="btn-search" >찾기</button>
			</div>
			</div>
		<div class="content" contenteditable="true"></div>
		<!-- <textarea rows="10" cols="10" class="content" name="content">gsfjkgnfsjkghsjkdfhkjsdf</textarea> -->
		<!-- <textarea rows="10" cols="10" name="content" class="content"></textarea> -->
	 <div class="submit-box"><a id="submit" href="/board/list">등록</a></div>
		<!-- <input type="submit" id="submit" value="등록"> -->
	

</section>
