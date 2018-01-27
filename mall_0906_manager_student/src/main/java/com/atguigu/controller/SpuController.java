package com.atguigu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT_EXT;
import com.atguigu.service.SpuInfoService;
import com.atguigu.util.MyUploadUtil;

@Controller
public class SpuController {
	
	@Autowired
	private SpuInfoService spuInfoService;

	
	@RequestMapping("/goto_manager_spu")
	public String goto_manager_spu() {
		return "manager_spu";
	}
	
	@RequestMapping("/goto_manager_spu_add")
	public String goto_manager_spu_add() {
		return "manager_spu_add";
	}
	
	@RequestMapping("/save_manager_spu")
	public ModelAndView save_manager_spu(T_MALL_PRODUCT_EXT productExt) {
		//保存图片,返回图片路径集合
		List<String> list_image = MyUploadUtil.savePicture(productExt.getFiles());
		
		//保存spu信息业务,保存spu,生成主键,批量保存图片信息
		spuInfoService.saveSpuInfo(productExt,list_image);
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		
		try {
			mv.addObject("title", URLEncoder.encode("商品信息添加", "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		mv.addObject("url", "goto_manager_spu_add.do");
		
		return mv;
	}
	
	
	
}
