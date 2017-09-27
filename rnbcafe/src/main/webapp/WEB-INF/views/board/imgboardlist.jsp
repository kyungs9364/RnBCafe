<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script>

	$(function(){
		$(".img").click(function(){
			location.href="${root}/board/boardview?bseq="+$(this).attr("value");
		})
	});
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<b style="font-size: 20px; ">${bname} </b>
		<br><br><br>
		<div class="row">
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="dto">
						<div class="col-sm-4">
							<div>
								<div style="font-size: 9pt">[ ${dto.blname} ]</div>
								<div class="thumbnail">
									<div></div>
									<div class="caption">
										<h5 class="pull-right">
											<b>조회수 &nbsp;&nbsp;${dto.hit}</b>
										</h5>
										<h5>
											<img class="img" value="${dto.bseq}" id="imgboard" alt="photo"
												src="${dto.img}"/>
										</h5>
										<br>
										<h5>
											<b>작성자 : &nbsp;&nbsp;${dto.name}</b>
										</h5>
										<h5>
											<b>날짜 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <fmt:formatDate
													value="${dto.regdate}" pattern="yyyy.MM.dd" /></b>
										</h5>
									</div>
								</div>
								<div style="font-weight: bold; text-align: center;">
									<a href="${root}/board/boardview?bseq=${dto.bseq}">${dto.title}</a>
									<c:if test="${dto.mcnt ne 0}">
										&nbsp;<span style="color: red">[${dto.mcnt}]</span>
									</c:if>
								</div>
								<br> <br>
							</div>

						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<b>작성된 글이 존재 하지 않습니다.</b>
				</c:otherwise>
			</c:choose>
			<c:set var="page" value="${(pageCnt/6)+(1-((pageCnt/6)%1))%1}" />
			<fmt:formatNumber value="${page}" type="number" var="pageNum" />
		</div>
		<br>
		<div class="row">
			<div align="center">

				<c:set var="doneLoop" value="false" />
				<c:forEach begin="${startNum}" end="${pageNum}" step="1" var="cnt">
					<c:if test="${cnt gt startNum+9}">
						<a href="${root}/board/startpageset">...</a>
						<c:set var="doneLoop" value="true" />
					</c:if>
					<c:if test="${not doneLoop}">
						<c:if test="${cnt gt 10}">
							<a href="${root}/board/prevpage">...</a>
						</c:if>
						<a href="${root}/board/imgpageset?pageNum=${cnt}">${cnt}</a>&nbsp;
				</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

</body>
</html>