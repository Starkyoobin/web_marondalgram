package com.starkyb.marondalgram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.starkyb.marondalgram.common.FileManagerService;
import com.starkyb.marondalgram.post.dao.PostDAO;

@Service
public class PostBO {
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		String imagePath = null;
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.insertPost(userId, content, imagePath);
	}
}
