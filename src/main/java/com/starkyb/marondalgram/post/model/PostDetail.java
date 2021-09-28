package com.starkyb.marondalgram.post.model;

import java.util.List;

import com.starkyb.marondalgram.post.comment.model.Comment;
import com.starkyb.marondalgram.post.like.model.Like;

public class PostDetail {
	private Post post;
	private List<Comment> commentList;
	private List<Like> likeList;
	
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
	public List<Like> getLikeList() {
		return likeList;
	}
	public void setLikeList(List<Like> likeList) {
		this.likeList = likeList;
	}
}
