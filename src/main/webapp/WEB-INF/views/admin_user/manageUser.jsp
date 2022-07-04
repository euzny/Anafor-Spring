<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자관리</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

	#titlename{ 	   
	   width:100%;
	   height:60px;
	   padding: 20px;
	   background-color:#929292;
	   border-bottom: 1px solid white;  }
	#titlename h3{font-size:25px;  text-align:left; font-weight:bold; color:white;  }
	#UserProfile{ margin:20px; height: auto; min-height:870px; background-color: #FFFFFF; border-radius:5px;}
	table{ width:90%; border:0px; }
	td{font-size:14px; color:#929292;}
	#totaluser{width:150px; height:40px; display:block; text-align:left; line-height:40px;	margin-left:30px; padding:10px; font-size:15px; font-weight:700; margin-top:15px; margin-bottom:15px;}
	textarea { width: 100%; height: 200px;  border: 1px solid #ccc; resize: none; }
  
  #modal{
  	display:none;
  	z-index : 1;
	background-color: rgba(0,0,0,.3);
	position:fixed;
	left:0;
	top: 0;
	width:100%;
	height:100%;
  }
  
    #modal>#memo_content{
	width:500px;
	margin:100px auto;
	height:350px;
	padding:20px;
	position: relative;
	background-color:#fff;
	}
	
	#close-btn{
		width:100%;
		height:10px;
		text-align:right;
		display:block;
	}
	
	#btn-class{
	
		width:100%;
		height:30px;
		
	}
  
  input[type=button]{
  		margin-top:10px;
  		padding:10px;
  		border-radius:5px;
  }
  
  input[type=button]:hover{ background-color:#c0c0c0;}

	#search_top{
		width:90%;
		height:80px;
		padding-top:30px;
		padding-bottom:10px;
		margin:auto;
	}
	#search_top ul{
		list-style:none;
		height:30px;
	}
	#search_top il li{
		display:block;
	}
	#search_top ul li:nth-child(1){
		float:left;
		width:20%;
		font-size:20px;
		font-weight:bold;
		height:30px;
		line-height:30px;
		text-align:left;
	}
	#search_top ul li:nth-child(2){
		float:left;
		width:45%;
		text-align:right;
	}
	#search_top ul li:nth-child(3){
		float:left;
		width:30%;
	}
	#search_top ul li:nth-child(4){
		float:left;
		width:5%;
	}
	
	input[type=text]{
		width:300px;
		height:30px;
		border-bottom:1px solid #ccc;
	}
	.btn-search{
		width:50px;
		height:30px;
		line-height:30px;
		display:block;
		border:1px solid #ccc;
	}
	.btn-search:hover{
		background-color:#c0c0c0;
	}
	select{
		font-size:14px;
		height:30px;
	}
	#pagenum{
		margin-top:15px;
	}
</style>
</head>
<body>
	<div id = "titlename"><h3>사용자관리</h3></div>
	<div id = "UserProfile">
		<form id="form" action="user.ur" method="post">
		<input type="hidden" name="curPage" value="1" />
		<div id="search_top">
			<!-- 항목별 검색 처리 부분 -->
			<ul>
				<li></li>
				<li>
					<select name="search" >
						<option value="all" ${page.search eq 'all' ? 'selected' : ''}>전체</option>
						<option value="user_name" ${page.search eq 'user_name' ? 'selected' : ''}>이름</option>
						<option value="user_id" ${page.search eq 'user_id' ? 'selected' : ''}>계정</option>
						</select>
				</li>
				<!-- 검색 키워드를 입력할 input 태그 -->
				<li ><input type="text" placeholder="검색 내용을 입력하세요" name="keyword" value="${page.keyword}" /></li>
				<!-- 검색 버튼 생성 -->
				<li><a class="btn-search" onclick="$('form').submit()">검색</a></li>

			</ul>
		</div>
		</form>
		<div style="height:765px;">
		<table>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>계정</th>
				<th>회원 유형</th>
				<th>가입일</th>
				<th>Q&A/구매평</th>
				<th>메모</th>
			</tr>
			<c:if test="${empty page.list }">
				<tr>
					<td colspan="7" style="font-weight:500; font-size:14px; color:black">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${page.list}" var="vo">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.user_name}</td>
						<td>${vo.user_id }</td>
						<td>${vo.admin eq 'Y' ? '관리자':'일반회원'}</td>
						<td>${vo.join_date }</td>
						<td>${vo.qCnt}&nbsp;/&nbsp;${vo.brCnt }</td>
						<c:if test="${! empty vo.memo }"> <!-- 메모가 있을때 초록색으로 표시 -->
						<td><a onclick="show('${vo.memo}','${vo.user_id}')"><i class="fa-solid fa-square-pen" style="color:green;"></i></a></td>
						</c:if>
						<c:if test="${empty vo.memo }">
						<td><a onclick="show('${vo.memo}','${vo.user_id}')"><i class="fa-solid fa-square-pen" ></i></a></td>
						</c:if>
					</tr>
			</c:forEach>	
		</table>
		</div>
		<div id="modal">
			<div id="memo_content">
				<a id="close-btn"><i class="fa-solid fa-xmark"></i></a>
				<span>Memo</span>
				<textarea  placeholder="내용을 입력해 주세요." rows="10"></textarea>
				<div id="btn-class">
				<input type="button" onclick="delete_memo()" value="삭제하기"/>
				<input type="button" onclick="save_memo()" value="저장하기"/>
				</div>
			</div> 
		</div>
		<div id="pagenum" style="margin-bottom:-100px;">
			<!-- jsp 표준 include를 사용하여 설정 -->
			<jsp:include page="/WEB-INF/views/include/page.jsp" />
		</div>
	</div>
<script>
	var user_id = '';
	function show(memo,id){
		user_id = id;
		if(memo != ''){
			memo = memo.replaceAll("<br>", "\r\n") // 줄바꿈 표현
			console.log(memo);
			$('textarea').text(memo);
		}
		$('#modal').css("display","block");
	}
	
	$('#close-btn').click(function(){
		$('#modal').css("display","none");
		location="<c:url value='/user.ur' />";
	});
	
	function delete_memo(){
		$('textarea').text('');   //텍스트를 지우고
		$.ajax({
			url:'delete.memo',
			data:{userid:user_id},
			success: function(response){
				alert("메모가 삭제되었습니다");
				location="<c:url value='/user.ur' />";
			},error : function(req,text){
				alert(text+' : '+req.status);
			}
		});
	}
	
	function save_memo(){
		$.ajax({
			url:'save.memo',
			data:{userid:user_id,memo:$('textarea').val().replace(/\r\n|\n/g , "<br>")},
			success: function(response){
				alert("메모가 저장되었습니다.");
				location="<c:url value='/user.ur' />";
			},error : function(req,text){
				alert(text+' : '+req.status);
			}
		});
		
	}

</script>	
</body>
</html>