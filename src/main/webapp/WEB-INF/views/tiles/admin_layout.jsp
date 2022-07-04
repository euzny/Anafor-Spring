<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- tiles 라이브러리를 사용할 수 있도록 선언 -->
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${category eq 'pr' }"><c:set var='title' value='제품소개' /></c:when>
	<c:when test="${category eq 'cu' }"><c:set var='title' value='고객센터' /></c:when>
	<c:when test="${category eq 'no' }"><c:set var='title' value='공지사항' /></c:when>
	<c:when test="${category eq 'login' }"><c:set var='title' value='로그인' /></c:when>
	<c:when test="${category eq 'join' }"><c:set var='title' value='회원가입' /></c:when>
	<c:when test="${category eq 'co' }"><c:set var='title' value='컨텐츠관리' /></c:when>
	<c:when test="${category eq 'bo' }"><c:set var='title' value='대시보드' /></c:when>
	<c:when test="${category eq 'sp' }"><c:set var='title' value='주문관리' /></c:when>
	<c:when test="${category eq 'ur' }"><c:set var='title' value='사용자관리' /></c:when>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<style type="text/css">
	/* #wrap { display: flex; flex-direction: column; height: 100%; } */


#admin_wrap {
	display : flex;
    min-height: 937px;
/*     width: 100%; */
    height: 100%;
}

.admin_menu{
/* 	position: absolute;  */
	width: 15%;
/* 	height: 100%; */
	background:#414141;
/* 	float: left; */
}

#admin_content{
/* 	position: absolute; */
/* 	left:15%; */
	width: 85%;
  	height: auto;
/*  	padding-bottom: 130px;  */
	min-height: 1000px;
/* 	height: 100%; */
	background: #e5e5e5;
/* 	float: right; */
	
   
}

</style>

<!-- <link rel='stylesheet' type='text/css' href="resources/css/common.css"> -->
<link rel='stylesheet' type='text/css' href="css/common.css?v=<%=new Date().getTime() %>">
<link rel="AnaFor icon"  href="imgs/AnaFor_icon.png" type="image/x-icon">
<!-- jQuery 라이브러리 CDN 방식 연결 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
<script type="text/javascript" src="js/file_check.js"></script>
</head>
<body>
<div id="admin_wrap">
<!-- 기본 layout 으로 header, content, footer 로 구성된 형태 -->
	<div class="admin_menu">
		<tiles:insertAttribute name="menu" />
	</div>



	<div id="admin_content">
		<tiles:insertAttribute name="content" />
	</div>
	
</div>
			
</body>

</html>