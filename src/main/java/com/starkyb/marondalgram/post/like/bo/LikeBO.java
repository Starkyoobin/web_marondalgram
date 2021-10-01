package com.starkyb.marondalgram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.marondalgram.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean like(int userId, int postId) {
		//좋아요 상태면 좋아요 취소
		if(this.likeByUserId(userId, postId)) {
			int count = likeDAO.deleteLikeCancel(userId, postId);
					
			if(count == 0) {
				return false;
			} else {
				return true;
			}
		} else {	//좋아요 취소 상태면 좋아요
			int count = likeDAO.insertLike(userId, postId);
			
			if(count == 1) {
				return true;
			} else {
				return false;
			}
		}
	}
	//postId와 userId로 좋아요 여부 확인
	public boolean likeByUserId(int userId, int postId) {
		int count = likeDAO.selectCountLikeByUserId(userId, postId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	//postId로 생성된 좋야요 개수
	public int likeCount(int postId) {
		return likeDAO.selectCountLikeByPostId(postId);
	}
	
	public int likeCancel(int userId, int postId) {
		return likeDAO.deleteLikeCancel(userId, postId);
	}
	
	public int removeLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}
}
