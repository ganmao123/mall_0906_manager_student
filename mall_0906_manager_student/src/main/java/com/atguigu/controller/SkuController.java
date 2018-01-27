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

import com.atguigu.bean.MODEL_T_MALL_SKU_ATTR_VALUE;
import com.atguigu.bean.T_MALL_ATTR_EXT;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrService;
import com.atguigu.service.SkuService;

@Controller
public class SkuController {
	
	@Autowired
	private AttrService attrService;
	
	@Autowired
	private SkuService skuService;
	
	
	
	@RequestMapping("/goto_manager_sku")
	public String goto_manager_sku() {
		return "manager_sku";
	}
	
	@RequestMapping("/goto_manager_sku_add")
	public String goto_manager_sku_add() {
		return "manager_sku_add";
	}
	
	@RequestMapping("/save_manager_sku")
	public ModelAndView save_manager_sku(MODEL_T_MALL_SKU_ATTR_VALUE list_sku_av,T_MALL_SKU sku) {
		
		skuService.save_sku(list_sku_av.getList_sku_av(),sku);
		ModelAndView  mv = new ModelAndView("redirect:/index.do");
		
		mv.addObject("url", "goto_manager_sku_add.do");
		try {
			mv.addObject("title", URLEncoder.encode("商品库存单元添加", "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping("/get_sku_attr")
	public String get_sku_attr(int class_2_id,ModelMap map) {
		
		List<T_MALL_ATTR_EXT> list = attrService.getAttrByClass2id(class_2_id);
		
		map.put("list_attr_ext", list);
		
		return "sku_attr_list_inner";
	}
	
	@RequestMapping("/get_shpmch_list")
	@ResponseBody
	public List<T_MALL_PRODUCT> get_shpmch_list(int flbh2,int pp_id) {
		
		List<T_MALL_PRODUCT> list = skuService.get_T_MALL_PRODUCT_list_by_flbh2_ppid(flbh2,pp_id);
		
		return list;
	}
	
	
	
	
	
}
