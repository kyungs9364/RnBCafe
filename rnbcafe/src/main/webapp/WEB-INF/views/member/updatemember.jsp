<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="col-sm-9 main">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="frmMng" name="frmMng" method="POST" enctype="multipart/form-data">
							<div class="form-inline">
								<label for="id" class="col-xs-2 col-form-label">ID</label>
								<input class="form-control" type="text" id="id" name="id" value="${member.id }" readonly="readonly">
							</div><br>
							<div class="form-inline">
								<label class="col-xs-2 col-form-label">비밀번호</label>
								<input class="form-control" type="password" id="pwd" name="pwd">
							</div><br>
							<div class="form-inline">
								<label class="col-xs-2 col-form-label">비밀번호확인</label>
								<input class="form-control" type="password" id="pwdcheck" name="pwdcheck">
							</div><br>
							<div class="form-inline">
								<label class="col-xs-2 col-form-label">이름</label>
								<input class="form-control" type="text" id="name" name="name" value="${member.name }">
							</div><br>
							<%-- <div class="form-inline">
								<label class="col-xs-2 col-form-label">성별</label>
								<label class="radio-inline ">
								  <input type="radio" name="gender" id="gender1" value="1" <c:if test="${user.gender==1}">checked="checked"</c:if> readonly="readonly"> 남성
								</label>
								<label class="radio-inline ">
								  <input type="radio" name="gender" id="gender2" value="2" <c:if test="${user.gender==2}">checked="checked"</c:if> readonly="readonly"> 여성
								</label>
							</div><br>
							<div class="form-inline">
								<label class="col-xs-2 col-form-label" readonly="readonly">생일</label>
								<input class="form-control" type="text" id="birth" name="birth">
							</div><br> --%>
							<div class="form-inline">
								<label class="col-xs-2 col-form-label">전화번호</label>
								<input class="form-control" type="text" id="phone" name="phone" value="${member.phone }">
							</div><br>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
					<div class="panel-footer">
					<div align="right">
						<!-- button -->
						<button id="del" class="btn btn-danger">탈퇴</button>
						<button id="add" class="btn btn-success">변경</button>
						<button id="list" class="btn btn-default">취소</button>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$('#add').click(function(e) {
	if ($.trim($('#pwd').val()).length < 1) {
		alert('비밀번호를 입력해 주세요');
		$('#pwd').focus();
		return;
	}
	if ($.trim($('#pwdcheck').val()).length < 1) {
		alert('비밀번호 확인을 입력해 주세요');
		$('#pwdcheck').focus();
		return;
	}
	if ($.trim($('#pwdcheck').val()) !=  $.trim($('#pwd').val())) {
		alert('비밀번호가 일치하지않습니다.');
		$('#pwdcheck').focus();
		return;
	}
	if ($.trim($('#name').val()).length < 1) {
		alert('이름을 입력해 주세요');
		$('#name').focus();
		return;
	}
	if ($.trim($('#phone').val()).length < 1) {
		alert('전화번호를 입력해 주세요');
		$('#phone').focus();
		return;
	}
	
	$.ajax({
		url: "/rnbcafe/member/updateMember",
		type: "POST",
		data: new FormData($('#frmMng')[0]),
		contentType: false,
	    processData: false,
		success: function(data) {
			if (data.success == true) {
        		alert("변경 되었습니다.");
        		getMyinfo();
	        	location.href = "/rnbcafe";
        	} else {
        		alert("변경 실패 하였습니다.\n" + data);
        	}
		},
		error: function(request, status, error) {
			console.log($('#frmMng')[0].value);
			alert("변경 실패 하였습니다.\n" + request.status +"\n" +error);
		}
	});
});

$('#del').click(function() {
	if (confirm("정말 탈퇴하시겠습니까?")) {
		$.ajax({
			url: "/rnbcafe/member/deleteMember",
			type: "POST",
			data: new FormData($('#frmMng')[0]),
			contentType: false,
		    processData: false,
			success: function(data) {
				if (data.success == true) {
	        		alert("탈퇴 되었습니다.");
		        	location.href = "/rnbcafe/logout";
	        	} else {
	        		alert("탈퇴 실패 하였습니다.\n" + data);
	        	}
			},
			error: function(request, status, error) {
				console.log($('#frmMng')[0].value);
				alert("탈퇴 실패 하였습니다.\n" + request.status +"\n" +error);
			}
		});
	}
});

$('#list').click(function() {
	location.replace('/rnbcafe');
});
</script>