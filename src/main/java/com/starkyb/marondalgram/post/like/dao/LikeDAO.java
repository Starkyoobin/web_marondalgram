package com.starkyb.marondalgram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountLikeByUserId(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountLikeByPostId(@Param("postId") int postId);
	
	public int deleteLikeCancel(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);
}
