<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 	#header {
	   width:100%;
	   height:60px;
	   padding: 20px;
	   background-color:#929292;
	   border-bottom: 1px solid white; 
	}	
	#header h3{
	   font-size: 25px;
	   font-weight: bold;
	   text-align: left;
	   color: white;
	}
	
	#notice{
		position: absolute; left: 50%; top: 40%;
		transform:translate(-50%, -50%);
	}
	#notice h3{
	   font-size: 20px;
	   font-weight:600;
	   margin-bottom:10px;
	   text-align:left;
	}
	#notice pre{
		margin-bottom:8px;
		 text-align:left;
	}
	#nocircle {
		font-size:40px;
		margin-bottom:20px;
		color:#696AAD;
	}

   	</style>
</head>
<body>
<div id="header">
  	<h3>약통위치경로</h3>
</div>
<div id="notice">
	<i class="fa-solid fa-circle-exclamation" id="nocircle"></i>
	<h3>죄송합니다. 약통위치경로 페이지를 확인하실 수 없습니다.</h3>
		<pre>현재 회원님의 정보에 아나포 스마트 약통 기기번호가 등록되어있지 않습니다.</pre>
		<pre><strong>Anafor</strong> 모바일 앱에서 기기번호를 등록하신 후 이용해주시기 바랍니다.</pre>
		<br>
		<pre>관련 문의사항은 <strong>AnaFor 고객센터</strong>에 알려주시면 친절하게 안내해 드리겠습니다.</pre>
</div>		
</body>
</html>