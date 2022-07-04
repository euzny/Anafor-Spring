<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin-top: 30px;
	margin-bottom: 20px;
}

p {
	font-size: 30px;
	margin-top: 100px;
	font-weight: bold;
}

a.btn-empty {
	background: #fff;
	color: #696aad;
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #696aad;
	border-radius: 1px;
	box-shadow: 1px 1px 1px;
}

.btnSet { 
	margin-top: 10px; 
	margin-bottom: 130px;
}

#content_td{
	height: 300px;
}
</style>
</head>
<body>
	<p>공지사항</p>
	<table>
		<tr>
			<th class="w-px120">제목</th>
			<td class="left" >${vo.title }</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td class="left" >${vo.writedate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="content_td" class="left" colspan="5">${fn:replace(vo.content,crlf,'<br>') }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td class="left" >${vo.filename }
				<c:if test="${not empty vo.filename}">
					<!-- 첨부파일이 없지 않으면 아이콘 표시 -->
					<a href="download.no?id=${vo.id}"><i class="fa-solid fa-download"></i></a>
				</c:if>
			</td>
		</tr>
	</table>
	<div class='btnSet'>
		<a class='btn-empty'
			href='list.no?curPage=${page.curPage }&search=${page.search}&keyword=${page.keyword }'>목록으로</a>
	</div>
</body>
</html>