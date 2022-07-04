<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 주문목록</title>
<style type="text/css">

.product {
   width: 1451px;  
   background: white;
}

.product_textarea {
   position: absolute;
   width: 1240px;
   height: 40%;
   top: 70px;
}

.product #product_text::after {
   content:'';
   display:block;
   height: 1.5px;
   width: 1000px;
   background: #888888;
}

#product_text {
   position: absolute; 
   width: 141px; 
   height: 50px; 
   left: 248px; 
   font-weight: bold; 
   font-size: 20px; 
   line-height: 50px;
}

.product #detail::after {
   content:'';
   display:block;
   height: 1.5px;
   width: 1000px;
   background: #888888;
}

#box_text {
   position: absolute;
   width: 593px; 
   height: 50px; 
   left: 222px; 
   top: 100px; 
   font-weight: bold; 
   font-size: 17px; 
   line-height: 50px; 
   letter-spacing: -0.05em;
}

#price {
   position: absolute; 
   width: 147px; 
   height: 50px; 
/*    left: 279px;  */
   left: 300px; 
   top: 130px; 
/*    font-weight: bold;  */
/*    font-size: 17px;  */
/*    line-height: 50px;  */
/*    letter-spacing: -0.05em;  */
/*    color: red; */
}

.money_result {
/*    position: absolute;  */
/*    width: 147px;  */
/*    height: 50px;  */
/*    left: 279px;  */
/*    top: 130px;  */
   font-weight: bold; 
   font-size: 17px; 
   line-height: 50px; 
   letter-spacing: -0.05em; 
   color: red;
   text-align: left;
}




#cnt {
   position: absolute; 
   width: 147px; 
   height: 50px; 
/*    left: 258px;  */
   left: 300px; 
   top: 160px; 
   font-weight: bold; 
   font-size: 16px; 
   line-height: 50px; 
   letter-spacing: -0.05em;
}


.cnt {
/* 	position: absolute; */
	width: 50px;
	height: 25px;
/* 	left: 1445px; */
/* 	top: 485px; */
	font-size: 16px;
	text-align: center;
}

.order_detail {
   position: absolute; 
   width: 1239px; 
   height: 350px;  
   top: 300px;
}

#detail {
   position: absolute; 
   text-align: left;
   width: 150px; 
   height: 50px; 
   left: 148px; 
   font-weight: bold; 
   font-size: 20px; 
   line-height: 50px; 
   letter-spacing: -0.05em;
}

.order_detail_category {
   position: absolute; 
   width: 127px; 
   height: 237px; 
   left: 150px; 
   top: 360px; 
   line-height: 50px; 
   letter-spacing: -0.05em;
}

#person_receive_text {
   font-size: 14px; 
   font-weight: bold;
   letter-spacing: 0.5px;
}

#phone_text {
   font-size: 14px; 
   font-weight: bold;
   letter-spacing: 0.5px;
}

.addr_receive_text {
   font-size: 14px; 
   font-weight: bold;
   letter-spacing: 0.5px;
}

#post_code {
   position: absolute; 
   background: #696aad; 
   color: white; 
   width: 80px; 
   height: 25px; 
   left: 150px; 
   top: 110px; 
   cursor: pointer; 
   border: none; 
   letter-spacing: 0.7px; 
   font-size: 13px;
}

#default_addr_text {
   position: absolute; 
   left: 545px; 
   font-size: 11px; 
   color: #808080; 
   width: 60px; 
   top: 127px;
}

#detail_addr_text {
   position: absolute; 
   left: 550px; 
   font-size: 11px; 
   color: #808080; 
   width: 60px; 
   top: 158px;
}

#delivery_request_text {
   position: absolute; 
   top: 196px; 
   left: 30px; 
   font-size: 14px; 
   font-weight: bold;
}

#textarea {
   position: absolute;    
   border: 1px solid #d5d5d5; 
   top: 210px; 
   left: 150px; 
   width: 400px; 
   height: 25px; 
   resize: none; 
   font-size: 12px;
}

#payment_text {
   position: absolute; 
   width: 85px; 
   height: 46px; 
   top: 250px; 
   font-weight: bold; 
   font-size: 20px; 
   line-height: 50px; 
   letter-spacing: -0.05em; 
   text-align: left;
}

#payment_text::after {
   content:'';
   display:block;
   height: 1.5px;
   width: 1000px;
   background: #888888;
}

#bank_text {
   position: absolute; 
   height: 46px; 
   top: 300px; 
   font-size: 13px; 
   line-height: 50px; 
   letter-spacing: -0.05em; 
   font-weight: bold;
}

#bank_text::after {
   content:'';
   display:block;
   height: 1.5px;
   width: 1000px;
   background: #888888;
}

