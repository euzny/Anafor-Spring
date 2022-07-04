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
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<style type="text/css">
#wrap { display: flex; flex-direction: column; height: 100%; }
/* #wrap { */
/*     min-height: 100%; */
/*     position: absolute; */
/* } */

/* .header{ position: fixed;  top: 0;  left: 0;  right: 0; height: 60px; background: teal;  display: flex;  justify-content: space-between;  align-items: center;} */



</style>


<link rel="AnaFor icon"  href="imgs/AnaFor_icon.png" type="image/x-icon">
<!-- <link rel='stylesheet' type='text/css' href="resources/css/common.css"> -->
<link rel='stylesheet' type='text/css' href="css/common.css?v=<%=new Date().getTime() %>">

<!-- jQuery 라이브러리 CDN 방식 연결 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
<script type="text/javascript" src="js/file_check.js"></script>

</head>
<!-- 기본 layout 으로 header, content, footer 로 구성된 형태 -->
<div class="header">
	<tiles:insertAttribute name="header" />
</div>


<body>

<div id="wrap">
	

	<div id="content">
		<tiles:insertAttribute name="content" />
	</div>
	
</div>
			
</body>

<div id="footer">
	<tiles:insertAttribute name="footer" />
	</div>

</html>