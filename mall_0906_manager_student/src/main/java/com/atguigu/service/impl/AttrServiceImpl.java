package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_ATTR_EXT;
import com.atguigu.bean.T_MALL_VALUE;
import com.atguigu.mapper.AttrMapper;
import com.atguigu.service.AttrService;

@Service
public class AttrServiceImpl implements AttrService {

	@Autowired
	private AttrMapper attrMapper;
	
	@Override
	public void saveAttrAndValue(int flbh2,List<T_MALL_ATTR_EXT> list) {
		for (T_MALL_ATTR_EXT t_MALL_ATTR_EXT : list) {
			t_MALL_ATTR_EXT.setFlbh2(flbh2);
			attrMapper.insertAttr(t_MALL_ATTR_EXT);
			
			List<T_MALL_VALUE> list_value = t_MALL_ATTR_EXT.getList_value();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("list_value", list_value);
			map.put("shxm_id", t_MALL_ATTR_EXT.getId());
			attrMapper.insertValue(map);
		}
	}

	@Override
	public List<T_MALL_ATTR_EXT> getAttrByClass2id(int class_2_id) {
		return attrMapper.getAttrByClass2id(class_2_id);
	}


}
