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
		<h3>자유게시판</h3>

		<button class="btn btn-default btn-xs" onclick="insertBoard();">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</button>
		<br> <br>
		<table class="table">
			<tr>
				<th>#</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.bseq}</td>
							<td><a href="${root}/board/boardview?bseq=${dto.bseq}">${dto.title}</a></td>
							<td>${dto.name}</td>
							<td>${dto.regdate}</td>
							<td>${dto.hit}</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="color: red; text-align: center;"><b>작성된 글이 존재 하지 않습니다.</b></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table><br>
			<button class="btn btn-default btn-xs" onclick="insertBoard();">
				<span class="glyphicon glyphicon-pencil"></span> 글쓰기
			</button>
			<div style="text-align: center;">
				<span>페이징부분</span>
			</div>
			<br><br>
			<div>
				<select name="key" style="height: 27px;">
					<option>아이디</option>
					<option>제목</option>
				</select>
				<input type="text" name="word" style="vertical-align: top;"/>
				<input class="btn btn-primary btn-sm" type="button" name="search" value="검색"/>
			</div>
	</div>
</div>

</body>
</html>