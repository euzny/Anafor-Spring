<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />
<style type="text/css">

	body{
		text-align:left;	
	}

	.Anaforcenter{
		position: absolute; left: 50%; top: 50%;
		transform:translate(-50%, -50%);
	}
	
	#AnaforLogo{
		margin-bottom:10px;
		text-align:center;
	}

	#login{
		text-align:center;
	}
	
	 #socialLogin{
		text-align:center;
	} 
	
	img{
		width:200px;
		height:45px;
	}
	input[type=text], input[type=password]{
		width:400px;
		height:50px;
		margin:10px 0px 0px 0px;
		border-radius:10px;
		padding: 0px 45px;
		border:1px solid #ccc;
		line-height:50px;
	}
	
	#alogo:hover{
		cursor:pointer;
	}
	
	input[type=text]:focus, input[type=password]:focus{
		border:2px solid #696AAD;
	}
	
	#btn-login{
		width:400px;
		height:50px;
		background-color: #696AAD;
		border-radius:10px;
		text-align:center;
		font-size:20px;
		color:#FFFFFF;
		font-weight:400;
		padding:3px 7px;
		border:0px;
		margin:10px;
	}
	
	#btn-login:hover{
		cursor: pointer;
	}

 	#centerdiv{
		width:100%;
		margin:0px auto;
		height:30px;
	} 
	
	.sepline{
		display:flex;
		flex-basis:100%;
		align-items:center;
		color:rgba(0,0,0,0.35);
		font-size:16px;
		margin:8px 0px;
	}
	.sepline::before, .sepline::after{
		content:"";
		flex-grow:1;
		background : rgba(0,0,0,0.35);
		height:1px;
		font-size:0px;
		line-height:0px;
		margin:0px 16px;
	}
	
	#alogo{
		width:242px;
		height:78px;
		text-align:center;
		color:#696AAD;
		letter-spacing:-0.015em;
		font-weight:800;
		font-size:64px;
		font-style:normal;
		font-family: 'Montserrat';
	}
	
	#alogotitle{
		width:197px;
		height:26px;
		text-align:center;
		color:#696AAD;
		letter-spacing:-0.015em;
		font-weight:600;
		font-size:16px;
	}
	
	#usericon{
		position: absolute;
		top:94px;
		left:28px;
		font-size:20px;
	}
	
	#pwicon{
		position: absolute;
		left:28px;
		top: 150px;
		font-size:20px;
	} 
	
	#check{
		width:420px;
		height:60px;
	}
	
	#checkmsg{
		display:block;
		line-height:60px;
		margin:10px 10px 0px 10px;
		color:#FF0000;
		visibility: hidden;
		font-size:12px;
	}

	#find{
		width:93%;
		height:auto;	
		}
	#find ul{
		height:40px;
		margin-top:15px;
		text-align:center;
	}
	#find ul li{
		display:inline-block;
		color:#808080;
		font-size:12px;
	}
	#find ul li a span{
		font-size:12px;
		color:#808080;
	}
	
	
</style>

</head>

<body>
	<div class="Anaforcenter">
		<div id="AnaforLogo">
			<span id="alogo">AnaFor</span><br/>
			<span id="alogotitle">아픈 나를 위해 아나포</span>
		</div>
		<div id="login">
			<input type="text" id="userid" placeholder="이메일을 입력하세요" onkeyup="chkCharCode(event)" autofocus/>
			<i class="fa-solid fa-user" id="usericon"></i><br/>
			<input type="password" id="userpw" placeholder="비밀번호를 입력하세요" onkeypress="if (event.keyCode == 13) loginChk()" />
			<i class="fa-solid fa-lock" id="pwicon"></i><br/>
		</div>
			<div id="check">
			<span id="checkmsg"> 아이디 혹은 비밀번호가 일치하지 않습니다.</span>
			</div>
		<div id="login">	
			<input type="button" id="btn-login" onclick="loginChk()" value="로그인"/>
		</div>
		<div id="centerdiv">
			<div class="sepline">또는</div>
		</div>
		
		<div id="socialLogin">
			<a href="naverLogin"><img src="imgs/naver_login.png" class="social"/></a>
			<a href="kakaoLogin"><img src="imgs/kakao_login.png" class="social"/></a>
		</div>
		<div id="find">
			<ul>
				<li><a id="findpw" href="findpw"><span>비밀번호 찾기</span></a></li>
				<li>|</li>
				<li><a id="join" href="userJoin"><span>회원가입</span></a></li>
			</ul>
   </div>
	</div>
	
	
<script type="text/javascript">
	//로그인 유효성 함수
	function loginChk(){
		
		if($("#userid").val()==''){	//아이디를 입력하지 않았을 때
			$("#userid").focus();
			$("#checkmsg").text("아이디를 입력해주세요").css('visibility','visible');
		
			return false;
		
		}else if($("#userpw").val()==''){//비밀번호를 입력하지 않았을 때
			$("#userpw").focus();
			$("#checkmsg").text("비밀번호를 입력해주세요").css('visibility','visible');
		
			return false;
		}
		
		$.ajax({					//ajax 통신
			
			url: 'userLoginChk' ,
			data : {user_id:$("#userid").val(), user_pw:$("#userpw").val()},
			success : function(response){
				if(response){
					location = "<c:url value='/' />";
					//location.href = document.referrer;
				}else{
					$("#checkmsg").text("아이디 혹은 비밀번호가 일치하지 않습니다.").css('visibility','visible');
					
					$("#userpw").val("").focus();
				}
			}, error : function(req,text){
				alert(text+' : '+req.status);
			}
		});//ajax
	}

	$('#alogo').click(function() {
		
		location="<c:url value='/' />";
	});
	
	function chkCharCode(event) {
		const regExp = /[\ㄱ-ㅎㅏ-ㅣ가-힇]/g;
		const ele = event.target;
		if (regExp.test(ele.value)) {
		  ele.value = ele.value.replace(regExp, '');
		}
	};
	
</script>	
</body>
</html>