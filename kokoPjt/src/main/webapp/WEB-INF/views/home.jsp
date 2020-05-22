<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/Login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/Login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/Login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/Login/css/main.css">
<!--===============================================================================================-->
</head>
<meta charset="utf-8">

<body>
<%-- 	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>KOKO</h2>
			</div>
			<div class="row-sm-7">
				<div class="login-box well">
				<sec:authorize access="isAuthenticated()">
					<a href = "/login/main2">Project List</a>
					<a href = "/login/logout">로그아웃</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<form id="loginForm" accept-charset="UTF-8" role="form" method="post" action="/login">
						<legend>LOGIN</legend>
						<div class="form-group">
							<label for="username">ID</label>
							<input name="username" placeholder="User ID" type="text" class="form-control" autofocus="autofocus">
						</div>
						<div class="form-group">
							<label for="password">PASSWORD</label>
							<input name="password" placeholder="Password" type="password" class="form-control">
						</div>
						<div class="form-group">
							<input id="loginBtn" type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login"/>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				</sec:authorize>
				</div>
			</div>
		</div>
	</div> --%>
	

<div class="limiter">
		<div class="container-login100" style="background-image: url('/resources/Login/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Account Login
				</span>
				<sec:authorize access="isAuthenticated()">
					<a href = "/login/main2">Project List</a>
					<a href = "/login/logout">로그아웃</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<form id="loginForm" class="login100-form validate-form p-b-33 p-t-5" accept-charset="UTF-8" role="form" method="post" action="/login">
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="username" placeholder="User name">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					<div class="container-login100-form-btn m-t-32">
						<button id="loginBtn" class="login100-form-btn" type="submit">
							Login
						</button>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				</sec:authorize>
			</div>
		</div>
	</div>
	
	
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/Login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/Login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/Login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->


<!-- <script type="text/javascript" src="/resources/js/jquery.min.js"></script> -->
<script>
$(document).ready(function () {
	$("#loginBtn").on("click", function(e){
		e.preventDefault();
		$("#loginForm").submit();
	});
});
</script>
</body>
</html>