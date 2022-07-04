<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
<style type="text/css">
.wrap {
	width: 1638px;
	height: 759px;
	left: 0px;
	top: 60px;
}

.img {
	width: 796px;
	height: 569px;
	left: 50px;
	top: 106px;
	position: absolute;
}

.text_div {
	position: absolute;
	width: 600px;
	height: 50px;
	left: 932px;
	top: 130px;
}

#name {
	font-weight: bold;
	font-size: 22px;
	line-height: 50px;
	text-align: left;
}

#name::after {
	content: '';
	display: block;
	height: 2px;
	width: 698;
	background: #888888;
}

#price {
	color: red;
}

.a {
	position: absolute;
	width: 80px;
	height: 250px;
	line-height: 50px;
	left: 947px;
	top: 205px;
	text-align: left;
}

.a p {
	font-size: 18px;
	font-weight: bold;
}

.b {
	position: absolute;
	width: 230px;
	height: 250px;
	left: 1090px;
	top: 205px;
	line-height: 50px;
	text-align: left;
}

.b p {
	font-size: 16px;
	color: black;
}

.c {
	position: absolute;
	width: 598px;
	height: 99px;
	left: 932px;
	top: 470px;
	border: 1px solid #CCCCCC;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 10px;
}

.cnt {
	position: absolute;
	width: 50px;
	height: 25px;
	left: 1445px;
	top: 485px;
	font-size: 16px;
	text-align: center;
}

.c #line {
	line-height: 50px;
	text-align: left;
	font-size: 16px;
	margin-left: 15px;
	font-weight: bold;
}

.c #line::after {
	content: '';
	display: block;
	height: 1px;
	width: 570px;
	background: #888888;
}

.order {
	position: absolute;
	width: 460px;
	height: 80px;
	left: 1000px;
	top: 595px;
	background: #696aad;
	border-radius: 20px;
	color: white;
	border: none;
	font-size: 17px;
	cursor: pointer;
}

.buy_insert {
	position: absolute;
	width: 200px;
	height: 80px;
	left: 1250px;
	top: 595px;
	background: #808080;
	border: none;
	border-radius: 20px;
	color: white;
	font-size: 17px;
	cursor: pointer;
}

.total {
	position: absolute;
	width: 180px;
	height: 18px;
	left: 1339px;
	top: 542px;
}

.total_price {
	font-weight: bold;
	font-size: 16px;
	line-height: 20px;
	margin-right: 80px;
}

.money {
	position: absolute;
	width: 200px;
	height: 18px;
	left: 1330px;
	top: 542px;
}

.money_result {
	font-weight: bold;
	font-size: 17px;
	line-height: 20px;
	margin-left: 110px;
	color: red;
}

/* Chrome, Safari, Edge, Opera */
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}
</style>

</head>
<body>

<form action="a.pr" method="post">

   <div class="wrap">
      <div class="img">
         <img src="imgs/shopbox.png">
      </div>
      
      <div class="text_div">
         <p id="name" >아나포 스마트 약통 AnaFor Smart Box IoT 알약 / 영양제 박스</p>
      </div>
      
      <hr/>
      
      <div class="a">
         <p>상품가격</p>
         <p>배송안내</p>
         <p>모델명</p>
         <p>제조회사</p>
         <p>원산지</p>
      </div>
      
      <div class="b">
         <p id="price">30,000원</p>
         <p>무료 배송</p>
         <p>AnaFor Smart Box Model 1</p>
         <p>AnaFor</p>
         <p>대한민국</p>
      </div>
      
      <div class="c">
         <p id="line">아나포 스마트 약통 AnaFor Smart Box IoT Model 1</p>
      </div>
      
      <input class="cnt" type="number" value="1" name="bk_cnt" style="border: 1px solid #808080;"><p style="position: absolute; width: 50px; height: 25px; left: 1480px; top: 488px;">개</p>
      
      <div class="total">
         <p class="total_price">총 상품 금액</p>
      </div>
      
      <div class="money">
         <input type="hidden" name="bk_price" value="30000"/>
           <p class="money_result"><fmt:formatNumber value="30000" pattern="#,##0원" /></p>
      </div>
      
   </div>
	   <button type="button" class="order" onclick="order()">주문하기</button>
	   <!-- <button type="button" class="buy_insert" onclick="basket()">장바구니담기</button> -->
</form>


<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">

$(document).ready(function () {
   $(".cnt").on("keyup", function() {
      var total = (30000 * $('.cnt').val());
      $("[name=bk_price]").val(total);
      total = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
      $(".money_result").text(total + "원");
   });
});

function order() {
	 
	var loginInfo ="${sessionScope.loginInfo}";
	
	if (loginInfo != ""){
		
		if ($('.cnt').val() == 0 || $('.cnt').val() == "") {
		       alert("수량을 입력하세요.");
		       $('.cnt').focus();
		       return;
		}
		else{
		   alert("주문 페이지로 이동합니다.");
		   $("form").submit();
		}
	} 
	else{
		alert("로그인 후 이용하실 수 있습니다.");
		location = "<c:url value='userLogin'/>";
	}
}

function basket() {
	 
	var loginInfo ="${sessionScope.loginInfo}";
	
	if (loginInfo != ""){
		if ($('.cnt').val() == 0 || $('.cnt').val() == "") {
		       alert("수량을 입력하세요.");
		       $('.cnt').focus();
		       return;
		}
		else{
		   alert("장바구니로 이동합니다.");
		   $("form").attr("action", "b.pr");
		   $("form").submit();
		}
	}
	else{
		alert("로그인 후 이용하실 수 있습니다.");
		location = "<c:url value='userLogin'/>";
	}
}

</script>
</body>
</html>