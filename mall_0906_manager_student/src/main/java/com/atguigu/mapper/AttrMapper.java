package com.atguigu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.atguigu.bean.T_MALL_ATTR_EXT;

public interface AttrMapper {

	void insertAttr(T_MALL_ATTR_EXT t_MALL_ATTR_EXT);

	void insertValue(@Param("map")Map<String, Object> map);

	List<T_MALL_ATTR_EXT> getAttrByClass2id(int class_2_id);

}
