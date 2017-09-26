<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/common/baseheader.jsp"%>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(function() {
	  $('#summernote').summernote({
	    height: 400,          // 기본 높이값
	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
	});
});


function backList(){
	location.href="${root}/board/boardlist";
}
</script>
<div class="container" style="margin-top: 70px">
	<div class="col-sm-3 sidenav">
		<!-- 사이드 -->
		<%@ include file="/WEB-INF/views/common/baseside.jsp"%>
	</div>

	<div class="col-sm-9 main">
		<form action="${root}/board/insertboard" method="post">
			<input type="hidden" name="id" value="${user.id}">
			<div>
				<input class="form-control" type="text" placeholder="제목을 입력해주세요"
					name="title"><br>
			</div>
			<div>
				<textarea class="form-control summernote" id="summernote"
					name="content"></textarea>
			</div>
			<div align="center">
				<input class="btn btn-default btn-sm" type="submit" value="확인" /> <input
					class="btn btn-default btn-sm" type="button" value="돌아가기"
					onclick="backList();" />
			</div>
		</form>
	</div>
</div>

</body>
</html>
