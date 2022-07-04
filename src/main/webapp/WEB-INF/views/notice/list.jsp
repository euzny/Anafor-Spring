<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
#wrap {
	width: 100%;
	height: auto
}

#top_img {
	width: 100%;
	height: 372px;
	background: url("imgs/notice.png") center no-repeat;
	position: relative;
	margin: 0 auto;
}

#top_img .text_box {
	position: absolute;
	top: 200px;
	right: 290px;
}

#top_img .text_box p {
	line-height: 80px;
	font-size: 70px;
	color: black;
}

table {
	width: 65%;
	margin-bottom: 10px;
}

#list-top{
	padding-top:115px;
	padding-left:470px;
	padding-right:220px;
	width: 65%;
	display: block;
	margin: 0 auto;
}

#list-content{
	margin-left:20px;
	margin-right: 800px;
}

a.btn-empty {
	width:70px;
	background: #fff;
	color: #929292;
	text-align: center;
	padding: 4px 10px;
	margin-left: 5px;
	border: 1px solid #b0b0b0;
}

input {
	height: 30px;
	margin-left: 5px;
	font-size: 15px;
	border: 1px solid #b0b0b0;
}

select {
	height: 30px;
	border: 1px solid #b0b0b0;
	padding: 0 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<form id="wrap" action="list.no" method="post">
		<input type="hidden" name="curPage" value="1" />
		<div id="top_img">
			<div class="text_box">
				<p>
					<b>아나포 공지사항입니다</b>
				</p>
			</div>
		</div>
		<div id='list-top'>
			<div id='list-content'>
				<!-- 항목별 검색 처리 부분 -->
				<ul>
					<tr>
						<select name='search' class='w-px90'>
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
							<option value="title"
								${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content"
								${page.search eq 'content' ? 'selected' : '' }>내용</option>
						</select>
					</tr>
					<!-- 검색 키워드를 입력할 input 태그  -->
					<tr>
						<input type="text" name='keyword' value="${page.keyword }"
							class='w-px300' />
					</tr>
					<!-- 검색 버튼 생성 -->
					<tr>
						<a class='btn-empty' onclick="$('form').submit()">검색</a>
					</tr>
				</ul>
			</div>
		</div>
	</form>
	<table>
		<tr>
			<th class="w-px70">NO</th>
			<th>제목</th>
			<th class="w-px120">작성일자</th>
		</tr>
		<c:if test="${ empty page.list }">
			<tr>
				<td colspan="4">게시글 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${page.list }" var="vo">
			<tr>
				<td>${vo.no }</td>
				<td class="left"><a href='detail.no?id=${vo.id }'>${vo.title }</a></td>
				<td>${vo.writedate}</td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
		<!-- jsp 표준 include를 사용하여 설정 -->
	</div>
</body>
</html>