<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문자 목록</title>
</head>
<body>

<div style="background-color:#929292; width: 100%; height: 59px; padding: 20px;">
	<h3 style="font-size: 25px; font-weight: bold; text-align: left; color: white;">주문 관리</h3>
</div>

	<div style=" background-color: white; height: 800px; margin: 20px; min-height: 900px; padding: 10px; border-radius: 5px;">
		<h3 style="font-weight: bold; font-size: 22px; margin-top: 15px;">주문자 목록</h3>

	<div style="height: 770px;">
		<table style="width: 80%; top: 20px;">
			<tr>
				<td class="w-px100">이름</td>
				<td class="w-px340">주소</td>
				<td class="w-px140">연락처</td>
				<td class="w-px100">주문일</td>
				<td>제품명</td>
				<td class="w-px120">금액</td>
				<td class="w-px50">수량</td>
				<td class="w-px80">진행상황</td>
			</tr>
			
			<c:forEach items="${page1.list }" var="vo">
				<tr>
					<td><a href="shopDetail.sp?id=${vo.id }">${vo.name }</a></td>
					<td class="left">${vo.addr }</td>
					<td>${vo.tel }</td>
					<td>
						<fmt:parseDate value="${vo.order_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
           				<fmt:formatDate value="${date }" pattern="YY-MM-dd" />
					</td>
					<td>AnaFor Smart Box IoT 알약 / 영양제 박스</td>
					<td><fmt:formatNumber value="${vo.price }" pattern="#,##0원" /></td>
					<td>${vo.cnt }</td>
					<%-- <td>${vo.code_name }</td> --%>
					<td><select name="code" onchange="go_detail(this, ${vo.id })">
							<option value="so0" ${vo.code eq "so0" ? 'selected' : '' }>입금전</option>
							<option value="so1" ${vo.code eq "so1" ? 'selected' : '' }>결제완료</option>
							<option value="so2" ${vo.code eq "so2" ? 'selected' : '' }>상품준비</option>
							<option value="so3" ${vo.code eq "so3" ? 'selected' : '' }>배송시작</option>
							<option value="so4" ${vo.code eq "so4" ? 'selected' : '' }>배송중</option>
							<option value="so5" ${vo.code eq "so5" ? 'selected' : '' }>배송완료</option>
					</select></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
		<div>
			<form action="shopList.sp" method="post">
				<input type="hidden" name="curPage" value="1" />
				<jsp:include page="/WEB-INF/views/include/page1.jsp" />
			</form>
		</div>
		
	</div>
	
<script type="text/javascript">
function go_detail(code, id) {
    var msg = $("select[name=code] option:selected").html();
// text값은 가져올 때 해당 자식인 option의 선택된 개체를 가져와야 하는데 option:selected 해당 옵션이 없으면 select 자식으로 들어간 option값 전부를 가져오게 됨.
    $.ajax({   // 주문 진행 상황 변경을 위한 ajax 통신 설정
      url : "order_state_update.sp",
      data : {id:id, code:code.value},
      success : function (response) {   // success 는 통신이 잘 됐는지 안 됐는지 여부 판단
   if( response ){
       alert(msg + " 변경완료");
   }else {
       alert("진행상황 변경실패");         }//if
       }, error : function (req, text) {
   alert(text + " : " + req.status);
       }
});
/* 	$('[name=id]').val(id);	
	$('form').attr('action', 'order_state_update.sp');
	$('form').submit(); */
}

</script>
</body>
</html>