#total_result_text {
   font-weight: bold; 
   font-size: 14px;
}

#delivery_text {
   font-weight: bold; 
   font-size: 14px; 
   margin-right: 30px;
}

#total_detail_price {
   font-weight: bold; 
   font-size: 14px; 
   color: red; 
   letter-spacing: 0.2px;
}

#delivery_detail {
   font-weight: bold; 
   font-size: 14px;
}

#bank_number_text {
   font-weight: bold; 
   font-size: 14px; 
   margin-left: 10px; 
   text-align: left; 
   margin-top: 5px;
}

#total_detail_result_text {
   font-weight: bold; 
   font-size: 14px; 
   margin-left: 10px; 
   text-align: left; 
   margin-top: -5px;
}

#bank_number {
   font-size: 14px; 
   margin-left: 10px; 
   letter-spacing: 0.5px; 
   color: black; 
   font-weight: bold;
}

#total_detail_result {
   font-weight: bold; 
   font-size: 14px; 
   margin-left: 35px; 
   letter-spacing: 0.5px; 
   color: red; 
   margin-top: -5px; 
   font-size: 16px; 
}

#total_detail_result::after {
   content:'';
   display:block;
   height: 1.5px;
   margin-left: -864px;
   margin-top: -9px;
   width: 1000px;
   background: #888888;
}

.order_result {
   position: absolute; 
   width: 350px; 
   height: 60px; 
   left: 760px; 
   top: 1020px; 
   background: #696aad; 
   border-radius: 10px; 
   border: none; 
   font-size: 17px; 
   color: white;"
}

#order_situation_text {
   position: absolute; 
   width: 123px; 
   height: 46px; 
   top: 475px; 
   font-weight: bold; 
   font-size: 20px; 
   line-height: 50px; 
   letter-spacing: -0.05em; 
   text-align: left;
}

.active {
	background: #696aad;
}

.active img {
	filter : brightness(2.5);
}
.active p{
	color: #fff;
}

</style>
</head>
<body>

<form action="order_update.my" method="post">
<input type="hidden" name="id" value="${vo.id }" />
<div class="product">

	<div style="position: absolute; width: 100%; height: 59px; background: #929292;">
		<p style="position: absolute; width: 106px; left: 20px; top: 20px; font-weight: bold; font-size: 21px; letter-spacing: 0.5px; color: white;">주문 수정</p>
	</div>
	
	<div style="position: absolute; width: 1000px; height: 45px; left: 146px; top: 90px; background: #E5E5E5;">
		<p style="position: absolute; width: 90px; height: 25px; left: 450px; top: 10px; font-weight: bold; font-size: 22px; line-height: 27px;">상품정보</p>
	</div>
	
   <div class="product_textarea">
      <img src="imgs/shopbox.png" style="position: absolute; width: 150px; height: 140px; left: 146px; top: 80px; border-radius: 11px;">
      <p id="box_text">아나포 스마트 약통 AnaFor Smart IoT 알약/영양제</p>  
      
      <input type="hidden" name="price" value="30000"/>    
      <p id="price"><span class="money_result"><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></span></p>
      
      <p id="cnt"><input class="cnt" type="text" value="${vo.cnt }" name="cnt" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="border: 1px solid #808080;">개</p>
   </div>
   
   <div class="order_detail">
      <p id="detail">주문자 정보 입력</p>
   </div>

   <div class="order_detail_category">
      <p id="person_receive_text">*받는사람</p>
      <input type="text"  name="name" id="person_receive" style="position: absolute; width: 105px; height: 25px; left: 150px; top: 10px; border: 1px solid #d5d5d5; border-radius: 5px; font-size: 12px" autofocus  />
      
      <p id="phone_text">*연락처</p>
      <input id="phone" value="${vo.tel }" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" type="text" name="tel" maxlength="11" style="position: absolute; width: 105px; height: 25px; left: 150px; top: 60px; border: 1px solid #d5d5d5; border-radius: 5px;"/>
      <span id="telmsg" style="position: absolute; width: 300px; height: 25px; left: 250px; top: 48px; font-size: 12px;">' - ' 를 제외하고 번호만 입력해주세요 예)01012345678</span>
      
      <p class="addr_receive_text">*받는주소</p>
      <button type="button" id="post_code" onclick="daum_post()">우편번호</button>
         <input type="text" name="addr_post" value="${vo.addr_post }" style="border: 1px solid #d5d5d5; position: absolute; left: 240px; top: 110px; height: 25px; width: 60px; text-align: center"/><br />
         <p id="default_addr_text">기본주소</p>
         <c:set var="address" value="${fn:split(vo.addr, ',')}" />
         <input type="text" id="default" value="${ address[0] }" name="addr" readonly style="border: 1px solid #d5d5d5; position: absolute; left: 150px; top: 140px; height: 25px; width: 400px;"/><br/>
         <p id="detail_addr_text">나머지주소</p>
         <input type="text" name="addr" value="${address[1]} ${address[2]}" style="border: 1px solid #d5d5d5; position: absolute; left: 150px; top: 170px; height: 25px; width: 400px; font-size: 12px;"/><br/>
   
      <p id="delivery_request_text">배송요청사항</p>
      <input style="border: 1px solid #d5d5d5;" id="textarea" name="coment" value="${vo.coment }" />
      
      <p id="payment_text">결제 수단</p>
      <p id="bank_text">농협은행(무통장입금)</p>
      
      <div style="position: absolute; width: 400px; height: 93px; left: 600px; top: 302px; background: #C4C4C4;">
         <div style="width: 93px; height: 93px; left: 987px; top: 866px;">
            <p id="total_result_text">총 상품가격</p>
            <p id="delivery_text">배송비</p>
         </div>
         
         <div style="position: absolute; width: 86px; height: 93px; left: 300px; top: -1px; letter-spacing: 0.2px; ">
