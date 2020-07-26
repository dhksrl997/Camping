<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/admin/reg.css">

<div class="adminConWrap">
	<div class="infoWrap">
		<h1 class="adminConTit">캠핑장 등록</h1>
		<button type="button" onclick="location.href='camplist'">목록보기</button>
	</div>
	<div class="conListWrap">
		<div class="regTable">
			<table class="table-part2">
				<tr>
					<td class="info-tit">상호</td>
					<td class="info-con">
						<input type="text" name="name" id="input" required>
					</td>
					<td class="info-tit">연락처</td>
					<td class="info-con rightnone">
						<input type="text" name="phone" id="input" required>
					</td>
				</tr>
				<tr>     
					<td class="info-tit">주소</td>
					
					<td class="info-con" colspan="4">
						<!-- <select class="selectCenter" name ="type">
							<option value="서울시">서울시</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="경상도">경상도</option>
							<option value="전라도">전라도</option>
							<option value="충청도">충청도</option>
							<option value="제주도">제주도</option>
						</select> -->
						<input type="text" name="address" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">부대 시설</td>
					<td class="info-con" colspan="4">
						<input type="text" name="faclity" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">이용 요금</td>
					<td class="info-con" colspan="4">
						<input  type="text" name="price" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">애완 동반</td>
					<td class="info-con">
						<form>
							<input type="radio" name="possible">
							<label for="possible">가능</label> 
							
							<input type="radio" name="impossible" style="margin-left: 40px;">
							<label for="impossible">불가능</label> 
						</form>
					</td>
					<td class="info-tit">주차 시설 (최대 수용)</td>
					<td class="info-con">
						<input type="text" name="parking" id="input" required>
					</td>
				</tr>
				<tr>
					<td class="info-tit">위도/경도</td>
					<td class="info-con">
						<input type="text" name="latitude" id="input" required>
					</td>
					<td class="info-tit">등록 일자</td>
					<td class="info-con">
						<input type="date" id="name" name="regdate" required minlength="5" maxlength="8" size="15">
					</td>
				</tr>
			</table> 
			<table class="table-part1">
				<tr> 
					<td rowspan="5">
						<img class="camp-img" src="/images/admin-regpicture.png">
					</td>
				</tr>
				<tr>
					<td class="info-tit"> 대표 이미지 등록 </td>
					<td class="filebox info-con">
						<input type="file" name="file" />
					</td>
				</tr>
				<tr>
					<td class="info-tit"> 이미지 등록 1 </td>
					<td class="filebox info-con">
						<input type="file" name="file" />
					</td>
				</tr>
				<tr>
					<td class="info-tit"> 이미지 등록 2 </td>
					<td class="filebox info-con">
						<input type="file" name="file" />
					</td>
				</tr>
				<tr>
					<td class="info-tit"> 이미지 등록 3 </td>
					<td class="filebox info-con">
						<input type="file" name="file" />
					</td>
				</tr>
			
			</table>
			
		</div>  
	</div>

</div>