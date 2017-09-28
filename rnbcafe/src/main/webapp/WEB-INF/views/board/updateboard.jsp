<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kosta.rnbcafe.board.dto.BoardDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
$(function() {
	  $('.summernote').summernote({
	    height: 400,          // 기본 높이값
	    minHeight: null,      // 최소 높이값(null은 제한 없음)
	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
	    focus: true,          // 페이지가 열릴때 포커스를 지정함
	    lang: 'ko-KR',        // 한국어 지정(기본값은 en-US)
	    callbacks: {
	          onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
			        sendFile(files[i], this);
	            }
	        }
      	}
	  });
});

function formReset(){
	<%BoardDto dto = (BoardDto)request.getAttribute("dto");%>
	document.f.reset();
	$('#content').summernote('code', '<%=dto.getContent()%>');
}

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: "POST",
		url: '${root}/board/insertimage',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(url) {
			console.log("successss")
			$(el).summernote('editor.insertImage', url);
			$('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
			$('#img').val(url);
		}
	});
}

function checkData(){
	if($("input[name=title]").val() == null || $("input[name=title]").val() == "") {
		alert("제목을 입력해주세요.");
		$("input[name=title]").focus();
		
	} else {
		if($("input[name=title]").val() == '${dto.title}' && $("#content").val() == '${dto.content}') {
			if(confirm("수정된 내용이 없습니다. 수정하시겠습니까 ?")) {
				document.f.submit();
			}
		} else {
			document.f.submit();
		}
	}
}

function backView(bseq){
	location.href = "${root}/board/boardview?bseq="+bseq;
}
</script>
<div class="col-sm-9 main">
	<form action="${root}/board/updateboard" method="post" name="f" id="f" onsubmit="return false">
		<input type="hidden" name="bseq" value="${dto.bseq}">
		<input type="hidden" name="img" id="img">
		<table class="table">
			<tr>
				<th colspan="2">
					<input type="text" name="title" value="${dto.title}">
				</th>
			</tr>
			<tr>
				<td style="color: skyblue">${dto.name}</td>
				<td>작성된 날짜 : <fmt:formatDate value="${dto.regdate}" pattern="yy.MM.dd hh:mm"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control summernote" id="content" name="content">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<button class="btn btn-primary btn-sm" onclick="checkData();">
						<span class="glyphicon glyphicon-ok"></span> 완료
					</button>
					<button class="btn btn-info btn-sm" onclick="formReset();">
						<span class="glyphicon glyphicon-repeat"></span> 되돌리기
					</button>
					<button class="btn btn-default btn-sm" onclick="backView(${dto.bseq});">돌아가기</button>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</div>
