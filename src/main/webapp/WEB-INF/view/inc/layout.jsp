<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Campnic</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">

<link href='<tiles:getAsString name="css"/>' type="text/css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
	integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<!-- header 부분 -->
	<header class="header">
		<tiles:insertAttribute name="header" />
	</header>
	 <nav class="aside-list">
		<!-- <nav class="aside-list2"> -->
			<a href="/index"><li><i class="fas fa-home"></i><div>홈</div></li></a> 
			<a href="/camp/list"><li><i class="fas fa-campground"></i><div>캠핑장 찾기</div></li></a>
			<a href="/items/checklist"><li><i class="fas fa-tree"></i><div>캠린이 생존템</div></li></a>
			<li><i class="fas fa-grin-hearts"></i><div>캠핑장 소개</div></li>
			<li><i class="fab fa-accusoft"></i><div>samplePage</div></li>
			<li><i class="fab fa-accusoft"></i><div>예약 시스템</div></li>
		</nav>
	<input type="button" value="" class="dark-mode-btn">
	<!-- --------------------------- <visual> --------------------------------------- -->
	<!-- visual 부분 -->


	<!-- --------------------------- <body> --------------------------------------- -->
			<!-- --------------------------- main --------------------------------------- -->
			<tiles:insertAttribute name="main" />

</body>
<script defer src="/js/index.js"></script>
<script defer src="/js/darkmode.js"></script>
</html>