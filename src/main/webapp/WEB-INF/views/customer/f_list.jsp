<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>고객센터</title>
<style>
#wrap{
	width:100%; 
	height:auto; 
	position:relative;
}

#top_img{
	width: 100%; 
	height:372px; 
	background: url("imgs/faq.png") center no-repeat; 
	position:relative; 
	margin: 0 auto;
}

#top_img .text_box{
	position:absolute; 
	left:150px; 
	top:100px; 
}

#top_img .text_box p{
	line-height: 80px; 
	font-size:70px; 
	color:#929292; 
	text-align:left
}

#list-top{
	width: 1000px;
	display: block;
	margin: 0 auto;
	padding-left:5px;
	padding-right:220px;
}

#list-content{
	margin-right: 300px;
}

a.btn-empty {
	width:70px;
	background: #fff; 
	color: #929292; 
	text-align:center; 
	padding:3px 10px; 
	margin-left:5px;
	border: 1px solid #b0b0b0; 
}

input {
	height: 30px;
	margin-left:5px;
	font-size: 15px;
	border: 1px solid #b0b0b0;
}

select {
	height: 30px; 
	border: 1px solid #b0b0b0; 
	padding : 0 5px; 
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

#menu ul{ oveflow:hidden;}
	
#menu ul li{float:left;}

#menu ul li a{
	font-size:30px;
	display: block;
	padding: 10px 20px;
	border : 1px solid #929292;
}

#menu ul li a:hover{
	background-color: #b0b0b0;
	color: white;	
}

#menu ul li:nth-child(1) a {
	border-right: 0px;
	background-color : #929292;
	color: white;	
}

/* FAQ */


.faq{
	background:center;
	border-bottom:0px solid #ddd;
	width: 1000px;
	height: 100%;
}

.faq .q{
	padding : 15px 30px 15px;
 	background-color: rgba( 105, 106, 173, 0.3 );
	color:black;
}


.faq .a{
	background:#f1f0f2;
	padding: 10px 75px 10px 75px;
    line-height: 22px;
    padding : 20px 50px;
}
.a{
   font-size: 16px;
   text-align : left;
}
.q{
   max-width : 100%;
   text-align : left;
   font-weight : bold;
   font-size: 16px;
   border-bottom: 1px solid #bdbdbd;
   margin-top: 10px;
}
 
summary { 
	cursor: pointer; 
}
summary { 
	list-style: none; 
}   
summary::-webkit-details-marker {
   display: none;
}   


</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<form id="wrap" action="f_list.cu" method="post">
	<input type="hidden" name="curPage" value="1" />
	<div id="top_img">
		<div class="text_box">
			<p><b>FAQ를 통해<br>궁금증을 해결하세요</b></p>
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
<%-- 	<div id='list-top'>
		<div id='list-content'>
			<!-- 항목별 검색 처리 부분 -->
			<ul>
				<tr>
					<select name='search' class='w-px90'>
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>FAQ</option>
					</select>			
				</tr>		
				<!-- 검색 키워드를 입력할 input 태그  -->
				<tr><input type="text" name='keyword' value="${page.keyword }" class='w-px300' /></tr>
				<!-- 검색 버튼 생성 -->
				<tr><a class='btn-empty' onclick="$('form').submit()">검색</a></tr>
			</ul>
		</div>	
	</div> --%>
</form>	
<div style="margin: auto; width: 1000px;">
	<div class='faq'>
	   <div class='faqbody'>
	      <c:forEach items="${page.list}" var="vo">
		         <details>
		         	<c:forEach begin="1" end="${vo.indent }" var="i">
						${i eq vo.indent ? "<img src='imgs/re.gif' />" : "&nbsp;&nbsp;" }
					</c:forEach>
		            <summary class='q'>${vo.title }
			            <img src='imgs/drop-down.png' />
		            </summary>
		            <pre class='a'>${vo.content }</pre>
		         </details>
   	      	</c:forEach>
	   	</div>
	</div>
</div>
	<div>
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
		<!-- jsp 표준 include를 사용하여 설정 -->
	</div>	
</body>
</html>