package com.starkyb.marondalgram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.starkyb.marondalgram.user.bo.UserBO;
import com.starkyb.marondalgram.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/is_duplicate_id")
	public Map<String, Boolean> isDuplicateLoginId(@RequestParam("loginId") String loginId) {
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicateId(loginId)) {
			result.put("is_duplicate", true);
		} else {
			result.put("is_duplicate", false);
		}
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, String> signIn(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userloginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
