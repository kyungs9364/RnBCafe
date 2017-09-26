<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
	function insertBoard(){
		location.href="${root}/board/insertboard";
	}
	function insertNotice(){
		location.href="${root}/board/insertnotice";
	}
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<h3>${bname}</h3><br>

		<button class="btn btn-primary btn-xs" onclick="insertBoard();">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</button>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button class="btn btn-info btn-xs" onclick="insertNotice();">
				<span class="glyphicon glyphicon-ok-sign"></span> 공지사항
			</button>
		</sec:authorize>
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
						<c:if test="${dto.notice==1}">
							<tr class="active">
								<td>${dto.bseq}</td>
								<td><a href="${root}/board/boardview?bseq=${dto.bseq}"><font color="black"><b>${dto.title}</b></font></a></td>
								<td>${dto.name}</td>
								<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd"/></td>
								<td>${dto.hit}</td>
							</tr>
						</c:if>
						<c:if test="${dto.notice==0}">
							<tr>
								<td>${dto.bseq}</td>
								<td><a href="${root}/board/boardview?bseq=${dto.bseq}">${dto.title}</a></td>
								<td>${dto.name}</td>
								<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd"/></td>
								<td>${dto.hit}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="color: red; text-align: center;"><b>작성된 글이 존재 하지 않습니다.</b></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table><br>
			<button class="btn btn-primary btn-xs" onclick="insertBoard();">
				<span class="glyphicon glyphicon-pencil"></span> 글쓰기
			</button>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="btn btn-info btn-xs" onclick="insertNotice();">
					<span class="glyphicon glyphicon-ok-sign"></span> 공지사항
				</button>
			</sec:authorize>
			<div style="text-align: center;">
				<c:set var="page" value="${(pageCnt/10)+(1-((pageCnt/10)%1))%1}"/>
				<fmt:formatNumber value="${page}" type="number" var="pageNum"/>
				
				<c:set var="searchPage" value="${(searchPageCnt/10)+(1-((searchPageCnt/10)%1))%1}"/>
				<fmt:formatNumber value="${searchPage}" type="number" var="searchPageNum"/>
				
				<br>
				<c:set var="doneLoop" value="false"/> 
				<c:forEach begin="${startNum}" end="${pageNum}" step="1" var="cnt">
				<c:if test="${cnt gt startNum+9}">
					<a href="${root}/board/startpageset">...</a>
				<c:set var="doneLoop" value="true"/>
				</c:if>
				<c:if test="${not doneLoop}">
					<c:if test="${cnt gt 10}">
						<a href="${root}/board/prevpage">...</a>
					</c:if>
					<a href="${root}/board/pageset?pageNum=${cnt}">${cnt}</a>&nbsp;
				</c:if>
				</c:forEach>
				
				<c:forEach begin="1" end="${searchPageNum}" step="1" var="cnt">
					<a href="${root}/board/searchpageset?searchpagenum=${cnt}">${cnt}</a>&nbsp;
				</c:forEach>
			</div>
			<br><br>
			<div>
				<form action="${root}/board/searchset" method="get">
					<select name="key" style="height: 27px;">
						<option value="TITLE">제목</option>
						<option value="NAME">이름</option>
					</select>
					<input type="text" name="word" style="vertical-align: top;"/>
					<input class="btn btn-primary btn-sm" type="submit" value="검색"/>
				</form>
			</div>
	</div>
</div>

</body>
</html>