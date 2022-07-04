<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#review-table{
		margin:20px; height: auto; min-height:870px; background-color: #FFFFFF; border-radius:5px; padding-top:80px;
	}
	#review-table table{
		width:80%;
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
</style>
</head>
<body>
	<div style="background-color:#929292; width: 100%; height: 60px; padding: 20px;">
		<h3 style="font-size: 25px; font-weight: bold; text-align: left; color: white;">리뷰 상세 화면</h3>
	</div>
	<div id="review-table">
		<table>
		<tr>
			<th style="width: 150px;">별점</th>
				<td style="text-align: left;">
					<fieldset>
						<div class='align'>
							<c:forEach begin="1" end="${vo.rev_grade }">
								<span class='checked'>★</span>
							</c:forEach>
							<c:forEach begin="${vo.rev_grade+1}" end="5">
								<span class='unchecked'>★</span>
							</c:forEach>
						</div>
					</fieldset>
				</td>
			<th style="width: 100px;">작성자</th>
			<td style="width: 200px;">
				${vo.user_id}
			</td>
			<th style="width: 100px;">작성일자</th>
			<td style="width: 200px;">
				<fmt:parseDate value="${vo.rev_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${date }" pattern="YY-MM-dd" />
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="5" style="text-align: left;">
				${vo.rev_title }
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" style="text-align: left; height: 450px; ">
				${vo.rev_content }
			</td>
		</tr>
	</table>
	<div style="margin-top:30px">
		<a class="btn-fill" href="list.sp?id=${vo.rev_id }">목록으로</a>		
	</div>	
	</div>
</body>
</html>