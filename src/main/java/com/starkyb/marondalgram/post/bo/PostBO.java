package com.starkyb.marondalgram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.starkyb.marondalgram.common.FileManagerService;
import com.starkyb.marondalgram.post.comment.bo.CommentBO;
import com.starkyb.marondalgram.post.comment.model.Comment;
import com.starkyb.marondalgram.post.dao.PostDAO;
import com.starkyb.marondalgram.post.like.bo.LikeBO;
import com.starkyb.marondalgram.post.model.Post;
import com.starkyb.marondalgram.post.model.PostDetail;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {
		String imagePath = null;
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.insertPost(userId, userName, content, imagePath);
	}
	
	public List<PostDetail> getPostList(int userId) {
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		//포스트 하나당 댓글 가져오기
		for(Post post : postList) {
			//해당 포스트의 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentListByPostId(post.getId());
			//해당 포스트를 현재 로그인한 사용자가 좋아요 했는지 확인
			boolean isLike = likeBO.likeByUserId(userId, post.getId());
			//해당 포스트의 좋아요 개수
			int likeCount = likeBO.likeCount(post.getId());
			//post와 댓글 매칭
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			//post와 좋아요 관련
			postDetail.setLike(isLike);
			postDetail.setLikeCount(likeCount);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public boolean removePost(int userId, int id) {
		Post post = postDAO.selectPost(id);
		
		int count = postDAO.deletePost(userId, id);
		
		if(count != 1) {
			return false;
		}
		
		FileManagerService fileManagerService = new FileManagerService();
		fileManagerService.deleteFile(post.getImagePath());
		
		//댓글 삭제
		commentBO.removeCommentByPostId(id);
		//좋아요 삭제
		likeBO.removeLikeByPostId(id);
		
		return true;
	}
}
