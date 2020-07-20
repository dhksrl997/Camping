<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="adminConWrap">
        <div class="infoWrap">
            <h1 class="adminConTit">캠핑장 목록</h1>
            <button type="button">등록하기</button>
        </div>
        <div class="conListWrap">
            <section class="printCount">
                총 캠핑장 수 : 0
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
                        <td><a href="/camp/detail?id=${camp.id}" target="_blank"><b>${camp.name}</b></a></td>
                        <td>${camp.address}</td>
                        <td>${camp.open}</td>
                        <td>${camp.phone}</td>
                    </tr>
                </c:forEach>   
                </tbody>
              </table>
        </div>
        
    </div>
