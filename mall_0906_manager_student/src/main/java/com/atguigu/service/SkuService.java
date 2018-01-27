package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuService {

	List<T_MALL_PRODUCT> get_T_MALL_PRODUCT_list_by_flbh2_ppid(int flbh2, int pp_id);

	void save_sku(List<T_MALL_SKU_ATTR_VALUE> list_sku_av, T_MALL_SKU sku);


}
