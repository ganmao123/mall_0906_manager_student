package com.atguigu.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertieUtil {

	public static String getPath(String property, String key) {
		Properties prop = new Properties();
		InputStream inputStream = MyPropertieUtil.class.getClassLoader().getResourceAsStream(property);
		String path = null;
		try {
			prop.load(inputStream);
			path = prop.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return path;
	}

}
