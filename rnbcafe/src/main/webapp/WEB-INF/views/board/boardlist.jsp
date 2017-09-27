<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script type="text/javascript">
	function insertBoard() {
		location.href = "${root}/board/insertboard";
	}
	function insertNotice() {
		location.href = "${root}/board/insertnotice";
	}
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<b style="font-size: 20px;">${bname} </b>
		<br><br>

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
			<tr align="center">
				<td width="80px;">#</td>
				<td width="430px;">제목</td>
				<td>글쓴이</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.notice==1}">
							<tr class="active">
								<td align="center"><span class="glyphicon glyphicon-bullhorn"></span></td>
								<td>&nbsp;&nbsp;<a href="${root}/board/boardview?bseq=${dto.bseq}">
								<font color="black"><b>[공지]</b> ${dto.title}</font></a></td>
								<td align="center">${dto.name}</td>
								<td align="center"><fmt:formatDate value="${dto.regdate}"
										pattern="yyyy.MM.dd" /></td>
								<td align="center">${dto.hit}</td>
							</tr>
						</c:if>
						<c:if test="${dto.notice==0}">
							<tr>
								<td align="center">${dto.bseq}</td>
								<td>
									&nbsp;&nbsp;<a href="${root}/board/boardview?bseq=${dto.bseq}">${dto.title}</a>
									<c:if test="${dto.mcnt ne 0}">
										&nbsp;<span style="color: red">[${dto.mcnt}]</span>
									</c:if>
									<c:if test="${!empty dto.img}">
										&nbsp;<img src="${root}/resources/img/image_icon.png" alt="image_icon" style="width: 20px; height: 20px;">
									</c:if>
								
								</td>
								<td align="center">${dto.name}</td>
								<td align="center"><fmt:formatDate value="${dto.regdate}"
										pattern="yyyy.MM.dd" /></td>
								<td align="center">${dto.hit}</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="color: red; text-align: center;"><b>작성된
								글이 존재 하지 않습니다.</b></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br>
		<button class="btn btn-primary btn-xs" onclick="insertBoard();">
			<span class="glyphicon glyphicon-pencil"></span> 글쓰기
		</button>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button class="btn btn-info btn-xs" onclick="insertNotice();">
				<span class="glyphicon glyphicon-ok-sign"></span> 공지사항
			</button>
		</sec:authorize>
		<div style="text-align: center;">
			<c:set var="page" value="${(pageCnt/10)+(1-((pageCnt/10)%1))%1}" />
			<fmt:formatNumber value="${page}" type="number" var="pageNum" />

			<c:set var="searchPage"
				value="${(searchPageCnt/10)+(1-((searchPageCnt/10)%1))%1}" />
			<fmt:formatNumber value="${searchPage}" type="number"
				var="searchPageNum" />

			<br>
			<c:set var="doneLoop" value="false" />
			<c:set var="prevbreak" value="false" />
			<c:set var="nextbreak" value="false" />
			<c:forEach begin="${startNum}" end="${pageNum}" step="1" var="cnt">
				<c:if test="${not nextbreak}">
					<c:if test="${cnt gt startNum+9}">
						<a href="${root}/board/startpageset">...</a>
						<c:set var="nextbreak" value="true" />
						<c:set var="doneLoop" value="true"/>
					</c:if>
				</c:if>
				
				<c:if test="${not doneLoop}">
					<c:if test="${not prevbreak}">
						<c:if test="${cnt gt 10}">
							<a href="${root}/board/prevpage">...</a>
							<c:set var="prevbreak" value="true" />
						</c:if>
					</c:if>
					<c:if test="${cnt ne 0}">
						<a href="${root}/board/pageset?pageNum=${cnt}">${cnt}</a>&nbsp;
					</c:if>
				</c:if>

			</c:forEach>

			<c:forEach begin="1" end="${searchPageNum}" step="1" var="cnt">
				<a href="${root}/board/searchpageset?searchpagenum=${cnt}">${cnt}</a>&nbsp;
			</c:forEach>
		</div>
		<br><br>
		<div align="center">
			<form action="${root}/board/searchset" method="get">
				<select class="form-control" name="key" style="height: 34px; width: 80px; display: inline;">
					<option value="TITLE">제목</option>
					<option value="NAME">이름</option>
				</select> 
				<input class="form-control" type="text" name="word" style="vertical-align: top; width: 300px; display: inline;" /> 
				<input class="btn btn-primary btn-m" type="submit" style="vertical-align: top;" value="검색" />
			</form>
		</div>
		<br><br>
	</div>
</div>

</body>
</html>