<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 회원가입 화면</title>
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
		
		<section class="d-flex justify-content-center my-5">
			<div>
				<div class="join-box d-flex align-items-center justify-content-center">
					<div class="w-100 p-5">
						<h3 class="text-center mt-1">Marondalgram</h3>
						<span id="introduce"><b>친구들의 사진과 동영상을 보려면 가입하세요.</b></span>
						<form id="signupForm">
							<div class="d-flex input-group">
								<input type="text" id="loginId" class="form-control mt-3" placeholder="아이디">
								<button id="isDuplicate" class="btn btn-primary">중복확인</button>							
							</div>
							<input type="password" id="password" class="form-control mt-2" placeholder="비밀번호">
							<input type="password" id="passwordConfirm" class="form-control mt-2" placeholder="비밀번호 확인">
							<input type="text" id="name" class="form-control mt-2" placeholder="이름">
							<input type="text" id="email" class="form-control mt-2" placeholder="이메일">
							
							<button id="joinBtn" type="submit" class="btn btn-primary mt-3 form-control">가입</button>
						</form>				
					</div>
				</div>
				<div class="user-box d-flex align-items-center justify-content-center mt-4">
					<span>계정이 있으신가요?</span>&nbsp&nbsp
					<a href="/user/signin_view"><b>로그인</b></a>
				</div>			
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#signupForm").on("submit", function(e) {
				e.preventDefault();
				
				var loginId = $("#loginId").val();
				var password = $("#password").val();
				var passwordConfirm = $("#passwordConfirm").val();
				var name = $("#name").val();
				var email = $("#email").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디을 입력하세요");
					return;
				}
				
				if(password == null || password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지않습니다");
					return;
				}
				
				if(name == null || name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if(email == null || email == "") {
					alert("이메일을 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin_view";
						} else {
							alertt("회원가입 실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
			});
		});
	</script>
</body>
</html>