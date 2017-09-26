<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<script>
	function boardView(){
		alert("boardView !!");
	}
</script>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
			<h3>&nbsp;&nbsp;${bname}</h3><br>
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${!empty list}"> --%>
<%-- 				<c:forEach items="${list}" var="dto"> --%>
				<c:forEach begin="1" end="4" step="1" var="dto">
					<div class="col-sm-4">
						<div>
							<div class="thumbnail">
							<div></div>
							<div class="caption">
								<h5 class="pull-right">
									<b>조회수 &nbsp;&nbsp;3</b>
									<%-- ${dto.hit} --%>
								</h5>
								<h5>
									<img onclick="boardView();" id="imgboard" alt="photo" src="http://3.bp.blogspot.com/-IXJPvhRaLys/VN28jKXSEqI/AAAAAAAACeo/JE4ohwF49HY/s1600/valentines-day-2015-5081660856991744.5-hp.gif">
								</h5><br>
								<h5>
									<b>작성자 : &nbsp;&nbsp;양경석</b>
									<%-- ${dto.name} --%>
								</h5>
								<h5>
									<b>날짜 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2017.09.26</b>
									<%-- <fmt:formatDate value="${dto.regdate}" pattern="yyyy.MM.dd" /> --%>
								</h5>
							</div>
						</div>
							<div style="font-weight: bold; text-align: center;">
								<a href="javascript:boardView();">타이틀 부분입니다.<%-- ${dto.title} --%></a>
							</div><br><br>
						</div>

					</div>
				</c:forEach>
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<b>작성된 글이 존재 하지 않습니다.</b> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</div>
</div>

</body>
</html>