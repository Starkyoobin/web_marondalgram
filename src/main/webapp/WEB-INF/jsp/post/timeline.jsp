<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 게시물 작성</title>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<div class="col-lg-7">
				<div class="border rounded my-2">			
					<div>
						<textarea class="form-control my-3" rows="3" id="contentInput"></textarea>				
					</div>
					<div class="d-flex justify-content-between m-2">
						<a href="#" id="imageUploadBtn"><i class="bi bi-card-image image-upload-icon"></i></a>
						<input class="d-none" type="file" accept="image/*" id="fileInput" multiple>				
						<button type="button" class="btn btn-info" id="saveBtn">게시하기</button>
					</div>
				</div>
				<!-- 피드 -->
				<c:forEach var="postDetail" items="${postList }">
					<div class="border rounded my-4">
						<div class="d-flex justify-content-between align-items-center p-2">
							<h4>${postDetail.post.userName }</h4>
							<a href="#" class="moerBtn text-dark"><i class="bi bi-three-dots"></i></a>				
						</div>
						<div class="d-flex justify-content-center my-1">
							<img width="650px" src="${postDetail.post.imagePath }" alt="게시물 이미지"> <br>						
						</div>
						<div class="d-flex m-2">
							<button type="button" class="likeBtn border-0"><i class="bi bi-heart like-icon"></i></button>
							<span>좋아요 개수</span>
						</div>
						<div class="middle-size m-2">
							<b>${postDetail.post.userName}</b>${postDetail.post.content }
						</div>
						<!-- 댓글 -->
						<div class="border-bottom m-2">댓글</div>
						<!-- postDetail > commentList -->
						<c:forEach var="comment" items="${postDetail.commentList }">
							<div class="m-2">
								<b>${comment.userName }</b>
								${comment.content }
							</div>
						</c:forEach>
						<div class="input-group">
							<input type="text" class="form-control" id="commentInput-${postDetail.post.id }">
							<button type="button" class="btn btn-info commentBtn" data-post-id="${postDetail.post.id }">게시</button>
						</div>
					</div>	
				<!-- 피드 -->
				</c:forEach>	
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#imageUploadBtn").on("click", function() {
				$("#fileInput").click();
			});
			
			$("#saveBtn").on("click", function() {
				var content = $("#contentInput").val().trim();
				var file = $("#fileInput").val();
				
				if(content == null || content == "") {
					alert("내용을 입력해주세요");
					return;
				}
				
				if(file == null || file =="") {
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
							location.reload();
						} else {
							alert("게시 실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
			});
			
			$(".commentBtn").on("click", function() {
				// postId, content
				var postId = $(this).data("post-id")
				//대응되는 input의 value
				var content = $("#commentInput-" + postId).val();
				
				if(content == null || content == "") {
					alert("댓글 내용이 없습니다");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("게시 실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
			});
			
			$(".likeBtn").on("click", function() {
				var postId = $(this).data("post-id");
			});
		});
	</script>
</body>
</html>