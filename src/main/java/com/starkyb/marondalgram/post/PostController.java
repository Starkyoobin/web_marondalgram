package com.starkyb.marondalgram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.starkyb.marondalgram.post.bo.PostBO;
import com.starkyb.marondalgram.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline")
	public String createView(Model model) {		
		List<PostDetail> postList = postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}
}
