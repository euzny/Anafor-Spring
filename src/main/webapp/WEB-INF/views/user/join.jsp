<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="js/join-check.js"></script>
<style>
	
	
	.Anaforcenter{
		margin:0px auto;
		width:60%;
		height:auto;
		pointer-events:auto;
	}
	
	#AnaforLogo{
		margin : 40px 40px 30px 40px;
	}
	#AnaforLogo #alogo{
		width:242px;
		height:90px;
		color:#696AAD;
		letter-spacing:-0.015em;
		font-size:42px;
		font-weight:800;
		font-style:normal; 
	}
	
	#AnaforLogo #alogotitle{
		width:100px;
		height:26px;
		color:#696AAD;
		letter-spacing:-0.015em;
		font-weight:600;
		font-size:12px;
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
		width:100px;
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
	
	
	input[type=text]:focus, input[type=password]:focus{
		border:2px solid #696AAD;
	}
	
	#noticejoin{
		width:100%;
		height:20px;
		text-align:center;
		margin-bottom:10px;
	}
	
	
	#notice{
		width:500px;
		text-align:left;
		display:inline-block;
		font-size:14px;
		color:#696AAD;
		font-weight:500;
		height:14px;
	}

	#useremail input[type=text], #usercode input[type=text]{
		width:400px;
	}
	#input[type=radio]{
	    background-color: initial;
		cursor: default;
		appearance:auto;
		box-sizing: border-box;
	}
	
	#usergender #selectbox{
		width:500px;
		height:40px;
		margin:10px auto 0px auto;
		padding: 0px 7px 0px 12px;
		text-align:left;
	}
	#selectbox ul{
		display:block;
		width:100%;
		height:40px;
	}
	
	#selectbox ul li{
		display:block;
		width:50%;
		float:left;
		padding-right: 80px;
		line-height:25px;
	}

	label{
		font-size:15px;
	}
	
	
	#idmsg, #codemsg,#pwmsg,#pwmsg2,#namemsg,#telmsg,#genmsg,#birthmsg{
		width:500px;
		text-align:left;
		display:inline-block;
		font-size:13px;
		font-weight:500;
		padding:5px;
	}
	#btn-join{
		display:inline-block;
		width:500px;
		height:50px;
		background-color: #696AAD;
		border-radius:10px;
		text-align:center;
		font-size:20px;
		color:#FFFFFF;
		font-weight:400;
		padding:3px 7px;
		border:0px;
		line-height:45px;
	}
	#joinbutton{
		width:100%;
		height:170px;
		margin:15px 0px 0px 0px;
	}
	
	.visible{
		visibility: visible;
	}
	.hidden{
		visibility: hidden;
	}
	
	.valid{color:green;}
	.invalid{color:red;}
	
</style>
</head>
<body>
	<div id="AnaforLogo">
		<span id="alogo">AnaFor</span><br/>
		<span id="alogotitle">아픈 나를 위해 아나포</span>
	</div>	
<form action="userjoinChk" method="post"> 
	<div class="Anaforcenter">
		<div id="noticejoin">
		<span id="notice">* 필수 입력사항</span>
		</div>
		<div id="useremail">
			<input type="text" name="user_id" class="chk" placeholder="이메일을 입력하세요 *" maxlength="100"/>
			<input type="button" id="btn-email" onclick="checkEmail()" value="중복확인"/><br/>
			<span id="idmsg">예)happy@anafor.com</span>
		</div>
		<div id="usercode">
			<input type="text" name="code" placeholder="인증코드를 입력하세요 *"/>
			<input type="button" id="btn-code" onclick="sendEmailCode()"value="이메일 인증"/><br/>
			<span id="codemsg">이메일 인증코드를 받고 입력하세요</span>
		</div>
		<div id="userpw">
			<input type="password" name="user_pw" class="chk" placeholder="비밀번호 *"/><br/>
			<span id="pwmsg">8~20자 이내로 영문 대/소문자와 숫자를 포함하여 입력해주세요</span>
		</div>
		<div id="userpwchk">
			<input type="password" name="pwchk" class="chk"  placeholder="비밀번호 확인*"/><br/>
			<span id="pwmsg2"></span>
		</div>
		<div id="username">
			<input type="text" name="user_name" class="chk"  placeholder="이름 *" maxlength="10"/><br/>
			<span id="namemsg"></span>
		</div>
		
		<div id="userbirth">
			<input type="text" name="user_birth" class="chk" placeholder="생년월일을 입력하세요 *"/><br/>
			<span id="birthmsg">예)19990101</span>
		</div>
		<div id="userphone">
			<input type="text" name="user_tel" class="chk" placeholder="휴대폰 번호 *"/><br/>
			<span id="telmsg">'-'없이 번호만 입력 예)01012345678</span>
		</div>
		<div id="usergender">
			<div id="selectbox" >
				<ul>
				<li><label><input type="radio" name="user_gender" value="남" checked/>&nbsp;&nbsp;남</label></li>
				<li><label><input type="radio"  name="user_gender"  value="여"/>&nbsp;&nbsp;여</label></li>
				</ul>
			</div>
			<span id="genmsg"></span>
		</div>
		<div id="joinbutton">
			<a id="btn-join" onclick="go_join()">가입하기</a>
		</div>
	</div>	
