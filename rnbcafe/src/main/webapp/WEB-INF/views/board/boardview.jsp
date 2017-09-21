<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
	function insertBoard(){
		location.href="${root}/board/insertboard";
	}
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<table class="table">
			<tr>
				<th colspan="2">${dto.title}</th>
			</tr>
			<tr>
				<td style="color: skyblue">${dto.name}</td>
				<td>조회 ${dto.hit}</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top: 70px; padding-bottom: 70px;">${dto.content}</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>