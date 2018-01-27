package com.atguigu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_ATTR_EXT;
import com.atguigu.service.AttrService;

@Controller
public class AttrController {
	
	@Autowired
	private AttrService attrService;
	
	
	
	@RequestMapping("/get_manager_attr_list_json")
	@ResponseBody
	public List<T_MALL_ATTR_EXT> get_manager_attr_list_json(int class_2_id) {
		List<T_MALL_ATTR_EXT> list_attr_ext = attrService.getAttrByClass2id(class_2_id);
		
		
		return list_attr_ext;
	}
	
	@RequestMapping("/get_manager_attr_list")
	public String get_manager_attr_list(int class_2_id,ModelMap map) {
		List<T_MALL_ATTR_EXT> list_attr_ext = attrService.getAttrByClass2id(class_2_id);
		
		map.addAttribute("list_attr_ext", list_attr_ext);
		
		return "manager_attr_list_inner";
	}
	
	@RequestMapping("/goto_manager_attr_list")
	public String goto_manager_attr_list() {
		
		return "manager_attr_list";
	}
	
	@RequestMapping("/goto_manager_attr")
	public String goto_manager_spu() {
		return "manager_attr";
	}
	
	@RequestMapping("/goto_manager_attr_add")
	public String goto_manager_attr_add() {
		return "manager_attr_add";
	}
	
	@RequestMapping("/save_manager_attr")
	public ModelAndView save_manager_attr(int flbh2,MODEL_T_MALL_ATTR list_attr) {
		
		List<T_MALL_ATTR_EXT> list = list_attr.getList_attr();
		
		attrService.saveAttrAndValue(flbh2,list);
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("url","goto_manager_attr_add.do");
		try {
			mv.addObject("title", URLEncoder.encode("商品属性添加", "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
	
}
