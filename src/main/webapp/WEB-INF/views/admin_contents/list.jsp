<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨텐츠관리</title>
<style>
body{
   background-color: #E5E5E5;
}

#allPage{
	padding: 20px;
}

#header {
   width:100%;
   height:59px;
   padding: 20px;
   background-color:#929292; 
}

#header h3{
   font-size: 25px;
   font-weight: bold;
   text-align: left;
   color: white;
}

#list-top{
   width:100%;
   padding: 20px;
   height:80px;
   border-radius: 5px;
   background-color: white;
   font-size: 18px;
}

#list-select{
   width:80%;
   padding-left: 10px;
   padding-right: 10px;
}

#list-select ul{
	width:100%;
	padding-left: 20%;
}
#list-select tr td{
   font-size: 20px;
}

#search_btn{
   padding-top:5px;
}


#list-board{
   width:100%;
   height:auto;
   min-height:770px;
   margin-top:20px;
   border-radius: 5px;
   background-color: white;
   padding-top: 40px;
   padding-bottom: 30px;
}

#list-board ul{
   width:90%;
   text-align: right;
}

#list-board table{
   width:90%;
   margin-top:30px;
   margin-bottom:30px;
   border-top: 1px solid #e0e0e0;
}

#list-page1{
	display:inline-block;
    padding: 10px;
	width: 60%;
	height: 30px;
}

#list-page1 ul li{
   float: left;
}

#list-page2 ul li{
   float: right;
}

#list-page2{
    padding: 10px;
	display:inline-block;
	width: 30%;
	height: 30px;
}
a.btn-empty {
   background: #D9D9D9;
   color: black;
   text-align: center;
   padding: 3px 10px;
   margin-left: 5px;
   border: 1px solid #b0b0b0;
}

input[name=keyword] {
    width: 90%;
    height: 40px;
    font-size: 18px;
    margin-right:15px;
    margin-left:15px;
    border-bottom: 1px solid #ccc;
}

table tr td:nth-child(7) img {
   cursor: pointer;    
}

#list-select select{
   font-size: 18px;
   margin-left: 15px; 
}

select[name=pageList],select[name=sort],select[name=reply]{
   width: 120px;
   height: 30px;
   margin-right:2px;   
   border: 1px solid #b0b0b0;
}

#date-search{
   width: 80%;
   text-align: center;
   margin-left: 20px;
}

#datecenter a{
   text-align: center;
   margin-left: 20px;
}

#write{
	margin-top: 5px;
}

#page{
	margin-bottom: -60px;
}

#td_title img{
	float: left;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
</head>
<body>
<div id="header">
   <h3>컨텐츠 관리</h3>
</div>
<form action="list.co" method="post">
<input type="hidden" name='curPage' value="1" />
<div id="allPage">
<div id='list-top' >
   <div id='list-select'>       
      <ul>
         <tr>
            <select name='code' class='w-px150' onchange="$('form').submit()">
               <option value="all"  ${page.code eq 'all' ? 'selected' : '' }>카테고리</option>
              <c:forEach items="${codes }" var="vo">
			   <option ${page.code ne 'all' and page.code eq vo.code ? 'selected' : '' } value="${vo.code }" >${vo.code_name }</option>
              </c:forEach>
            </select>
         </tr>
         <tr>
            <select name='search' class='w-px150'>
               <option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
               <option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
               <option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
               <option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
            </select>
         </tr>
         <!-- 검색 키워드를 입력할 input 태그  -->
         <tr>
            <input type="text" name='keyword' value="${page.keyword }" placeholder="검색 키워드를 입력하세요"/>
         </tr>
         <!-- 검색 버튼 생성 -->
         <tr>
            <a onclick="$('form').submit()" id="search_btn"><img src="imgs/notice_search.png"></a>
         </tr>
      </ul>
   </div>
</div>

