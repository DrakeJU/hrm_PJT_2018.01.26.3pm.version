package com.example.spring.common.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public @ResponseBody HashMap<String,Object> navMenu() {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("navList",commonService.navList());

		return map;
	}//navMenu
	
}//CommonController
