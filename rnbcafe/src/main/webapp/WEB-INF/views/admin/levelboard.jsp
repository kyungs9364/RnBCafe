<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>
<div class="container" style="margin-top: 70px">
	<div class="row">
<!-- 사이드바 -->
		<div class="col-sm-3 sidenav">
			<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
		</div>
<!-- 여기서부터 게시판 메인 꾸미기 -->

		<div class="col-sm-9 main">
			등업게시판
			<div class="jumbotron" style="">
				<form name="levelForm" id="levelForm" action="">
					<div class="row input-group-form">
						<div class="col-sm-10">
							<textarea class="form-control" rows="3" name="lcontent" id="lcontent"></textarea>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-primary btn-sm" id="levelWriteBtn"></button>
						</div>
					</div>
				</form>
			</div>
			<table class="table table-striped">
				<tbody id="levelbody"></tbody>
			</table>
			<div class="col-sm-10 col-sm-offset-2">여기에 메인 화면 넣기</div>
		</div>

<!-- 여기까지가 우리가 꾸밀부분 -->
<!-- 푸터 -->

	</div>
</div>