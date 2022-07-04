<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	width: 100%;
	height: auto;
}

#text {
	width: 100%;
	height: 1000px;
	position: relative;
}

#review {
	width: 100%;
	height: auto;
	position: relative;
	margin: 20px;
}

#text div {
	height: 70px;
	font-size: 40px;
	font-weight: bold;
	background: center;
	line-height: 50px;
}

h1 {
	background: position: absolute; center;
	top: 200px;
	margin: 0px auto;
	line-height: 80px;
	font-size: 70px;
	font-weight: bold;
}

.box {
	width: 130px;
	height: 130px;
	float: left;
	margin: 30px;
}

.box img {
	width: 80px;
	height: 80px;
}



details div {
	font-size: 30px;
	font-weight: bold;
	line-height: 40px;
}

/* ============================================ */

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}

#myform fieldset .align{
    display: inline-block;
    direction: ltr;
    border:0;
}

.unchecked{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
.checked{
	font-size: 2em;
    color: #fad000;    
}

#myform .hover:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform .hover:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="text">
			<div style="margin-top: 130px;">스마트 약통이</div>
			<div>가장 필요한 순간</div>
			<div style="margin-top: 150px;">매일 약 먹는 걸 까먹을 때</div>
			<div style="margin-top: 50px;">약을 정해진 시간에 먹어야 할 때</div>
			<div style="margin-top: 50px;">약을 소분해서 가지고 다녀야 할 때</div>
			<div style="margin-top: 200px;">꾸준하게 건강을 챙길 수 있다면?</div>
		</div>
		
		<div>
			<img src="imgs/box1.png" style="width: 80%;">
		</div>

		<br /><br />

		<div
			style="width: 760px; height: 150px; margin: auto; display: block;">
			<div class="box">
				<img src="imgs/clockicon.png"><br /> 섭취시간/기록 알림
			</div>
			<div class="box">
				<img src="imgs/boxicon.png"><br /> 분실방지 알림
			</div>
			<div class="box">
				<img src="imgs/gpsicon.png"><br /> GPS 위치확인
			</div>
			<div class="box">
				<img src="imgs/phoneicon.png"><br /> 중복섭취 방지 알림
			</div>
		</div>

		<br />
		<br />

		<div style="width: 400px; height: 80px; border: 1px solid; margin: auto; border-radius: 50px; background-color: #6969ff; color: white; line-height: 80px;">
			<a style="color: white; font-size: 2em;" href="shop.pr">AnaFor Box 구매하기</a>
		</div>

		<br /><br />
		
		<details>
			<summary class="line"style="padding: 0 10px; background-color: #6969ff; color: white; height: 50px; width: 200px; line-height: 50px; display: inline; cursor: pointer;">
				펼쳐보기 
			</summary>

			<br /><br />

			<div style="height: 50px; line-height: 90px;">스마트 폰으로 예약하면</div>
			<div style="height: 50px; line-height: 70px;">약먹는 시간을 알려줍니다</div>
			<div>
				<img src="imgs/box.png" style="width: 800px; height: 600px;">
			</div>
			<div style="height: 100px; line-height: 160px;">분실 우려없이 GPS 확인과
				위치확인</div>
			<div>
				<img src="imgs/gps.png" style="width: 800px; height: 600px;">
			</div>
			<div style="height: 60px; line-height: 120px;">잊어버리지 않게 섭취 시간
				알림</div>
			<div style="height: 60px; line-height: 80px;">언제먹었는지 알수있는 섭취
				히스토리</div>
			<div>
				<img src="imgs/phone.png" style="width: 800px; height: 600px;">
			</div>
		</details>

		<div
			style="position: fixed; bottom: 80px; right: 80px; width: 50px; height: 50px; border: 1px solid; border-radius: 50%; background-color: #6969ff; border-radius: 50%;">
			<a href="#content" style="display: block; height: 100%; line-height: 50px; color: white;">TOP</a>
		</div>
		
		<br /><br /><br /><br />
		
		<div id="review">
			<div style="height: 80px; text-align: left;">
				<div style="height: 20px; font-size: 20px; line-height: 20px;">상품리뷰</div>
				<div class="checked" style="height: 30px; font-size: 30px; line-height: 30px;">
					★★★★★
				</div>
			</div>
			
			
			
			
			<div style="border-bottom: 1px solid; height: 1px; margin-bottom: 20px; margin-right: 20px;"></div>
			<c:forEach items="${page.list }" var="vo">
				<div style="height: 200px; text-align: left;">
					<span style="height: 20px; font-size: 20px; line-height: 20px;">${vo.user_id }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<span>${vo.rev_date }</span>
						<div style="height: 30px; font-size: 20px; line-height: 30px;" id="myform">
							<fieldset>
								<div class='align'>
									<c:forEach begin="1" end="${vo.rev_grade }">
										<span class='checked'>★</span>
									</c:forEach>
									<c:forEach begin="${vo.rev_grade+1}" end="5">
										<span class='unchecked'>★</span>
									</c:forEach>
								</div>
								</fieldset>
						</div>
					<div style="height: 20px; font-size: 20px; line-height: 20px;">판매자 : AnaFor</div>
					<div
						style="height: 100px; margin-top: 10px; border-bottom: 1px solid; margin-right: 20px;">
						${vo.rev_content }
					</div>
				</div>
			</c:forEach>
		</div>
		
		
		
		<form action="box.pr" method="post">
			<input type="hidden" name="curPage" value="1" />
				<jsp:include page="/WEB-INF/views/include/page.jsp" />
		</form>
		</div>
</body>
</html>