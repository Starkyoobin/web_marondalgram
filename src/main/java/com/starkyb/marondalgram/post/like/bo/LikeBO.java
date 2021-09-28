package com.starkyb.marondalgram.post.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.marondalgram.post.like.dao.LikeDAO;
import com.starkyb.marondalgram.post.like.model.Like;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	public List<Like> getLikeListByPostId(int postId) {
		return likeDAO.selectLikeListByPostId(postId);
	}
}
