<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
	<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/SplitText.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/rnbcafe/resources/js/moment.min.js"></script>
	<script src="/rnbcafe/resources/js/moment.js"></script>
	<script src="/rnbcafe/resources/js/transition.js"></script>
	<script src="/rnbcafe/resources/js/collapse.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/rnbcafe/resources/js/bootstrap-datetimepicker.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Varela+Round">
	<link rel="stylesheet" href="/rnbcafe/resources/css/index_highfive.css">
	<link rel="stylesheet" href="/rnbcafe/resources/css/loginform.css">
	

</head>
<body>
<div id="page-wrapper">
    <div class="container" style="margin-top: 100px;">
    	<div class="row">
      		<div class="col-md-4 col-md-offset-4">
				<div id="login">
					<h2><span class="fontawesome-lock"></span>Sign In</h2>
					<form action="login" method="POST">
						<fieldset>
							<p><label for="username">ID</label></p>
							<p><input type="text" id="username" name="username" placeholder="ID"></p>
							<p><label for="password">Password</label></p>
							<p><input type="password" id="password" name="password" placeholder="password"></p>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
							<p><input type="submit" value="Sign In"></p>
							<p><input type="button" id="join" value="Sign Up"></p>
						</fieldset>
					</form>
				</div>
				<!-- end login -->
			<!-- </div> -->
      		</div>
    	</div>
  	</div>
</div>
<h1>RNB CAFE</h1>
<div class='arm'>
  <div class='thumb'></div>
</div>
<div class='arm'>
  <div class='thumb'></div>
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
									<input class="form-control" type="text" id="name" name="name">
								</div><br>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">성별</label>
									<label class="radio-inline ">
									  <input type="radio" name="gender" id="gender1" value="1"> 남성
									</label>
									<label class="radio-inline ">
									  <input type="radio" name="gender" id="gender2" value="2"> 여성
									</label>
								</div><br>
								<div class="form-inline">
									<label class="col-xs-2 col-form-label">전화번호</label>
									<input class="form-control" type="text" id="phone" name="phone">
								</div><br>
								 <div class="form-group">
					                <div class='input-group date' id='datetimepicker'>
					                    <span class="input-group-addon">
					                        <span class="glyphicon glyphicon-calendar">생일</span>
					                    </span>
					                    <input type='text' class="form-control" id="birth" name="birth"/>
					                </div>
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
$(function() {
	moment().format("dddd, MMMM Do YYYY");
	$('#datetimepicker').datetimepicker({
		locale: 'ko',
		format: "YY.MM.DD"
	});
	mySplitText = new SplitText("h1", {type:"words,chars"}), 
    chars = mySplitText.chars; //an array of all the divs that wrap each character
});

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
	if ($.trim($('#birth').val()).length < 1) {
		alert('생일을 입력해 주세요');
		$('#birth').focus();
		return;
	}
	if ($.trim($('#phone').val()).length < 1) {
		alert('전화번호를 입력해 주세요');
		$('#phone').focus();
		return;
	}
	
	$.ajax({
		url: "/rnbcafe/member/insertMember",
		type: "POST",
		data: new FormData($('#frmMng')[0]),
		contentType: false,
	    processData: false,
		success: function(data) {
			if (data.success == true) {
        		alert("등록 되었습니다.");
	        	location.href = "/rnbcafe";
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
