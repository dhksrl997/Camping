<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="adminConWrap">
    <div class="infoWrap">
        <h1 class="adminConTit">회원 목록</h1>
    </div>
    <div class="conListWrap">
        <section class="printCount">
            총 회원 수 : ${index}
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
                    <td>회원 아이디</td>
                    <td>게시글 등록일</td>
                    <td>이름</td>
                    <td>연락처</td>
                    <td>이메일</td>
                    <td>나이</td>
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
                    <td>${member.email}</td>
                    <td>${member.age}</td>
                </tr>
            </c:forEach>    
            </tbody>
        </table>
    </div>

</div>