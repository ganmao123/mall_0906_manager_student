package com.atguigu.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.T_MALL_PRODUCT_EXT;

public interface SpuInfoMapper {

	void insertSpuInfo(T_MALL_PRODUCT_EXT productExt);

	void insertImages(@Param("map")Map<String, Object> map);
	
}
