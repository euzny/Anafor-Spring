<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#AnaforTempPW{
		margin:0px auto;
		width:60%;
		height:718px;
		pointer-events:auto;
		text-align:left;
	}
	
	h2{
		font-size:30px;
		width:400px;
		margin:40px 0px 20px 0px;
		height:40px;
	}
	input[type=text], input[type=password]{
		width:500px;
		height:50px;
		margin:10px 0px 0px 0px;
		border-radius:10px;
		padding: 0px 20px;
		border:1px solid #ccc;
		line-height:50px;
	}
	
	input[type=button]{
		width:120px;
		height:50px;
		color:#696AAD;
		background: white;
		font-weight:600;
		border-radius:10px;
		border:1px solid #ccc;
		margin:10px 0px 0px 0px;

	}
	
	input[type=button]:hover{
		cursor:pointer;
		border:1px solid #696AAD;
	}
	
	input[type=text]:focus{
		border:2px solid #696AAD;
	}
	span{
		display:block;
		margin:5px 0px;
		font-size:13px;
	}
</style>
</head>
<body>
	<div id="AnaforTempPW">
		<h2>임시비밀번호 발급</h2>
		<input type="text" id="id"  placeholder="가입한 이메일을 입력해주세요"/>
		<input type="button" value="임시비밀번호 발급" onclick="sendPw()"><br/>
	</div>
	
<script>
	function sendPw(){
		if($('#id').val()==''){
			alert("이메일을 먼저 입력해주세요");
			$('#id').focus();
			return;
		}
		$.ajax({					//ajax 통신
			url: 'sendTempPW',
			data : {id:$('#id').val()},
			success : function(response){
					if(response){
						alert("임시 비밀번호가 발급되었습니다.\n해당 메일함을 확인해주세요.\n로그인 페이지로 이동합니다.");
						location = "<c:url value='userLogin' />";
					}else{
						alert("해당 이메일은 가입되지 않은 이메일입니다. 이메일을 다시 입력해주세요");
						$('#id').focus();
					}
			}, error : function(req,text){
				alert(text+' : '+req.status);
			}
		});//ajax
	}
</script>	
</body>


</html>