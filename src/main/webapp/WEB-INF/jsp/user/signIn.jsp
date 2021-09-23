<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 로그인 화면</title>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="content d-flex justify-content-center my-5">
			<div class="mr-5">
				<img width="400px" alt="instagram" src="data:image/jpeg;base64,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">
			</div>
			<div>
				<div class="login-box d-flex align-items-center justify-content-center">
					<div class="w-100 p-5">
						<h3>Marondalgram</h3>
						<form id="loginForm">
							<input type="text" id="loginId" class="form-control mt-3" placeholder="아이디">
							<input type="password" id="password" class="form-control mt-2" placeholder="비밀번호">
							<input id="loginBtn" type="submit" class="btn btn-primary form-control mt-3" value="로그인">
						</form>
						<div class="text-center mt-4">
							<a href="#" class="text-dark">비밀번호를 잊으셨나요?</a>				
						</div>
					</div>
				</div>		
				<div class="user-box d-flex align-items-center justify-content-center mt-4">
					<span>계정이 없으신가요?</span>&nbsp&nbsp
					<a href="/user/signup_view"><b>회원가입</b></a>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#loginForm").on("submit", function(e) {
				e.preventDefault();
				
				var loginId = $("#loginId").val();
				var password = $("#password").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/timeline";
						} else {
							alert("아이디 비밀번호를 확인해주세요");
						}
					},
					fail:function(e) {
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>