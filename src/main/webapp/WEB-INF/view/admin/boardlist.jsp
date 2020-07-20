<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="adminConWrap">
    <div class="infoWrap">
        <h1 class="adminConTit">게시글 목록</h1>
        <button type="button">등록하기</button>
    </div>
    <div class="conListWrap">
        <section class="printCount">
            총 게시글 수 : ${index}
            <select id="listNum-select" name="listNum-select" mode="1">
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
                    <td><a href=""><b>${board.title}</b></a></td>
                    <td>${board.writer}</td>
                    <td>${board.regDate}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</div>