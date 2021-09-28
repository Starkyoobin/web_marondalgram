package com.starkyb.marondalgram.post.model;

import java.util.List;

import com.starkyb.marondalgram.post.comment.model.Comment;
import com.starkyb.marondalgram.post.like.model.Like;

public class PostDetail {
	private Post post;
	private List<Comment> commentList;
	private Like like;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public Like getLike() {
		return like;
	}
	public void setLike(Like like) {
		this.like = like;
	}	
}
