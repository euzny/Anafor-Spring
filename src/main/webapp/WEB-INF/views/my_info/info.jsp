<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/join-check.js"></script>
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
	table { width: 80%;  }
	table th{width:20%;}
	table td{width:80%;}
	table th, table td {text-align:left;}
	table th, table td {border:1px solid #ccc; padding: 5px 10px; color: gray; }
	#userInfo{
		margin-top:50px;
	}
	input[type="text"],input[type="password"]{
		margin-left:10px;
		border:1px solid #ccc;
		width:200px;
		height:30px;
	}
	input[type="radio"]{
		margin-left:10px;
	}
	
	#user_birth, #user_id{
		border:0px;
	}
	span{
		font-size:12px;
		margin-left:10px;
	}
	#pwcond{
		font-size:10px;
		margin:0px 0px 0px 10px;

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
	.invalid{color:red;}
	.valid{color:green;}
	
	#delete-user{
		background:#ccc;
		color:white;
		padding:5px;
	}
	
	#namemsg, #telmsg, #pwmsg, #pwchkmsg{
		display:inline-block;
		width:300px;
	}
	input:focus{
		border:1px solid #696AAD;
	}
</style>
</head>
<body>
		<div id="header">
  				 <h3>회원정보 확인</h3>
		</div>
		<div id="userInfo">
			<form action="userinfoUpdate" method="post">
			<input type="hidden" name="user_pw" value="${loginInfo.user_pw}"/>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="user_id" id="user_id" value="${loginInfo.user_id}" readonly="readonly"/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="user_name" class="chk" value = "${loginInfo.user_name}"/><span id="namemsg"></span></td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td><input type="text" name="user_tel" class="chk" value = "${loginInfo.user_tel}"/><span id="telmsg"></span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="new_pw" class="chk"/><span id="pwmsg"></span>
						<div>
						<span id="pwcond">*8~16자 이내로 영문 대/소문자와 숫자를 포함하여 입력해주세요</span><br/>
						<span id="pwcond">*비밀번호 변경 시에만 입력해주세요</span>
						</div>						
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="new_pwchk" class="chk" /><span id="pwchkmsg"></span></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" value="${loginInfo.user_birth }" id="user_birth" readonly="readonly"/></td> 
				</tr>
				<tr>
					<th>성별</th>
					<td><label><input type="radio" name="user_gender" value="남" ${loginInfo.user_gender eq "남" ? 'checked':'' }/>&nbsp;&nbsp;남</label>
					<label><input type="radio" name="user_gender" value="여" ${loginInfo.user_gender eq "여" ? 'checked':'' } />&nbsp;&nbsp;여</label></td>
				</tr>
				<tr>
					<td colspan="2" style="border:0px; text-align:right;"><span>탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요&nbsp;&nbsp;<a onclick='delete_user(); return false;' id="delete-user">회원탈퇴</a></span></td>
				</tr>
			</table>
			<div id="btn-class">
				<input type="button" value="확인" onclick="checkedinfo()" />	
				<input type="button" value="취소" onclick="canceled()"/>		
			</div>
		</form>
		</div>
		<script>
			function checkedinfo(){
				//전화번호, 이름, 비밀번호, 비밀번호 확인 검증
				if(!item_check($('[name=new_pw]'))) 		return;
				if(!item_check($('[name=new_pwchk]')))		return;
				if(!item_check($('[name=user_name]')))		return;
				if(!item_check($('[name=user_tel]'))) 		return;
				if($('[name=new_pw]').val()==""){
					alert("회원정보가 수정되었습니다!");	
				}else{
					alert("비밀번호가 변경되어 로그아웃됩니다. 다시 로그인해주세요");	
				}
				$('form').submit();
				
			}
			

			function item_check(item){
				var data = join.tag_status(item);
				if(data.code == 'invalid') {
					item.siblings('span').text(data.desc).removeClass().addClass(data.code);
					item.focus();
					return false;
				}
				return true;
			}
			
			$('.chk').on('keyup', function (e) {
				//id 입력 후 enter를 누르면 아이디 중복확인 버튼 실행 
				var data = join.tag_status($(this)); //입력하고 있는 tag의 값을 보낸 후 결과값 반환
				$(this).siblings('span').text(data.desc).removeClass().addClass(data.code);
			});
			
			function canceled(){
					alert("변경이 취소되었습니다.");
					location="userinfo.ur";
			}
		
			function delete_user(){
				if(confirm("정말 탈퇴하시겠습니까?")){
					$.ajax({					//ajax 통신
						
						url: 'userDelete' ,
						data : {user_id:$("[name=user_id]").val()},
						success : function(response){
							if(response){
								alert("탈퇴가 완료되었습니다.");
								location = "<c:url value='/' />";
							}
						}, error : function(req,text){
							alert(text+' : '+req.status);
						}
					});//ajaxs
					
				}else{
					alert("취소되었습니다.");
				}
			}
		</script>
</body>
</html>