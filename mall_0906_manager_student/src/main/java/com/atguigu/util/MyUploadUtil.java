package com.atguigu.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MyUploadUtil {

	public static List<String> savePicture(List<MultipartFile> files) {
		List<String> imagePaths = new ArrayList<String>();
		
		//获取文件上传的路径
		String path = MyPropertieUtil.getPath("upload.properties","windows_path");
		
		for (MultipartFile file : files) {
			//获取图片名称
			String picName = file.getOriginalFilename();
			
			//处理图片名称
			picName = System.currentTimeMillis() + picName;
			
			//上传图片
			try {
				file.transferTo(new File(path + File.separator + picName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			//将文件名保存到list集合中
			imagePaths.add(picName);
		}
		
		return imagePaths;
	}

}
