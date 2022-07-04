<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<script type="text/javascript" src="js/admin.js"></script>
<style type="text/css">

/*style.css*/
#wrap{width: 100%; height: auto; color: white;}
#logo{width: 100%; height: 60px; position: relative; border-bottom: 1px solid #d9d9d9;}

#logo h3{color: white; position: absolute; left: 80px; top: 5px; font-weight: 600; font-size: 30px; line-height: 32px;}
#logo p{display: block; color: white; position: absolute; left: 115px; top: 30px; font-weight: 600; font-size: 14px;line-height: 20px}

#dormammu{width: 100%; height: auto; position: relative; }
#dormammu ul{position: absolute; left: 40px; top: 10px;}
#dormammu ul li a{font-size: 20px; color: white; font-weight: 600; margin-left: 20px; line-height: 25px; text-decoration: none;}
#dormammu ul li a:hover{font-weight: bold; color : #b0b0b0;}

#container{width: 100%; height: auto; position: relative; top: 100px; text-align: left; padding: 20px;}
#container div ul li{font-size: 18px; color: white; line-height: 30px; font-weight: 600;}
#container div ul li a{color: white;}
#container .menu_1, .menu_2, .menu_3, .menu_4{margin-left: 20px; } 
#container ul{margin-bottom: 20px;}
#container ul li a:hover{font-weight: bold; color : #b0b0b0;}
</style>



</head>
<body>

<div id="wrap">

	<div id="logo">
		<h3>AnaFor</h3>
		<p>MY 페이지</p>
	</div>

	<div id="dormammu">
		<ul>
			<li><img alt="돌아가기" src="imgs/dormammu.png"><a href='<c:url value="/" />' id="logo">사이트 돌아가기</a></li>
		</ul>
	</div>
	
	<div id="container">
		<div class="my_shopping">
			<ul>
				<li class="menu_title1">MY쇼핑</li>
				<li class="menu_1"><a href="shopList.my" >주문활동/배송조회</a></li>
			</ul>	
		</div>		
		
		<div class="my_activity">
			<ul>
				<li class="menu_title2">MY활동</li>
				<li class="menu_2"><a href="list.qu"  >문의내역 확인</a></li>
				<li class="menu_3"><a href="list.rev" >리뷰관리</a></li>
			</ul>	
		</div>		
		
		<div class="my_information">
			<ul>
				<li class="menu_title3">MY정보</li>
				<li class="menu_4"><a href="checkpw.ur" >개인정보확인/수정</a></li>
			</ul>	
		</div>
		<div class="my_information">
			<ul>
				<li class="menu_title3">MYBox</li>
				<li class="menu_4"><a href="iotmap" >약통위치경로</a></li>
			</ul>	
		</div>			
		
		
	</div>
</div>			
</body>
</html>