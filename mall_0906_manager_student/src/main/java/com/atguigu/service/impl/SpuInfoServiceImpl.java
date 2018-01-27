package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT_EXT;
import com.atguigu.mapper.SpuInfoMapper;
import com.atguigu.service.SpuInfoService;
@Service
public class SpuInfoServiceImpl implements SpuInfoService {
	
	@Autowired
	private SpuInfoMapper spuInfoMapper;

	@Override
	public void saveSpuInfo(T_MALL_PRODUCT_EXT productExt, List<String> list_image) {
		productExt.setShp_tp(list_image.get(0));
		spuInfoMapper.insertSpuInfo(productExt);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("spu_id", productExt.getId());
		map.put("list_image", list_image);
		spuInfoMapper.insertImages(map);
		
	}
}
