package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT_EXT;

public interface SpuInfoService {

	void saveSpuInfo(T_MALL_PRODUCT_EXT productExt, List<String> list_image);
	
}
