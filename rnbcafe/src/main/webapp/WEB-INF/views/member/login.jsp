<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <!-- Latest compiled and minified CSS -->
    <!-- Latest compiled and minified JavaScript -->
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="resources/lib/bootstrap/3.3.6/dist/css/bootstrap.min.css"/>
    <script src="resources/lib/jquery/jquery-2.2.4.js"></script>
    <script src="resources/lib/bootstrap/3.3.6/dist/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div id="page-wrapper">
    <div class="container" style="margin-top: 100px;">
    	<div class="row">
      		<div class="col-md-4 col-md-offset-4">
        		<div class="panel panel-default">
          			<div class="panel-heading">
            			<h3 class="panel-title">로그인</h3>
          			</div>
           			<form class="form-signin" method="POST" action="login">
          			<div class="panel-body">
              				<fieldset>
                				<div class="form-group">
                  					<input type="text" name="username" class="form-control" placeholder="Username" required="required" autofocus="autofocus" />
                				</div>
                				
                				<div class="form-group">
                  					<input type="password" name="password" class="form-control" placeholder="Password" value="" required="required" />
                				</div>
                				
                 				<!-- <div class="checkbox">
                   					<label><input type="checkbox" value="remember-me" /> Remember me</label>
                 				</div> -->
                				
              				</fieldset>
              				
              				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          			</div>
          			<div class="panel-footer">
						<div align="right">
							<!-- button -->
               				<button id="join" class="btn btn-default" type="button">회원가입</button>
               				<button class="btn btn-success" type="submit">로그인</button>
						</div>
					</div>
           			</form>
        		</div>
      		</div>
    	</div>
  	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">제목</h4>
      </div>
      <div class="modal-body">
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form id="frmMng" name="frmMng" method="POST"
								enctype="multipart/form-data">
								<div class="form-inline">
									<label for="id" class="col-xs-2 col-form-label">ID</label>
									<input class="form-control" type="text" id="id" name="id">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">비밀번호</label>
									<input class="form-control" type="text" id="pwd" name="pwd">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">비밀번호 확인</label>
									<input class="form-control" type="text" id="pwdcheck" name="pwdcheck">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">이름</label>
									<
									<input class="form-control" type="text" id="name" name="name">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">성별</label>
									<input class="form-control" type="text" id="gender" name="gender">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">생일</label>
									<input class="form-control" type="text" id="birth" name="birth">
								</div>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">전화번호</label>
									<input class="form-control" type="text" id="phone" name="phone">
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							</form>
						</div>
					</div>
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button id="add" class="btn btn-success">등록</button>
      </div>
    </div>
  </div>
</div><!-- /#myModal -->

<script type="text/javascript">
$('#join').click(function() {
	$('#myModalLabel').text('회원가입');
	$('#myModal').appendTo("body").modal('show');
});

$('#add').click(function(e) {
	if ($.trim($('#id').val()).length < 1) {
		alert('ID을 입력해 주세요');
		$('#id').focus();
		return;
	}
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
	if ($.trim($('#name').val()).length < 1) {
		alert('이름을 입력해 주세요');
		$('#name').focus();
		return;
	}
	if ($.trim($('#id').val()).length < 1) {
		alert('ID을 입력해 주세요');
		$('#id').focus();
		return;
	}
	
	if ($.trim($('#bundle').val()).length < 1) {
		alert('bundle 파일을 등록해 주세요');
		$('#bundle').focus();
		return;
	}
	
	$.ajax({
		url: "/rnbcafe/member/insertMember",
		type: "POST",
		/* headers: headers, */
		data: new FormData($('#frmMng')[0]),
		contentType: false,
	    processData: false,
		success: function(data) {
			console.log(data);
			if (data.success == true) {
        		alert("등록 되었습니다.");
	        	location.href = "/";
        	} else {
        		alert("등록에 실패 하였습니다.\n" + data);
        	}
		},
		error: function(request, status, error) {
			console.log($('#frmMng')[0].value);
			alert("등록에 실패 하였습니다.\n" + request.status +"\n" +error);
		}
	});
});
</script>
</body>
</html>
