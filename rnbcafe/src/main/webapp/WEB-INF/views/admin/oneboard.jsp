<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>

<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		
		<div class="alert alert-info">
		  <strong><h3>등업게시판</h3></strong>
		</div>
		
		<div class="well well-lg">
			<form name="levelForm" id="levelForm" action="">
				<div class="row input-group-form">
					<div class="col-sm-10">
						<textarea class="form-control" rows="2" name="lcontent" id="lcontent"></textarea>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary btn-lg" id="levelWriteBtn">글쓰기</button>
					</div>
				</div>
			</form>
		</div>
		<table class="table table-striped">
			<tbody id="levelbody">
				
			</tbody>
		</table>
		<div class="col-sm-10 col-sm-offset-2">여기에 메인 화면 넣기</div>
		
	</div>
</div>

</body>
</html> 