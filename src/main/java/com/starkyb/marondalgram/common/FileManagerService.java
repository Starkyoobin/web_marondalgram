package com.starkyb.marondalgram.common;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	private final String FILE_UPLOAD_PATH = "C:\\Users\\yb010\\Desktop\\Web\\SPRINGTEST\\marondalgram\\images/";
	
	public String saveFile(int userId, MultipartFile file) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			logger.error("[FileManagerService saveFile] 디렉토리 생성 에러");
			return null;
		}
	}
}
