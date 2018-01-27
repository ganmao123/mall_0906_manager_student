package com.atguigu.bean;

import java.util.ArrayList;
import java.util.List;

public class MODEL_T_MALL_SKU_ATTR_VALUE {

	private List<T_MALL_SKU_ATTR_VALUE> list_sku_av = new ArrayList<T_MALL_SKU_ATTR_VALUE>();

	public List<T_MALL_SKU_ATTR_VALUE> getList_sku_av() {
		return list_sku_av;
	}

	public void setList_sku_av(List<T_MALL_SKU_ATTR_VALUE> list_sku_av) {
		this.list_sku_av = list_sku_av;
	}

	@Override
	public String toString() {
		return "MODEL_T_MALL_SKU_ATTR_VALUE [list_sku_av=" + list_sku_av + "]";
	}
	
	
	
}
