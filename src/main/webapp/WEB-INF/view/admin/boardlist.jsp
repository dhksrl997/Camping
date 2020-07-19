<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--<link rel="stylesheet" href="/css/reset.css">
 <link rel="stylesheet" href="/css/admin/boardlist.css"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<div class="adminConWrap">
    <div class="infoWrap">
        <h1 class="adminConTit">게시글 목록</h1>
        <button type="button">등록하기</button>
    </div>
    <div class="conListWrap">
        <section class="printCount">
            총 게시글 수 : 0
            <select id="listNum-select" name="listNum-select" mode="1">
                <option value="20">20개 보기</option>
                <option value="60">60개 보기</option>
                <option value="150">150개 보기</option>
                <option value="300">300개 보기</option>
            </select>
        </section>
        <table class="boardList">
            <thead class="placeList">
                <tr>
                    <td>No.</td>
                    <td>게시판명</td>
                    <td>게시글 제목</td>
                    <td>작성자</td>
                    <td>작성시간</td>
                    <td>조회수</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>No.</td>
                    <!-- <a href="" onclick="window.open(this.href, '_blank', 'width=960px, height=700px, tollbars=no, scrollbars=no'); return false"> -->
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>공지사항</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>공지사항</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>공지사항</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>공지사항</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
                <tr>
                    <td>No.</td>
                    <td>자유게시판</td>
                    <td><a href=""><b>게시글 제목 db 내용</b></a></td>
                    <td>작성자명 db 내용</td>
                    <td>작성시간 db 내용</td>
                    <td>조회수 db 내용</td>
                </tr>
            </tbody>
        </table>
    </div>

</div>