<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 게시물 작성</title>
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
		
		<section class="d-flex justify-content-center">
			<div class="w-75">			
				<textarea class="form-control my-3" rows="5" id="contentInput"></textarea>
				<div>
					<input type="file" accept="image/*" id="fileInput" multiple>				
					<button type="button" class="btn btn-info" id="saveBtn">게시하기</button>
				</div>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#saveBtn").on("click", function() {
				var content = $("#contentInput").val().trim();
				var file = $("#fileInput").val();
				
				if(content == null || content == "") {
					alert("내용을 입력해주세요");
					return;
				}
				
				if(file == null || file == "") {
					alert("이미지 파일을 첨부해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				$.ajax({
					enctype:"multipart/form-data",	//파일업로드 필수
					processData:false,	//파일업로드 필수
					contentType:false,	//파일업로드 필수
					type:"post",
					url:"/post/create",
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							alert("게시 성공");
						} else {
							alert("게시 실패");
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