<%--             <p id="total_detail_price"><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></p> --%>
            <p id="total_detail_price"><span class="money_result"><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></span></p>
            <p id="delivery_detail">무료</p>
         </div>
      </div>
      
      <div style="position: absolute; width: 400px; height: 93px; left: 600px; top: 395px; background: #C4C4C4;">
         <div style="height: 93px; left: 987px; top: 916px;">
            <p id="bank_number_text">농협은행(무통장입금)</p>
            <p id="total_detail_result_text">총 결제금액</p>
         </div>
         
         <div style="position: absolute; width: 187px; height: 86px; left: 228px; top: 6px;">
            <p id="bank_number">356-0769-1562-03</p>
<%--             <p id="total_detail_result"><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></p> --%>
            <p id="total_detail_result"><span class="money_result"><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></span></p>
         </div>
      </div>
      
      <div style="position: absolute; left: 400px; top: 500px; width: 100%;" >
      	<a class='btn-fill' onclick="emptyCheck()" style="border-radius: 5px; margin: 10px;">수정</a>
      	<a class='btn-empty' href="shopDetail.my?id=${vo.id }" style="border-radius: 5px;">취소</a>
      </div>
   </div>
</div>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function daum_post() {
	   
	   new daum.Postcode({
	      oncomplete: function(data) {
	         $("[name=post]").val(data.zonecode);
	         
	         // 지번, 도로명 구분
	         var addr = data.userSelectedType == "J" ? data.jibunAddress : data.roadAddress;   // 선택 한 것이 J 인지 (Jibun 지번)
	         // name 이 addr 인 태그의 0 번지에 addr 값을 할당
	         
	         // 건물명이 있을 경우 기존 주소의 건물명 값을 추가
	         if(data.buildingName != "") addr += '(' + data.buildingName + ')';
	           
	         $("[name=addr]").eq(0).val(addr);
	      }
	   }).open();
	}

$(document).ready(function () {
	$(".cnt").on("keyup", function() {
		var total = (30000 * $('.cnt').val());
	    $("[name=price]").val(total);
	    total = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	    $(".money_result").text(total + "원");
	});
});

function emptyCheck() {
	
	var regname = /[^가-힣a-zA-Z]/g;
	
	var person = $("#person_receive").val();
	if(person == ""){
		alert("받는 사람을 입력해주세요.");
		$("#person_receive").focus();
		return false;
		
	} else if(regname.test(person)) {
		alert("이름은 한글 또는 영문으로 입력해주세요.");
		$("#person_receive").focus();
		return false;
	} 
	else if ($("#phone").val() == ""){
		alert("연락처를 입력해주세요.");
		$("#phone").focus();
		return false;
	
	} 
	else if ($("#default").val() == ""){
		alert("주소를 입력해주세요.");
		$("#default").focus();
		return false;
	}
	else {
	    $("form").submit();
// 		alert("주문이 정상적으로 처리되었습니다."); → home.jsp 에 script 
// 	    location.href="/anafor" controller redirect 에 미리 지정해주었음
	}
}

/* function chkCharCode(event) {
   const regExp = /[0-9]/g;
   const ele = event.target;
   if (regExp.test(ele.value)) {
     ele.value = ele.value.replace(regExp, '');
   }
}; */

// 1번째 input 태그 처리
const $input = document.getElementById('person_receive');
$input.value = "${vo.name }"; // 새로 value를 설정 해줘야 커서가 뒤로 간다.

</script>
</body>
</html>