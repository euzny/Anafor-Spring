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
	#spanid,#id{ color:#696AAD; font-weight:800;}
	#spanid { margin-left:60px; }
	#msg_user{width:80%; height:40px; margin-top:40px; text-align:left; margin-left:100px; }
	table{
		width:80%;
	}
	td{
		text-align:left;
		padding-left:10px;
	}
	input[type="password"]{
		border:1px solid #ccc;
		width:250px;
		height:25px;
	}
	input[type="button"]{
		width:150px;
		height:40px;
		margin-right:10px;
		margin-top:30px;
		border-radius:5px;
		font-size:15px;
		color:#FFFFFF;
		cursor:pointer;
	}
	
	input[type="button"]:nth-child(1){
		background:#696AAD;
	}
	input[type="button"]:nth-child(2){
		color:#000000;
	}
	
</style>
</head>
<body>
	<div id="header">
  		<h3>회원정보 확인</h3>
	</div>
	<div id = "msg_user">
		<span id="spanid">${loginInfo.user_name}</span>
		<span>&nbsp;님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.(* 소셜로그인의 경우 비밀번호란에 아이디를 그대로 입력하시면 됩니다.)</span>
		<input type="hidden" name="userid" id="userid" value="${loginInfo.user_id}"/>
	</div>
		<table>
			<tr>
				<th>아이디</th>
				<td id="id">${loginInfo.user_id }</td>
			</tr>		
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userpw" id="userpw" onkeypress="if (event.keyCode == 13) checkpw()" /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center; border:0px"><input type="button" value="확인" onclick="checkpw()"/><input type="button"  value="취소"/></td>
			</tr>
		</table>
<script>


function checkpw(){
	$.ajax({					//ajax 통신
	
		url: 'userLoginChk' ,
		data : {user_id:$("#userid").val(), user_pw:$("#userpw").val()},
		success : function(response){
			if(response){
				alert("회원정보페이지로 이동합니다.");
				location = "userinfo.ur";
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#userpw").focus();
			}
		}, error : function(req,text){
			alert(text+' : '+req.status);
		}
	});//ajax

}

	

</script>		
</body>
</html>