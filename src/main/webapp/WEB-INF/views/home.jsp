<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/slick.css">
  <link rel="stylesheet" type="text/css" href="css/slick-theme.css">
	
   
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />

   
    <title>아나포</title>   
   
    
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js" type="text/javascript"></script>
  <!--  <script type="text/javascript" src="js/home.js"></script>
  
 -->
 




   
   <!-- header -->
   <style>
html, body{min-height: 100%; height: 100%;}



   #wrap{width:100%;height:auto}
   
   #header{width:100%;height:493px;background: url("imgs/header_bg.png") 95% bottom #696aad no-repeat;position:relative}
   #header .text_box{position:absolute;left:60px;top:160px}
   #header .text_box h3{font-size:56px;font-weight:200;color:#fff;line-height:64px;margin-bottom:10px;position: relative;}
   #header .text_box h3::after{content:'';display:block;height:1px;width:200px;background:#fff;position: absolute;top:32px;right:-240px}
   #header .text_box p{font-size:20px;color:#fff;line-height:24px;font-weight:200}
   #header .btn_app{position: absolute;left:60px;bottom:90px}
   #header .btn_app a{width:200px;height:55px;display:block;border-radius:55px;overflow:hidden;}
   #header .btn_app a img{width:100%}
   
   /* top */
   #top{width:100%;height:800px;margin:50px 0;position:relative}
   #top::before{content: '';display:block;position:absolute;height:100%;width:100%;background:#696aad;left:calc(50% - 400px);transform: translate(-50%, 0);margin-left:-50%}
   #top .view_box{height:755px;width:1257px;margin:0 auto;position:relative;padding-top:30px}
   #top .view_box .phone_box{width:375px;height:755px;box-sizing:border-box;padding:80px 15px 90px 10px; background: url("imgs/phoneview.png") no-repeat; background-size: 370px; position:relative}
   #top .view_box .phone_box ul{display:block;width:100%;height:590px;background:red;overflow:hidden}
   #top .view_box .phone_box section{display:block;width:100%;height:590px;background:red;overflow:hidden}
   #top .view_box .phone_box li{display:inline-block}
   #top .view_box .phone_box li img{width:100%}
   #top .view_box .text_box{position:absolute;top:150px;right:60px}
   #top .view_box .text_box p:nth-of-type(1){font-size:30px;line-height:75px;padding-bottom:20px}
   #top .view_box .text_box p:nth-of-type(2){font-size:56px;line-height:58px;font-weight:700}
   #top .view_box .text_box .page_text{position: absolute; top: 300px; left: 0px;}
   #top .view_box .btn{width:200px;height:100px;position:absolute;bottom:118px;right:350px}
   #top .view_box .btn li{display:inline-block;float:left;position:relative}
   #top .view_box .btn li:last-child{margin-left:-1px}
   #top .view_box .btn a{display:block;width:100px;height:100px;border:1px solid #776f67;background: url("imgs/arrow.png") center 50% #fff no-repeat;background-size:35px}
   #top .view_box .btn a.btn_prev{transform: rotate(180deg);}
   #top .view_box .btn a span{display:none}

   #wrapj{width:100%;height:auto}
   
   /* jungle */
   #jungle{width:100%;height:730px;background: url("imgs/jungle_bg.png") 100% 40px #e0e0e0 no-repeat;position:relative}
   #jungle .text_jungle{position: absolute;left: 87px; top: 130px; text-align: left;}
   #jungle .text_jungle h3{font-size: 34px;font-weight: 600;line-height: 44px;position: relative;}
   #jungle .text_jungle b{color: #696aad;}
   #jungle .text_jungle p{font-size: 24px;line-height: 24px;}
   #jungle .img_jungle{position: absolute;left: 60px;bottom: 30px;}
   
   /* mid */
   #mid{width:100%;height: 900px; background: url("imgs/mid_img.png") center no-repeat;position: relative;display: block;margin: 0px auto; box-sizing: border-box; margin-top: 30px;margin-bottom: 100px;}
   
   /* bottom */
   #wrapb{width:100%;height:auto}
   
   #bottom{width:100%;height:260px;background: #f5f5f5;position:relative;box-sizing: border-box;}
   #bottom .text_bot{position:absolute;left:60px;top:50px;text-align: left;}
   #bottom .text_bot h3{font-size:28px;font-weight:800;color:#696aad;line-height: 60px;}
   #bottom .text_bot p{font-size:24px;color:#000; line-height: 30px; font-weight:200;margin: 0px auto;}
   #bottom .btn_appbot{position: absolute;right:120px;bottom:90px;}
   #bottom .btn_appbot a{width:200px;height:55px;display:block;border-radius:55px;overflow:hidden;border: 2px solid #696aad;}
   /* #bottom .btn_appbot a img{width:100%}
   #bottom .btn_appbot a img{background: center;  position:absolute; } */
   
   </style>
   
   
   
   
   
