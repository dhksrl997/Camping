<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<div class="adminConWrap">
   <form action="campedit" method="post">
   <div class="infoWrap">
      <h1 class="adminConTit">캠핑장 수정</h1>
      <button type="submit" class="regbtn" onclick="location.href='camplist'">수정하기</button>
      <button type="button" onclick="location.href='camplist'">목록보기</button>
   </div>
   <div class="conListWrap">
      <div class="regTable">
         <c:forEach var="camp" items="${camplist}">
         <input type=hidden name=camplist value="${camp}">
         <input type=hidden name=id value="${camp.id}">
         <table class="table-part2">
            <tr>
               <td class="info-tit">상호</td>
               <td class="info-con">
                  <input type="text" autocomplete="off" name="name" id="input" required value="${camp.name}">
               </td>
               <td class="info-tit">연락처</td>
               <td class="info-con rightnone">
                  <input type="text" autocomplete="off" name="phone" id="input" required value="${camp.phone}">
               </td>
            </tr>
            <tr>     
               <td class="info-tit">주소</td>
               
               <td class="info-con" colspan="4">
         
                  <input type="text" autocomplete="off" name="address" id="input" required value="${camp.address}">
               </td>
            </tr>
            <tr>
               <td class="info-tit">부대 시설</td>
               <td class="info-con" colspan="4">
                  <input type="text" autocomplete="off" name="faclity" id="input" required value="${camp.faclity}">
               </td>
            </tr>
            <tr>
               <td class="info-tit">이용 요금</td>
               <td class="info-con" colspan="4">
                  <input  type="text" autocomplete="off" name="price" id="input" required value="${camp.price}">
               </td>
            </tr>
            <tr>
            <td class="info-tit" >위도/경도</td>
                   <td class="info-con" >
                      <div style="display:flex;">
                       <input type="text" autocomplete="off" name="latitude" id="input" required value="${camp.latitude}">
                       <input type="text" autocomplete="off" name="longitude" id="input" required value="${camp.longitude}">
                       </div>
                   </td>
               <!-- <td class="info-tit">애완 동반</td>
               <td class="info-con">
                  <form>
                     <input type="radio" name="possible">
                     <label for="possible">가능</label> 
                     
                     <input type="radio" name="impossible" style="margin-left: 40px;">
                     <label for="impossible">불가능</label> 
                  </form>
               </td> -->
               <td class="info-tit">주차 시설 (최대 수용)</td>
               <td class="info-con">
                  <input type="text" autocomplete="off" name="parking" id="input" required value="${camp.parking}">
               </td>
            </tr>
            <!-- <tr>
               
                <td class="info-tit">등록 일자</td>
               <td class="info-con">
                  <input type="date" autocomplete="off" id="name" name="regdate" required minlength="5" maxlength="8" size="15">
               </td> 
            </tr> -->
         </table> 
         <table class="table-part1">
            <tr> 
               <td rowspan="5">
               <img class="camp-img" src="/images/${camp.img1}">
                  <!-- <img class="camp-img" src="/images/admin-regpicture.png"> -->
               </td>
            </tr>
            <tr>
               <td class="info-tit"> 대표 이미지 등록 </td>
               <td class="filebox info-con">
                  <input  autocomplete="off" name="file" value="${camp.img1}"/>
               </td>
            </tr>
            <tr>
               <td class="info-tit"> 이미지 등록 1 </td>
               <td class="filebox info-con">
                  <%-- <input type="file" autocomplete="off" name="file" value="${camp.img2}"/> --%>
                  <input  autocomplete="off" name="file" value="${camp.img2}"/>
               </td>
            </tr>
            <tr>
               <td class="info-tit"> 이미지 등록 2 </td>
               <td class="filebox info-con">
                  <input  autocomplete="off" name="file" value="${camp.img3}"/>
               </td>
            </tr>
            <tr>
               <td class="info-tit"> 이미지 등록 3 </td>
               <td class="filebox info-con">
                  <input  autocomplete="off" name="file" value="${camp.img4}"/>
               </td>
            </tr>
         
         </table>
            </c:forEach>
         
      </div>  
   </div>
</form>
</div>