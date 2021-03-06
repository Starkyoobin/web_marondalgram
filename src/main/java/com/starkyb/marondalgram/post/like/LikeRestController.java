package com.starkyb.marondalgram.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.starkyb.marondalgram.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> postLike(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
//		int count = likeBO.addLike(userId, postId);
		boolean isLike = likeBO.like(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(isLike) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/like_cancel")
	public Map<String, String> postLikeCancel(
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.likeCancel(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		
		return result;
	}
}
