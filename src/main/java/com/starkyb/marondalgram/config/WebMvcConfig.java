package com.starkyb.marondalgram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.starkyb.marondalgram.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("files:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
}
