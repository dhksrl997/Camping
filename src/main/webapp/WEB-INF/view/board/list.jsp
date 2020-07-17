<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script defer src="/js/board/reg.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<div> 이모저모 캠핑게시판</div>


	<div class="board-background">

	 <div class="table-box"> 
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>글쓴이</td>
                    <td>작성일</td>
                    <td>조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 ~~\</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 테이블~~</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 테이블~~</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 테이블~~</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 테이블~~</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>완기쿤~~~~~ 여기 테이블~~</td>
                    <td>상훈쿤</td>
                    <td>2015040080</td>
                    <td>1818</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="text-center">
        <ul class="pagination">
            <li><a href="">1</a> </li>
            <li><a href="">2</a> </li>
            <li><a href="">3</a> </li>
            <li><a href="">4</a> </li>
            <li><a href="">5</a> </li>
        </ul>
    </div>
    
    </div>
    <c:forEach var="c" items="${content }">${c.content } </c:forEach>
    test2