</form> 

<script>
var code=""  //인증코드 받을 변수
function go_join(){

		//이메일 중복확인 검사
		if($('[name=user_id]').hasClass('checked')){
			//중복확인 검사를 했을 경우
			if($('[name=user_id]').siblings('span').hasClass('invalid')){
				$('[name=user_id]').siblings('span').text(join.id.unUsable.desc);
				$('[name=user_id]').focus();
				return;
			}
		}else{
			//중복확인을 안 했을 경우
			if(!item_check($('[name=user_id]'))) return;   
			else{
				$('[name=user_id]').siblings('span').text(join.id.valid.desc); // 사용할 수 있는 id여도 중복확인을 안 했을 경우
				$('[name=user_id]').focus();
				return;
			}
		}
		//비밀번호 , 비밀번호 확인, 이름, 생일, 전화번호 검증 필요
		if(!item_check($('[name=user_pw]')))	return;
		if(!item_check($('[name=pwchk]'))) return;
		if(!item_check($('[name=user_name]'))) return;
		if(!item_check($('[name=user_birth]'))) return;
		if(!item_check($('[name=user_tel]')))	return;
		
		//인증코드 검증
		if($('#codemsg').hasClass('invalid')|| $('[name=code]').val()==''){
			$('[name=code]').focus();
			if(code!=''){
				$('#codemsg').text("인증코드를 입력해주세요").removeClass().addClass('invalid');
			}else{
				$('#codemsg').text("인증코드를 먼저 받아주세요").removeClass().addClass('invalid');
			}
			return;
		}
		
		alert("회원가입이 완료되었습니다!\n 로그인 페이지로 이동합니다.");
		$('form').submit();
		
}//go_join


$('.chk').on('keyup', function (e) {
	//id 입력 후 enter를 누르면 아이디 중복확인 버튼 실행
	if($(this).attr('name') == 'id'){
		if(e.keyCode == 13){
			checkEmail();
		}
	} 
	var data = join.tag_status($(this)); //입력하고 있는 tag의 값을 보낸 후 결과값 반환
	$(this).siblings('span').text(data.desc).removeClass().addClass(data.code);
});


function item_check(item){
	var data = join.tag_status(item);
	if(data.code == 'invalid') {
		item.siblings('span').text(data.desc).removeClass().addClass(data.code);
		item.focus();
		return false;
	}
	return true;
}

//이메일 인증 코드 전송 함수
function sendEmailCode(){
	if($('#idmsg').hasClass('invalid')){
		$("#codemsg").text("유효하지 않은 이메일입니다. 이메일을 다시 작성해주세요").removeClass().addClass("invalid");
		return;
	}else if($('[name=user_id]').val()==''){
		$("#codemsg").text("이메일을 먼저 작성해주세요").removeClass().addClass("invalid");
		$('[name=user_id]').focus();
		return;
	}else if($('[name=user_id]').hasClass('checked')){
		//중복확인 검사를 했을 경우
		if($('[name=user_id]').siblings('span').hasClass('invalid')){
			$('[name=user_id]').siblings('span').text(join.id.unUsable.desc);
			$('[name=user_id]').focus();
			return;
		}
	}else if(!$('[name=user_id]').hasClass('checked')){
		//중복확인을 안 했을 경우
		if(!item_check($('[name=user_id]'))) return;   
		else{
			$('[name=user_id]').siblings('span').text(join.id.valid.desc); // 사용할 수 있는 id여도 중복확인을 안 했을 경우
			$('[name=user_id]').focus();
			return;
		}
	} 
	
	$.ajax({
		url:'sendEmailChk',
		data:{email:$('[name=user_id]').val()},
		success:function(response){
				alert("인증메일이 발송되었습니다.\n해당 메일함을 확인해주세요");
				code=response;
				console.log(code);
		},error:function(req,text){
				alert(text+':'+req.status);
			}
			
		});//ajax
}
 
 $('[name=code]').keyup(function() {
	 matchCode();
});
 

 //인증코드 일치 여부 확인
 function matchCode(){
	 
	 if(code!=""){
		if($('[name=code]').val() == code){
				$('#codemsg').text("인증코드가 일치합니다.").removeClass().addClass('valid');
			}else{
				$('#codemsg').text("인증코드가 일치하지 않습니다.").removeClass().addClass('invalid');
		}
	 }else{
		 $('#codemsg').text("인증코드를 먼저 받아주세요").removeClass().addClass('invalid');
	 }
 }


//이메일 중복 확인
function checkEmail(){
	
	var data = join.tag_status($('[name=user_id]'));
	if(data.code=="invalid"){
		$('[name=user_id]').siblings('span').text(data.desc);
		$('[name=user_id]').focus();
		return;
	}
		
	$.ajax({					//ajax 통신
		url: 'userEmailChk',
		data : {id:$('[name=user_id]').val()},
		success : function(response){
				var data = join.id_usable(response);
				$('[name=user_id]').siblings('span').text(data.desc).removeClass().addClass(data.code);
				$('[name=user_id]').addClass('checked');
		}, error : function(req,text){
			alert(text+' : '+req.status);
		}
	});//ajax

}//checkEmail()
</script>

</body>

</html>