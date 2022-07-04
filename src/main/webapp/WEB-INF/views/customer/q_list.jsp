<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>

#wrap {
	width: 100%;
	height: auto
}

#top_img {
	width: 100%;
	height: 372px;
	background: url("imgs/qna.png") center no-repeat;
	position: relative;
	margin: 0 auto;
}

#top_img .text_box {
	position: absolute;
	left: 150px;
	top: 100px;
}

#top_img .text_box p {
	line-height: 80px;
	font-size: 70px;
	color: #ffffff;
	text-align: left
}

table {
	margin-top:20px;
	margin-bottom: 20px;
}

#list-t{
	display: block;
	margin: 0 auto;
	width: 1500px;
	height: 50px;
	padding:0px;
}

#list-top1{
	display:inline-block;
	width: 83%;
	height:45px;
}

#list-top1 ul li{
	float: left;
	padding-top: 11px;
}

#list-top2{
	display:inline-block;
	width: 15%;
	height:45px;
}

#list-top2 ul li{
	float: right;
	padding-top: 15px;
}

#list-content{
	margin: 0 auto;
	display: block;
}

a.btn-empty {
	width:70px;
	background: #fff;
	color: #929292;
	text-align: center;
	padding: 5px 5px;
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

#menu_form {
	width:218px;
	height: 100px; 
	margin: auto; 
	padding-top: 30px;
}

#wrap #menu {
	margin:0 auto; 
	height: 50px; 
	cursor: pointer; 
} 

#menu ul {
	oveflow: hidden;
}

#menu ul li {
	float: left;
}

#menu ul li a {
	font-size: 30px;
	display: block;
	padding: 10px 20px;
	border: 1px solid #929292;
}

#menu ul li a:hover {
	background-color: #b0b0b0;
	color: white;
}

#menu ul li:nth-child(2) a {
	border-left: 0px;
	background-color : #929292;
	color: white;	
}

#sort,#reply{
	margin-right: 5px;
}

#write{
	margin-left: 500px;
}

</style>
</head>
<body>
	<form id="wrap" action="list.cu" method="post">
		<input type="hidden" name="curPage" value="1" />
		<div id="top_img">
			<div class="text_box">
				<p>
					<b>아나포에서 여러분의<br>소리를 듣습니다
					</b>
				</p>
			</div>
		</div>
		<div id="menu_form">
			<div id="menu">
				<ul>	
					<li><a href="f_list.cu">FAQ</a></li>
					<li><a href="list.cu">Q&A</a></li>
				</ul>
			</div>
		</div>
		<div id="list-t">
			<div id="list-top1">
				<ul>
					<li>
					<tr>
			            <select id="sort" name='sort' class='w-px150' onchange="$('form').submit()">
			               <option value="all" ${page.sort eq 'all' ? 'selected' : '' }>문의사항</option>
			               <option value="제품문의" ${page.sort eq '제품문의' ? 'selected' : '' }>제품문의</option>
			               <option value="결제문의" ${page.sort eq '결제문의' ? 'selected' : '' }>결제문의</option>
			               <option value="배송문의" ${page.sort eq '배송문의' ? 'selected' : '' }>배송문의</option>
			               <option value="교환/환불/반품" ${page.sort eq '교환/환불/반품' ? 'selected' : '' }>교환/환불/반품</option>
			               <option value="기타" ${page.sort eq '기타' ? 'selected' : '' }>기타</option>
			            </select>
					</tr>
					<tr>
			            <select id='reply' name='reply' class='w-px150' onchange="$('form').submit()">
			                <option value="all" ${page.reply eq 'all' ? 'selected' : '' }>답변상태</option>
			               <option value="N" ${page.reply eq 'N' ? 'selected' : ' ' }>미답변</option>
			               <option value="Y" ${page.reply eq 'Y' ? 'selected' : ' ' }>답변완료</option>
			            </select>
					</tr>
						<tr>
						<select name='search' class='w-px90'>
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
						</select>
					</tr>
					<!-- 검색 키워드를 입력할 input 태그  -->
					<tr>
						<input type="text" name='keyword' value="${page.keyword }" class='w-px300' />
					</tr>
					<!-- 검색 버튼 생성 -->
					<tr>
						<a class='btn-empty' onclick="$('form').submit()">검색</a>
					</tr>
				</ul>
			</div>
			
			<div id="list-top2">
				<ul>
					<li>
						<c:if test="${ !empty loginInfo and loginInfo.admin eq 'N'}">
							<tr id="write" ><a class='btn-empty' href='new.cu'>글쓰기</a></tr>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</form>
	<div id="list-content">
		<table>
			<tr>
				<th class="w-px70">NO</th>				
				<th class="w-px120">문의사항</th>
	            <th class="w-px100">답변상태</th>
				<th>제목</th>
				<th class="w-px100">작성자</th>
				<th class="w-px120">작성일자</th>
				<th class="w-px100">조회수</th>
			</tr>
			<c:if test="${ empty page.list }">
				<tr>
					<td colspan="7">게시글 정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${page.list }" var="vo">
				<tr>
					<td>${vo.no }</td>
					<c:if test="${ vo.writer ne 'admin' }">
						<td>${vo.sort}</td>
	 			        <td>
							<c:choose>
								<c:when test="${vo.reply eq 'Y'}">답변완료</c:when>
								<c:otherwise> 미답변 </c:otherwise>        
	 			        	</c:choose>
	 			        </td>
 			        </c:if> 			        
					<c:if test="${ vo.writer eq 'admin' }">
						<td></td>
						<td></td>						
					</c:if>
					<td class='left'>
						<c:forEach begin="1" end="${vo.indent }" var="i">
							${i eq vo.indent ? "<img src='imgs/re.png' />" : "&nbsp;&nbsp;" }
						</c:forEach> 
						<a id="vo_title" href='detail.cu?id=${vo.id }'>${vo.title }</a>
					</td>
					<td>${vo.name}</td>
					<td>${vo.writedate}</td>
					<td>${vo.readcnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
		<!-- jsp 표준 include를 사용하여 설정 -->
	</div>
</body>
</html>