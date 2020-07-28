<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/admin/listSelect.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="adminConWrap">
   
   <div class="infoWrap">
      <h1 class="adminConTit">캠핑장 목록</h1>
      <div class="searchWrap">
         <form action="/admin/camplist" method="POST">
            <input type="text" name="search" value=""> 
            <input type="submit" value="" style="display:none;">
            <i class="fas fa-search search-icon"></i>
         </form>
      </div>
      <button type="button" onclick="location.href='campreg'">등록하기</button>
   </div>

   <div class="conListWrap">
      <section class="printCount">
         <c:if test="${exist == null}">
         총 캠핑장 수 : ${index}  
         </c:if>
         <c:if test="${exist != null}">
         검색 결과  : ${index}
         </c:if>
            <select id="listNum" name="listNumSelect" >
               <option value="20" >20개 보기</option>
               <option value="60" >60개 보기</option>
               <option value="150" >150개 보기</option>
               <option value="300" >300개 보기</option>
               <option value="500" >500개 보기</option>
               <option value="800" >800개 보기</option>
            </select>
      </section>
      <table class="boardList">
         <thead class="boardList">
            <tr>
               <td>No.</td>
               <td>캠핑장 상호</td>
               <td>캠핑장 주소</td>
               <td>운영시간</td>
               <td>연락처</td>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="camp" items="${camplist}">
               <tr>
                  <td>${camp.id}</td>
                  <td><a href="/admin/campedit?id=${camp.id}"><b>${camp.name}</b></a></td>
                  <td>${camp.address}</td>
                  <td>${camp.open}</td>
                  <td>${camp.phone}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>

</div>