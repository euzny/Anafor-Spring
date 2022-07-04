<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div style="width: 100%; height: 59px; padding: 20px; background-color: #929292; text-align: left;">
		<h3 style="font-size: 25px; font-weight: bold; text-align: left; color: white;">리뷰 내역</h3>
	</div>
	
	<div style="background-color: white; height: 800px; margin: 1%; max-height: 800px; padding: 10px;">
		<h3 style="font-weight: bold; font-size: 20px; margin: 20px;">리뷰 리스트</h3>							
		
		<table style="width: 80%;">
			<tr>
				<td style="width: 300px;">제품명</td>
				<td style="width: 150px; text-align: left;">리뷰제목</td>
				<td style="text-align: left;">리뷰내용</td>
				<td style="width: 150px;">작성자</td>
				<td style="width: 150px;">작성 일자</td>
			</tr>
			<c:if test="${empty page.list }">
				<tr>
					<td colspan="5" style="font-weight:500; font-size:14px; color:black">리뷰 정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${page.list }" var="vo">
				<tr>
					<td style="width: 300px;"><a style=" font-weight: bold;" href="reviewDetail.rev?id=${vo.rev_id }">아나포 스마트 약통 AnaFor SmartBOX</a></td>
					<td style="width: 150px; text-align: left;">${vo.rev_title }</td>
					
					<td style="text-align: left;"><a href="reviewDetail.rev?id=${vo.rev_id }">${vo.rev_content }</a></td>
					<td style="width: 150px;">${loginInfo.user_name }</td>
					<td style="width: 150px;">
						<fmt:parseDate value="${vo.rev_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${date }" pattern="YY-MM-dd" />
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	



</body>
</html>