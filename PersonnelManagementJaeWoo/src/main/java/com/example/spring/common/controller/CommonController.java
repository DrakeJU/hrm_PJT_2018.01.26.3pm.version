package com.example.spring.common.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.common.service.CommonService;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;
	String PRE_VIEW_PATH = "common/"; //common path
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping(value="/navList.ajax")
	public @ResponseBody HashMap<String,Object> navMenu(@RequestParam HashMap<String,String> map) {
		
		HashMap<String,Object> menuMap = new HashMap<String,Object>();
		menuMap.put("mnPrntMap",commonService.selectMenu(map));
		menuMap.put("navList",commonService.navList());
		System.out.println("-----------"+menuMap);
		return menuMap;
	}//navMenu
	
}//CommonController
