<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
	function updateBoard(bseq){
		location.href = "${root}/board/updateboard?bseq="+bseq;
	}
	
	function deleteBoard(bseq){
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "${root}/board/deleteboard?bseq="+bseq;
		}
	}
	
	function backBoard(){
		location.href = "${root}/board/boardlist";
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
				<th colspan="3">${dto.title}</th>
			</tr>
			<tr>
				<td style="color: skyblue">${dto.name}</td>
				<td>조회 ${dto.hit}</td>
				<td><fmt:formatDate value="${dto.regdate}" pattern="yy.MM.dd hh:mm"/></td>
			</tr>
			<tr>
				<td colspan="3" style="padding-top: 70px; padding-bottom: 70px;">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<button class="btn btn-warning btn-sm" onclick="updateBoard('${dto.bseq}');">
					<span class="glyphicon glyphicon-plus"></span> 수정</button>
					<button class="btn btn-danger btn-sm" onclick="deleteBoard('${dto.bseq}');">
					<span class="glyphicon glyphicon-minus"></span> 삭제</button>
					<button class="btn btn-default btn-sm" onclick="backBoard();">돌아가기</button>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>