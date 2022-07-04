<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠관리</title>
<script type="text/javascript" src='js/file_check.js'></script>
<style>
body{
	background-color: #E5E5E5;
}
#header {
	width:100%;
	height:60px;
	padding: 20px;
	background-color:#929292; 
}

#header h3{
	font-size: 25px;
	font-weight: bold;
	text-align: left;
	color: white;
}

#list-board{
	width:90%;
	height:85%;
	margin:30px;
	border-radius: 5px;
	background-color: white;
	padding-top: 20px;
}

table{
	width:80%;
	margin-top:30px;
	border-top: 1px solid #e0e0e0;
	margin-bottom: 30px;
}

#list-board p {
	font-size: 30px;
	margin-top: 20px;
	margin-bottom: 20px;
	font-weight: bold;
}

a.btn-empty {
	background: #D9D9D9;
	color: black;
	text-align: center;
	padding: 3px 10px;
	margin-left: 5px;
	border: 1px solid #b0b0b0;
}

input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}
 
textarea {
	font-size: 15px; padding:3px 5px;  height: 400px; resize: none;
}
input[name=title], textarea[name=content] { width: calc(100% - 24px) }
input[type=file], #delete-file { display: none; }

#sort_a{
 cursor: auto;
 margin-left: 15px;
}

</style>
</head>
<body>
<div id="header">
	<h3>컨텐츠 관리 > ${vo.category} > 답글쓰기</h3>
</div>
<div id="list-board">
	<form action="reply_insert.co" method="post" enctype="multipart/form-data">
		<!-- 답글에 필요한 root, step, indent 값을 hidden으로 전달 -->
		<!-- DB에서 조회하여 가져온 값(vo)을 value에 담아서 전달 -->
		<input type="hidden" name='root' value="${vo.root }">
		<input type="hidden" name='step' value="${vo.step }">
		<input type="hidden" name='indent' value="${vo.indent }">
		<input type="hidden" name='sort' value="${vo.sort }">
		<p>${vo.category} 답글쓰기</p>
		<table>
			<tr>
				<th class='w-px120'>제목</th>
				<td>
					<input type="text" name="title" title="제목" class="chk"/>
				</td>
			</tr>
			<tr>
				<th class='w-px120'>문의사항</th>
				<td class="left" >
					<a id="sort_a" class="left" readonly>${vo.sort }</a>
				</td>
			</tr>		
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" title="내용" class="chk"></textarea>
					<!-- textarea는 />닫으면안됨 -->
				</td>
			</tr>
			<tr>
			<th>첨부파일</th>
				<td class="left"> 
					<label> 
						<a><img src='imgs/select.png' class="file-img" /></a> 
						<input type="file" name="file" id="attach-file"/> 
					</label> 
					<span id="file-name"></span>
					<!-- 이미지 파일인 경우 미리보기 적용 -->
					<span id="preview"></span>
					<a id='delete-file'><i class="fa-solid fa-circle-minus"></i></a>
				</td>
			</tr>
		</table>
		<input type="hidden" name="attach" />
		<!-- 첨부 파일 저장 시 사용 -->
	</form>
	<div>
		<a class='btn-empty' onclick=" if(emptyCheck() ) { $('form').submit() }">등록</a>
		<a class='btn-empty' href='detail.co?id=${vo.id }'>취소</a>
	</div>
</div>
</body>
</html>