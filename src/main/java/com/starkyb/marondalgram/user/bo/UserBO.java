package com.starkyb.marondalgram.user.bo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starkyb.marondalgram.common.EncryptUtils;
import com.starkyb.marondalgram.user.dao.UserDAO;
import com.starkyb.marondalgram.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int addUser(String loginId, String password, String name, String email) {
		//password 암호화
		String encryptPassword = EncryptUtils.md5(password);
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUP] 암호화 실패 !!");
			return 0;
		}
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectCountById(loginId) == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectUserByLoginIdPassword(loginId, encryptPassword);
	}
}
