package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;
import com.atguigu.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService{

	@Autowired
	private SkuMapper skuMapper;
	
	@Override
	public List<T_MALL_PRODUCT> get_T_MALL_PRODUCT_list_by_flbh2_ppid(int flbh2, int pp_id) {
		return skuMapper.select_T_MALL_PRODUCT_list_by_flbh2_ppid(flbh2,pp_id);
	}

	@Override
	public void save_sku(List<T_MALL_SKU_ATTR_VALUE> list_sku_av, T_MALL_SKU sku) {
		skuMapper.insertSku(sku);
		
		Map<String,Object> map  = new HashMap<String,Object>();
		map.put("sku_id", sku.getId());
		map.put("shp_id", sku.getShp_id());
		map.put("list_sku_av", list_sku_av);
		skuMapper.insert_T_MALL_SKU_ATTR_VALUE(map);
		
	}


}
