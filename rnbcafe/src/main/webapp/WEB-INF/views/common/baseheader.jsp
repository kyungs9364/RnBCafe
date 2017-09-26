<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>RNB</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style type="text/css">
		#memoDiv {
			width: 825px;
			height: 200px;
			padding-top: 35px;
			padding-left: 33px;
			background-color: #F7F7F7;
			border: 1px solid #E5E5E5;
		}
		
		#comment {
			width: 825px;
			padding:20px;
			background-color: #F7F7F7;
			border: 1px solid #E5E5E5;
		}
		
		#imgboard {
			width: 150px;
			height: 100px;
			cursor: pointer;
		}
		
		.thumbnail b {
			font-size: 8pt;
		}
		
	</style>
</head>

<body>
<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">RnB Cafe</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="${root}">★</a></li>
				<li><a href="${root}/memberadmin/list">회원관리</a></li>
				<li><a href="${root}/admin/categoryadmin">카테고리관리</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						Sign Up</a></li>
				<li><a href="${root}/logout"><span class="glyphicon glyphicon-log-in"></span>
						Logout</a></li>
			</ul>
		</div>
	</div>
</nav>