</head>

<body>

<div id="wrap">

   <!-- header -->
   <div id="header">
      <div class="text_box">
         <h3>나는 오늘 <b>아나포</b></h3>
         <p>병원/약 성분 찾기부터 모바일 상담/계획 관리까지</p>
      </div>
      <div class="btn_app">
         <a href=""><img src="imgs/btn_app.png"></a>
      </div>
   </div>
   <!-- // header  -->
   
   <!-- top -->
   <div id="top">
      <div class="view_box">
         <div class="phone_box">
            <!-- <ul class="slides">
               <li><img src="https://findin.co.kr/wp-content/uploads/2021/11/1-1.png" alt="1"></li>
               <li><img src="imgs/box.png" alt="2"></li>
               <li><img src="https://findin.co.kr/wp-content/uploads/2021/11/1-1.png" alt="3"></li>
            </ul> -->
            <section class="lazy1 slider" data-sizes="50vw">
			    <div><img  src="imgs/pagea.png"/></div>
			    <div><img  src="imgs/pageb.png"/></div>
			    <div><img  src="imgs/pagec.png"/></div>
			    <div><img  src="imgs/paged.png"/></div>
			    <div><img  src="imgs/pagee.png"/></div>
			</section>
         </div>
         <div class="text_box">
            <div class="text1" id="text1">
               <p>나와 가까운 병원찾기부터 스마트하게 약 관리까지!</p>
               <p>건강이 편해지다.</p>
            </div>
			<div class="page_text"><img src="imgs/pagetext.png" alt="text" /></div>            
         </div>
         <!-- <div class="btn">
            <ul>
               <li><a class="btn_prev"onclick="btn_prev()"><span>이전</span></a></li>
               <li><a class="btn_next"onclick="btn_next()"><span>다음</span></a></li>
            </ul>
         </div> -->
      </div>
   </div>
   <!-- // top -->

<div id="wrapj">   
   <!-- jungle -->
   <div id="jungle">
      <div class="text_jungle">
         <h3><b>AnaFor</b> 앱으로 스마트한 건강관리하세요</h3>
         <p>나의 일상생활에 딱맞게 울리는 복약알림, AnaFor 띵동!</p>
      </div>
      <div class="img_jungle">
         <img src="imgs/jungle_con.png">
      </div>
   </div>
   <!-- // jungle -->
</div>   
   <!-- mid -->
   <div id="mid">
      <div>
         
      </div>
   </div>
   <!--// mid —> -->

   <!-- bottom -->
   <div id="wrapb">
      <div id="bottom">
         <div class="text_bot">
            <h3>AnaFor</h3>
            <p><b>아픈</b> 나를 위한</p>
            <p><b>아나포</b>를 지금<b>만나보세요!</b></p>
         </div>
       
         <div class="btn_appbot">
            <a href=""><img src="imgs/btn_app.png"></a>
         </div>
      </div>   
   </div>
   <!--// bottom -->
   

  
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="js/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">


	 $(".lazy1").slick({
	        lazyLoad: 'ondemand', // ondemand progressive anticipated
	        infinite: true,
	        autoplay: true,
	          autoplaySpeed: 3000
	       
	      });
	 /*   prevArrow : $('.prevArrow'), 
     nextArrow : $('.nextArrow') */

	
</script>

<script>
var result = '${result}';
if (result === 'OK') {
	alert("주문이 정상적으로 처리되었습니다.");
}
</script>

</div>

</body>
</html>