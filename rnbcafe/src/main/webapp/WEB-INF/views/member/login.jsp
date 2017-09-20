<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          			<div class="panel-body">
            			<form class="form-signin" method="POST" action="login">
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
                				
                				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
              				</fieldset>
              				
              				 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            			</form>
          			</div>
        		</div>
      		</div>
    	</div>
  	</div>
</div>
</body>
</html>
