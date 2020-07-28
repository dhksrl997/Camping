<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script defer src="/js/admin/boardlistSelect.js"></script>

<div class="adminConWrap">
    <div class="infoWrap">
        <h1 class="adminConTit">게시글 목록</h1>
        <div class="searchWrap">
			<form action="/admin/boardlist" method="POST">
				<input type="text" name="search" value=""> 
				<input type="submit" value="" style="display:none;">
				<i class="fas fa-search search-icon"></i>
			</form>
		</div>
        <button type="button" onclick="location.href='boardreg'">등록하기</button>
	</div>
    <div class="conListWrap">
        <section class="printCount">
            <c:if test="${exist == null}">
			총 게시글 수 : ${index}  
			</c:if>
			<c:if test="${exist != null}">
			검색 결과  : ${index}
			</c:if>
			
            <select id="listNum" name="listNumSelect">
                <option value="20">20개 보기</option>
                <option value="60">60개 보기</option>
                <option value="150">150개 보기</option>
                <option value="300">300개 보기</option>
            </select>
        </section>
        <table class="boardList">
            <thead class="boardList">
                <tr>
                    <td>No.</td>
                    <!-- <td>게시판명</td> -->
                    <td>게시글 제목</td>
                    <td>작성자</td>
                    <td>등록일자</td>
                    <td>조회수</td>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="board" items="${boardlist}">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="/admin/boardedit?id=${board.id}" ><b>${board.title}</b></a></td>
                    <td>${board.writer}</td>
                    <td>${board.regDate}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>