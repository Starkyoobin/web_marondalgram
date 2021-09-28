package com.starkyb.marondalgram.post.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starkyb.marondalgram.post.like.model.Like;

@Repository
public interface LikeDAO {
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public List<Like> selectLikeListByPostId(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
