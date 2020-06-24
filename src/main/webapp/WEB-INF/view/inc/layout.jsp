	<%@page import="java.util.List"%>

	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
	
	<!DOCTYPE html>
	<html>
	
	<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
        integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
    <script defer src="/js/index.js"></script>
</head>
	
	<body>
	    <!-- header 부분 -->

	    <tiles:insertAttribute name="header" />
	
		<!-- --------------------------- <visual> --------------------------------------- -->
		<!-- visual 부분 -->
		
		
		<!-- --------------------------- <body> --------------------------------------- -->
		<div id="body">
			
	
				<!-- --------------------------- aside --------------------------------------- -->
				
	
				
				<!-- --------------------------- main --------------------------------------- -->
				<tiles:insertAttribute name="main" />
				
		
		</div>
	
	    <!-- ------------------- <footer> --------------------------------------- -->
		
	        
	    </body>
	    
	    </html>