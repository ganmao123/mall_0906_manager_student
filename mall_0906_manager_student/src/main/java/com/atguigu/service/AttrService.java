package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_ATTR_EXT;

public interface AttrService {

	void saveAttrAndValue(int flbh2,List<T_MALL_ATTR_EXT> list);

	List<T_MALL_ATTR_EXT> getAttrByClass2id(int class_2_id);

}
