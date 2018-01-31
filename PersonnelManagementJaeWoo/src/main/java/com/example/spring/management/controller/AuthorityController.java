package com.example.spring.management.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.management.service.AuthorityService;

@Controller
public class AuthorityController {
	
	@Autowired
	AuthorityService authorityService;
	
	
	@RequestMapping(value="authorityMain.do")
	public String authorityMain() {	
		return "authorityMain";
	}
	
	@RequestMapping(value="empList.ajax")
	public @ResponseBody HashMap<String,Object> empList(@RequestParam HashMap<String,Object> map){
		System.out.println("들어온값"+map);
		map.put("totalNoticeNum", authorityService.empMaxNum(map));
		map.put("empList", authorityService.empList(map));
		
		return map;
	}
	
	@RequestMapping(value="authorityDetail.do")
	public ModelAndView authorityDetail(@RequestParam HashMap<String,Object> map) {
		System.out.println("--------->"+map);
		
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("data",authorityService.authorityDetail(map));
		mv.setViewName("authorityDetail");
		return mv;
	}
	
	@RequestMapping(value="empClassUpdate.ajax")
	public @ResponseBody int empClassUpdate(@RequestParam HashMap<String,Object> map) {
		
		int result = (int)authorityService.empClassUpdate(map);	
		return result;
	}
	
	@RequestMapping(value="authorityMenu.do")
	public ModelAndView aurthorityMenu(@RequestParam HashMap<String,Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("mnNo",map.get("mnNo"));
		mv.addObject("data",authorityService.authorityMenu(map));
		mv.setViewName("authorityMenu");
		
		return mv; 
	}
	 @RequestMapping(value="authorityForm.do")
	 public ModelAndView authorityForm(@RequestParam HashMap<String,Object> map) {
		 
		 ModelAndView mv = new ModelAndView();
		 mv.addObject("mnName",map.get("mnName"));
		 mv.addObject("authoMenuData",authorityService.authorityMenu(map));
		 mv.addObject("menuAttrData",authorityService.menuAttrList(map));
		 
		 mv.setViewName("authorityForm");
		 
		 return mv;
	 }
	
}
