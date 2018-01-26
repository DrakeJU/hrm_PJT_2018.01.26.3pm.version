package com.example.spring.attendance.controller;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.attendance.service.AttendService;

@Controller
public class AttendController {

	private static final Logger logger = LoggerFactory.getLogger(AttendController.class);
	
	@Autowired
	AttendService attendService;
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [일일근태등록]
	 * 개요    : 
	 * @Author : 이용선
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	
	//출결관리 - 일일근태등록
	@RequestMapping(value = "/dailAttdReg")
	public String dailAttdReg(
			@RequestParam HashMap<String, String> params, Model model) throws Exception{

		return "dailAttdReg";
	}
	
	
	//출결관리 - 일일근태등록
	//출근버튼
	@RequestMapping(value = "/insertDailAttReg")
	public String insertDailAttReg(
			@RequestParam HashMap<String, String> params, Model model) throws Exception{
	
		// 1) 값입력
		attendService.insertDailAttReg(params);
		
		// 2) 입력값 출력 조회 
		List<HashMap<String, Object>> resultList = attendService.selectDailAttReg(params);
		
		if(resultList == null) {
			model.addAttribute("success", "N");
		} else {
			model.addAttribute("resultList", resultList);
			model.addAttribute("success", "Y");
		}
		
		return "dailAttdReg";
	}	
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [월간 근태 생성/마감]
	 * 개요    : 
	 * @Author : 제영호
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	
	@RequestMapping(value = "/mnthngAttdCrtCls")
	public String mnthngAttdCrtCls() {
		return "mnthngAttdCrtCls";
	}
	
	//CRUD-R
	@RequestMapping(value="/readMnthngAttdCrtCls")
	public ModelAndView readMnthngAttdCrtCls(
			@RequestParam HashMap<String, String> paramMap
			) {
		
		logger.debug("workYyMm : " + paramMap.get("workYyMm"));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resultList", attendService.readMnthngAttdCrtCls(paramMap));
		mv.setViewName("mnthngAttdCrtCls");
		
		return mv;
	}
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [월근태현황]
	 * 개요    : 
	 * @Author : 이용선
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	
	@RequestMapping(value = "/mnthAttdStat")
	public String mnthAttdStat() {
		return "mnthAttdStat";
	}
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [휴일 /연장 /야간근무 조회]
	 * 개요    : 
	 * @Author : 제영호
	 * @Date   : 2018.01.24
	 ***************************************************************************************/
	
	@RequestMapping(value="/hdayExtnNightWorkInqr")
	public String hdayExtnNightWorkInqr() {
		return "hdayExtnNightWorkInqr";
	}
	
	//CRUD-R
	@RequestMapping(value="/readHdayExtnNightWorkInqr")
	public ModelAndView readHdayExtnNightWorkInqr(
			@RequestParam HashMap<String, String> paramMap) {
		
		logger.debug("workYyMm : " + paramMap.get("workYyMm"));
		logger.debug("empEmno : " + paramMap.get("empEmno"));
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resultList", attendService.readHdayExtnNightWorkInqr(paramMap));
		mv.setViewName("hdayExtnNightWorkInqr");
		return mv;
	}
	
}
