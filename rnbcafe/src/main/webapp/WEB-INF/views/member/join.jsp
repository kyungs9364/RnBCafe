<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div id="page-wrapper">
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">멤버 등록</h3>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<form id="frmMng" name="frmMng" method="POST" enctype="multipart/form-data">						
						<div class="form-inline">
							<label for="id" class="col-xs-2 col-form-label">ID</label>
							<input class="form-control" type="text" id="id" name="id">
						</div><br>						
						<div class="form-inline">
							<label class="col-xs-2 col-form-label">비밀번호</label>
							<input class="form-control" type="text"	id="pwd" name="pwd">
						</div>
						<div class="form-inline">
							<label class="col-xs-2 col-form-label">이름</label>
							<input class="form-control" type="text"	id="name" name="name">
						</div>
						<div class="form-inline">
							<label class="col-xs-2 col-form-label">성별</label>
							<input class="form-control" type="text"	id="gender" name="gender">
						</div>
						<div class="form-inline">
							<label class="col-xs-2 col-form-label">생일</label>
							<input class="form-control" type="text"	id="birth" name="birth">
						</div>
						<div class="form-inline">
							<label class="col-xs-2 col-form-label">전화번호</label>
							<input class="form-control" type="text"	id="phone" name="phone">
						</div>
					</form>
				</div>
				<div class="panel-footer">
					<div align="right">
						<!-- button -->
						<button id="add" class="btn btn-success">등록</button>
						<button id="list" class="btn btn-default">목록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<script>
		$('#add').click(function(e) {
			/* if ($.trim($('#name').val()).length < 1) {
				alert('이름을 입력해 주세요');
				$('#name').focus();
				return;
			}
			
			if ($.trim($('#bundle').val()).length < 1) {
				alert('bundle 파일을 등록해 주세요');
				$('#bundle').focus();
				return;
			}
			
			if ($.trim($('#manifest').val()).length < 1) {
				alert('manifest 파일을 등록해 주세요');
				$('#manifest').focus();
				return;
			} */
			
			$.ajax({
				url: "/rnbcafe/member/add",
				type: "POST",
				headers: headers,
				data: new FormData($('#frmMng')[0]),
				contentType: false,
			    processData: false,
				success: function(data) {
					if (data.success == true) {
		        		alert("등록 되었습니다.");
			        	location.href = "/";
		        	} else {
		        		alert("등록에 실패 하였습니다.\n" + data);
		        	}
				},
				error: function(request, status, error) {
					alert("등록에 실패 하였습니다.\n" + request.status +"\n" +error);
				}
			});
		});
		
		$('#list').click(function() {
			//location.replace('/ar-admin/mon/list');
		});			
	</script>
</div>
</div>
</body>
</html>