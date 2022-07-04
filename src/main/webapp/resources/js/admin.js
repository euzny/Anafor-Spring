/* 공통 스트립트 : 입력 항목 확인
 * 입력한 내용이 없을 경우 저장 불가 처리
 */
 
//script.js
$(document).ready(function(){
	//menu v1 
	$(".menu-v1").mouseover(function(){
		$(this).children(".submenu").stop().slideDown();
	});
	$(".menu-v1").mouseleave(function(){
		$(this).children(".submenu").stop().slideUp();
	});
	
	//menu v2
	$(".menu-v2").mouseover(function(){
		$(this).children(".submenu").show(200);
	});
	$(".menu-v2").mouseleave(function(){
		$(this).children(".submenu").hide(200);
	});
	
});
