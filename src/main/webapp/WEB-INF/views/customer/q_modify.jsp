<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}
 
textarea {
	font-size: 15px; padding:3px 5px;  height: 350px; resize: none;
}
input[name=title], textarea[name=content] { width: calc(100% - 24px) }
input[type=file], #delete-file { display: none; }


.btnSet { 
	margin-top: 10px; 
	margin-bottom: 70px;
}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #696aad;
	border-radius: 1px;
	box-shadow: 1px 1px 2px;
	       오른쪽, 아래쪽, 번짐 정도
}
a.btn-fill {
	background: #696aad;
	color: #fff;	
}
a.btn-empty {
	background: #fff;
	color: #696aad;
}
a.btn-fill-s {
	font-size: 13px; font-weight: bold;
	padding: 1px 10px;
	border: 1px solid #c4dafc;
	border-radius: 3px;
	box-shadow: 2px 2px 2px #022d72;
	background : #b1cdfa;
	color: #0000cd;	
}

p{font-size:30px; margin-top:100px; font-weight: bold;}
table{margin-top:30px; margin-bottom: 20px;}
#select_td{
	padding-left: 26px;
}
</style>
</head>
<body>
<p>Q&A 수정</p>
<form action="update.cu" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th class='w-px120'>제목</th>
		<td><input type="text" name="title" value="${vo.title}" title='제목' class='chk' /></td>
	</tr>
	<tr>
		<th>문의사항</th>
		<td id="select_td" class="left">
			<select name="sort" class="left" >
				<option value="제품문의"  ${vo.sort eq '제품문의' ? 'selected' : '' }>제품문의</option>
				<option value="결제문의" ${vo.sort eq '결제문의' ? 'selected' : '' }>결제문의</option>
				<option value="배송문의" ${vo.sort eq '배송문의' ? 'selected' : '' }>배송문의</option>
				<option value="교환/환불/반품" ${vo.sort eq '교환/환불/반품' ? 'selected' : '' }>교환/환불/반품</option>
				<option value="기타" ${vo.sort eq '기타' ? 'selected' : '' }>기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name='content' class='chk' title='내용'>${vo.content}</textarea></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td class='left'>
			<label><a><img src="imgs/select.png" class='file-img' /></a>
					<input type="file" name="file" id="attach-file" />
			</label>		
			<span id='file-name'>${vo.filename }</span>
			<a id="delete-file" style='display: ${!empty vo.filename ? "inline" : "none"}'>
			<i class="fa-solid fa-circle-minus"></i></a>
		</td>
	</tr>
</table>
<input type="hidden" name="attach" />	<!-- 첨부 파일 저장 시 사용 -->
<input type="hidden" name="id" value="${vo.id }" />	
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick=" if(emptyCheck() ) { $('form').submit() }">수정</a>
	<a class='btn-empty' href='detail.cu?id=${vo.id }'>취소</a>
</div>
</body>
</html>