<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}

#myform fieldset .align{
    display: inline-block;
    direction: ltr;
    border:0;
}

.unchecked{
    font-size: 2em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
.checked{
	font-size: 2em;
    color: #fad000;    
}

#myform .hover:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform .hover:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}



</style>
<title>Insert title here</title>
</head>
<body>
		<form action="review_insert.rev" name="myform" id="myform" method="post">
				
		<div style="background-color:#929292; width: 100%; height: 60px; padding: 20px;">
			<h3 style="font-size: 25px; font-weight: bold; text-align: left; color: white;">리뷰 쓰기</h3>
		</div>
	
	
	
		 <div style="margin: 30px; background-color: white; width: 96.5%; height: 500px; padding: 20px;">
		
		<table style="width: 80%; margin-top: 100px; margin-bottom: 20px;">
		<tr>
			<th style="width: 150px;">별점</th>
			<td style="text-align: left;">
				<fieldset>
						<span class="text-bold">별점을 선택해주세요</span>
						<input type="radio" name="rev_grade" value="5" ${vo.rev_grade eq 5 ? "checked" : ""} id="rate5"><label class='hover'  for="rate5">⭐</label>
						<input type="radio" name="rev_grade" value="4" ${vo.rev_grade eq 4 ? "checked" : ""} id="rate4"><label class='hover'  for="rate4">⭐</label>
						<input type="radio" name="rev_grade" value="3" ${vo.rev_grade eq 3 ? "checked" : ""} id="rate3"><label class='hover'  for="rate3">⭐</label>
						<input type="radio" name="rev_grade" value="2" ${vo.rev_grade eq 2 ? "checked" : ""} id="rate2"><label class='hover'  for="rate2">⭐</label>
						<input type="radio" name="rev_grade" value="1" ${vo.rev_grade eq 1 ? "checked" : ""} id="rate1"><label class='hover'  for="rate1">⭐</label>
					</fieldset>
			</td>
			<th style="width: 100px;">작성자</th>
			<td style="width: 200px;">
				${loginInfo.user_name}
				<input type="hidden" name="user_id" value="${loginInfo.user_id }"/>
			</td>
			
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5" style="text-align: left;">
				<input type="text"name="rev_title"  class="chk"
				 style="height: 30px; font-size: 20px; line-height: 30px; text-align: left;" />
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" style="text-align: left; height: 450px; ">
				<input type="text"  name="rev_content" class="chk"
				style="text-align: left; height: 500px; margin-bottom: 20px; padding: 20px; font-size: 15px; width: 98.5%; margin-right: 20px; font-size: 15px;" />
			</td>
		</tr>
	</table>
		
		
		
			<%-- <div style="text-align: left; width: 100%; height: 80px;">
				<span style="line-height: 80px; font-size: 30px;">
					<fieldset>
						<span class="text-bold">별점을 선택해주세요</span>
						<input type="radio" name="rev_grade" value="5" ${vo.rev_grade eq 5 ? "checked" : ""} id="rate5"><label class='hover'  for="rate5">⭐</label>
						<input type="radio" name="rev_grade" value="4" ${vo.rev_grade eq 4 ? "checked" : ""} id="rate4"><label class='hover'  for="rate4">⭐</label>
						<input type="radio" name="rev_grade" value="3" ${vo.rev_grade eq 3 ? "checked" : ""} id="rate3"><label class='hover'  for="rate3">⭐</label>
						<input type="radio" name="rev_grade" value="2" ${vo.rev_grade eq 2 ? "checked" : ""} id="rate2"><label class='hover'  for="rate2">⭐</label>
						<input type="radio" name="rev_grade" value="1" ${vo.rev_grade eq 1 ? "checked" : ""} id="rate1"><label class='hover'  for="rate1">⭐</label>
					</fieldset>
				</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="line-height: 80px; font-size: 30px;">${vo.user_id }</span>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<span style="line-height: 80px; font-size: 30px;">
					<fmt:parseDate value="${vo.rev_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate value="${date }" pattern="YY-MM-dd" />
				</span>
				
			</div>
			
			<div style="border-bottom: 1px solid; height: 1px; margin-bottom: 20px; margin-right: 20px;"></div>		
			
			<input type="text" value="${vo.rev_title }" name="rev_title"  class="chk"
				 style="height: 30px; font-size: 20px; line-height: 30px; text-align: left;" />
		
			<div style="border-bottom: 1px solid; height: 1px; margin-top: 20px; margin-right: 20px; margin-bottom: 20px;"></div>	
		
			<input type="text" value="${vo.rev_content }"  name="rev_content" class="chk"
				style="text-align: left; height: 500px; border: 1px solid; margin-bottom: 20px; padding: 20px; font-size: 15px; width: 98.5%; margin-right: 20px; font-size: 15px;" />
			 --%>
			 
			<div>
				<a class="btn-fill" onclick=" if(emptyCheck() ) { $('form').submit() }">저장하기</a>&nbsp;&nbsp;&nbsp;	
				<a class="btn-empty" href="shopList.my">취소하기</a>
			</div>
	
		</div>
	</form>	

</body>
</html>