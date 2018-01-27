package com.atguigu.bean;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class T_MALL_PRODUCT_EXT extends T_MALL_PRODUCT {
	
	private List<MultipartFile> files = new ArrayList<MultipartFile>();

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	
}
