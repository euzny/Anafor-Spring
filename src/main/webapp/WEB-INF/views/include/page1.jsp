<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class='page_list'> <!-- 페이지 목록(번호)가 표시될 곳 -->

	<c:if test="${page1.curBlock gt 1 }">
						<!-- gt    > 와 같은 의미 -->
		<a class='page_prev' title="이전" onclick='go_page(${page1.beginPage - page1.blockPage})'> < Prev </a>
		<a class='page_first' title="처음" onclick='go_page(1)'>1</a>
		<span>&#183;&#183;&#183;</span>
	</c:if>
	
	<c:forEach var = "no" begin="${page1.beginPage }" end="${page1.endPage }">
		<!-- 현재 페이지인 경우 -->
		<c:if test="${no eq page1.curPage }">
			<span class="page_on">${no }</span>
		</c:if>
		<!-- 현재 페이지가 아닌 경우 -->
		<c:if test="${no ne page1.curPage }">
			<a class="page_off" onclick="go_page(${no})">${no }</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${page1.curBlock lt page1.totalBlock }">
						<!-- lt    <  와 같은 의미 -->
		<span>&#183;&#183;&#183;</span>
		<a class="page_last" title="마지막으로" onclick="go_page(${page1.totalPage})">${page1.totalPage }</a>
		<a class='page_next' title='다음' onclick="go_page(${page1.endPage+1})">Next ></a>
	</c:if>

</div>

<script type="text/javascript">
function go_page(page) {
	$('[name=curPage]').val(page);
	$('form').submit();
}

</script>

<style>
	.page_on, .page_off, .page_next, .page_last, .page_first, .page_prev {
		display : inline-block; line-height: 30px; margin: 0;
	}
	
	.page_on {

		color: black;
		font-weight: bold;
	}
	
	.page_on, .page_off, .page_first, .page_prev {
		min-width: 22px;
		padding: 0 5px 2px;
	}
	
</style>
