<input type="hidden" name="curPage" value="1" />         
   <div id="list-board">
      <div id="list-page1">
		<ul>
		   <li class="left">
               <select name="pageList" class='w-px90' onchange="$('form').submit()">
                  <option value="10" ${page.pageList eq 10 ? 'selected' : '' }>10개씩</option>
                  <option value="15" ${page.pageList eq 15 ? 'selected' : '' }>15개씩</option>
                  <option value="20" ${page.pageList eq 20 ? 'selected' : '' }>20개씩</option>
                  <option value="25" ${page.pageList eq 25 ? 'selected' : '' }>25개씩</option>
                  <option value="30" ${page.pageList eq 30 ? 'selected' : '' }>30개씩</option>               
               </select>
            </li>
            <c:if test="${page.code eq 'N03'}"> 
            <li class="left">     
            <select name='sort' class='w-px150' onchange="$('form').submit()">
               <option value="all" ${page.sort eq 'all' ? 'selected' : '' }>전체</option>
               <option value="제품문의" ${page.sort eq '제품문의' ? 'selected' : '' }>제품문의</option>
               <option value="결제문의" ${page.sort eq '결제문의' ? 'selected' : '' }>결제문의</option>
               <option value="배송문의" ${page.sort eq '배송문의' ? 'selected' : '' }>배송문의</option>
               <option value="교환/환불/반품" ${page.sort eq '교환/환불/반품' ? 'selected' : '' }>교환/환불/반품</option>
               <option value="기타" ${page.sort eq '기타' ? 'selected' : '' }>기타</option>
            </select>
           </li>
           <li class="left">     
            <select name='reply' class='w-px150' onchange="$('form').submit()">
                <option value="all" ${page.reply eq 'all' ? 'selected' : '' }>전체</option>
               <option value="N" ${page.reply eq 'N' ? 'selected' : ' ' }>미답변</option>
               <option value="Y" ${page.reply eq 'Y' ? 'selected' : ' ' }>답변완료</option>
            </select>
           </li>
           </c:if>	
		</ul>
      </div>
      <div id="list-page2">
      	<ul>
      	  <c:if test="${loginInfo.admin eq 'Y' }">
      	    <c:if test="${page.code ne 'N03'}">  
            	<li id="write" class="right"><a class='btn-empty' href='new.co'>글쓰기</a></li>
            </c:if>
          </c:if>
      	</ul>  	
      </div>   
   </form>   
      <table>
      	<thead>
	        <tr>
	           <th class="w-px70">NO</th>
	           <th class="w-px80">카테고리</th>
    		 <c:if test="${page.code eq 'N03'}">    			
	           <th class="w-px100">문의사항</th>
	           <th class="w-px90">답변상태</th>
	         </c:if>
	           <th class="w-px150">제목</th>
	           <th class="w-px100">작성자</th>
	           <th class="w-px120">작성일자</th>
	           <th class="w-px100">조회수</th>
	           <th class="w-px70">삭제</th>
	        </tr>
	     </thead>
		<tbody> 
			<c:if test="${ empty page.list }">
				<tr>
					<td colspan="9">게시글 정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${page.list }" var="vo">
			   <tr>
			      <td>${vo.no }</td>
			      <td>${vo.category}</td>
	   		 <c:if test="${page.code eq 'N03'}">     
			      <td>${vo.sort }</td>
			      <td>${vo.reply}</td>
			 </c:if>
			      <td class="left" id="td_title">
			         <c:forEach begin="1" end="${vo.indent }" var="i">      
			            ${i eq vo.indent ? "<img src='imgs/re.png' />" : "&nbsp;&nbsp;" }  
			         </c:forEach>
			         <a id="vo_title" href='detail.co?id=${vo.id }'>${vo.title }</a>         
			      </td>
			      <td>${vo.name}</td>
			      <td>${vo.writedate}</td>
			      <td>${vo.readcnt}</td>
			      <td>
			         <c:if test="${loginInfo.admin eq 'Y' }">
 					   <a onclick="if(confirm('정말 삭제하시겠습니까?')){href='delete.co?id=${vo.id}&root=${vo.root}&curPage=${page.curPage }&pageList=${page.pageList}&search=${page.search}&keyword=${page.keyword }&code=${page.code}&sort=${page.sort}&reply=${page.reply}'}"><img src="imgs/notice_delete.png"> </a>
			         </c:if>
			      </td>
			   </tr>
			</c:forEach>
   		</tbody>
      </table>
   <div id="page">
      <jsp:include page="/WEB-INF/views/include/page.jsp" />
      <!-- jsp 표준 include를 사용하여 설정 -->
   </div>
</div>
</div>
</body>
</html>