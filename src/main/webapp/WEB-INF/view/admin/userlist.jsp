<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/js/admin/userlistSelect.js"></script>
<div class="adminConWrap">
	
    <div class="infoWrap">
        <h1 class="adminConTit">회원 목록</h1>
        <div class="searchWrap">
            <form action="/admin/userlist" method="POST">
                <input type="text" name="search" value=""> 
                <input type="submit" value="" style="display:none;">
                <i class="fas fa-search search-icon"></i>
            </form>
        </div>
    </div>
    <div class="conListWrap">
        <section class="printCount">
			<c:if test="${exist == null}">
			총 회원 수 : ${index}  
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
                    <td>회원 아이디</td>
                    <td>게시글 등록일</td>
                    <td>이름</td>
                    <td>연락처</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="member" items="${userlist}">
                <tr>
                    <td>${member.id}</td>
                    <td><a href="" target="_blank"><b>${member.uid}</b></a></td>
                    <td>${member.regDate}</td>
                    <td>${member.name}</td>
                    <td>${member.phone}</td>
                </tr>
            </c:forEach>    
            </tbody>
        </table>
    </div>

</div>