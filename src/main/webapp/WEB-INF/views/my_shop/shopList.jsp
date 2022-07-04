<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 주문 목록</title>
</head>
<body>

<div style="background-color:#929292; width: 100%; height: 59px; padding: 20px;">
	<h3 style="font-size: 25px; font-weight: bold; text-align: left; color: white;">shop 관리</h3>
</div>

	<div style=" background-color: white; height: 100%; margin: 1%; max-height: 850px; padding: 10px;">
		<h3 style="font-weight: bold; font-size: 22px; margin-top: 15px;">My 주문 목록</h3>

		<table style="width: 100%; top: 20px;">
			<tr>
				<td style="font-weight: bold;">제품명</td>
				<td style="font-weight: bold;" class="w-px400">주문일</td>
				<td style="font-weight: bold;" class="w-px100">금액</td>
				<td style="font-weight: bold;" class="w-px160">수량</td>
				<td style="font-weight: bold;" class="w-px140">진행현황</td>
				<td style="font-weight: bold;" class="w-px300">기타</td>
			</tr>
			
			<c:if test="${ empty list }">
				<tr>
					<td colspan="6">주문 내역이 없습니다.</td>
				</tr>
			</c:if>
			
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>아나포 스마트 약통 AnaFor Smart Box IoT 알약 / 영양제 박스</td>
					<td>${vo.order_date }</td>
					<td class="right" ><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></td>
					<td>${vo.cnt }</td>
					<td style="color: red; font-weight: bold;">
						<c:choose>
							<c:when test="${vo.code eq 'so0' }">입금전</c:when>
							<c:when test="${vo.code eq 'so1' }">결제완료</c:when>
							<c:when test="${vo.code eq 'so2' }">상품준비중</c:when>
							<c:when test="${vo.code eq 'so3' }">배송시작</c:when>
							<c:when test="${vo.code eq 'so4' }">배송중</c:when>
							<c:when test="${vo.code eq 'so5' }">배송완료</c:when>
						</c:choose>
					</td>
			
					<td>
						<a class="btn-fill" href="shopDetail.my?id=${vo.id }" style="margin: 5px;">조회</a>
						<c:if test="${vo.code eq 'so5' }">
							<a class="btn-fill" href="reviewNew.rev?id=${vo.id }" style="margin: 5px;">리뷰</a>
						</c:if>
						<a class="btn-fill" href="new.cu?id=${vo.id }">문의</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script type="text/javascript">
var cancel = '${cancel}';
if (cancel === 'OK') {
	alert("주문이 정상적으로 취소되었습니다.");
}

var result = '${result}';
if (result === 'update'){
    alert('주문 정보가 수정되었습니다.');
}
</script>
</body>
</html>