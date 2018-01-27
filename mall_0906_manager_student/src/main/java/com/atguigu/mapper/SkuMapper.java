package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;

public interface SkuMapper {

	List<T_MALL_PRODUCT> select_T_MALL_PRODUCT_list_by_flbh2_ppid(@Param("flbh2")int flbh2,@Param("pp_id") int pp_id);

	void insertSku(T_MALL_SKU sku);

	void insert_T_MALL_SKU_ATTR_VALUE(@Param("map")Map<String, Object> map);

}
