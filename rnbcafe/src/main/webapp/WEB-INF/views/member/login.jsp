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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/rnbcafe/resources/js/moment.min.js"></script>
	<script src="/rnbcafe/resources/js/moment.js"></script>
	<script src="/rnbcafe/resources/js/transition.js"></script>
	<script src="/rnbcafe/resources/js/collapse.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/rnbcafe/resources/js/bootstrap-datetimepicker.js"></script>
	 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Varela+Round">
<style type="text/css">
$color: #000;
$color-bg: #c0c0c0;

/* ---------- FONTAWESOME ---------- */
/* ---------- https://fortawesome.github.com/Font-Awesome/ ---------- */
/* ---------- http://weloveiconfonts.com/ ---------- */

@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* ---------- ERIC MEYER'S RESET CSS ---------- */
/* ---------- https://meyerweb.com/eric/tools/css/reset/ ---------- */

@import url(https://meyerweb.com/eric/tools/css/reset/reset.css);

/* ---------- FONTAWESOME ---------- */

[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

/* ---------- GENERAL ---------- */

* {
  box-sizing: border-box;

  &:before,
  &:after {
    box-sizing: border-box;
  }
  
}

 body {
	background: #F2F2F2;
	/* color: $color;
	font: 100%/1.5em "Varela Round", sans-serif;
  margin: 0; */
} 

input {
  background-image: none;
  border: none;
  font: 100%/1.5em "Varela Round", sans-serif;
  margin: 0;
  padding: 0;
  transition: all .3s;
}

/* .container {
  left: 50%;
  position: fixed;
  top: 50%;
  transform: translate(-50%, -50%);
} */

/* ---------- LOGIN ---------- */

#login {
	width: 400px;
}

#login h2 {
	background: #f95252;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 28px;
	padding: 20px 26px;
}

#login h2 span[class*="fontawesome-"] {
	margin-right: 14px;
}

#login fieldset {
	background: #fff;
	border-radius: 0 0 20px 20px;
	padding: 20px 26px;
}

#login fieldset p {
	color: #777;
	margin-bottom: 14px;
}

#login fieldset p:last-child {
	margin-bottom: 0;
}

#login fieldset input {
	border-radius: 3px;
}

#login fieldset input[type="text"], #login fieldset input[type="password"] {
	background: #eee;
	color: #777;
	padding: 4px 10px;
	width: 100%;
}

#login fieldset input[type="submit"] {
	background: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100%;
}
#login fieldset input[type="button"] {
	background: #33cc77;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100%;
}

#login fieldset input[type="submit"]:hover {
	background: #28ad63;
}
#login fieldset input[type="button"]:hover {
	background: #28ad63;
}
</style>
</head>
<body>
<div id="page-wrapper">
    <div class="container" style="margin-top: 100px;">
    	<div class="row">
      		<div class="col-md-4 col-md-offset-4">
        		<%-- <div class="panel panel-default">
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
           			</form> --%>

						<div id="login">
							<h2><span class="fontawesome-lock"></span>Sign In</h2>
							<form action="login" method="POST">
								<fieldset>
									<p><label for="username">ID</label></p>
									<p><input type="text" id="username" name="username" placeholder="ID"></p>
									<p><label for="password">Password</label></p>
									<p><input type="password" id="password" name="password" placeholder="password"></p>
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
									<p><input type="button" id="join" value="Sign Up"></p>
									<p><input type="submit" value="Sign In"></p>
								</fieldset>
							</form>
						</div>
						<!-- end login -->
					<!-- </div> -->
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
		format: "YYYY-MM-DD"
	});

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
