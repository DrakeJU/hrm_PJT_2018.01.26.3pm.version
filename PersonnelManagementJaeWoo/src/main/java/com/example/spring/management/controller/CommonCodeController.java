package com.example.spring.management.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.spring.management.service.CommonCodeService;

@Controller
public class CommonCodeController {

	private static Logger logger = LoggerFactory.getLogger(CommonCodeController.class);

	@Autowired
	private CommonCodeService commonCodeService;

	private String PRE_VIEW_PATH = "management/commonCode/";

	
	@RequestMapping(value = "commonInsert.do")
	public @ResponseBody int commonInsert(@RequestParam HashMap<String, Object> paramMap) {

		int result = commonCodeService.commonInsert(paramMap);

		/*
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		//mv.setView(new RedirectView("commonList.do"));
		mv.setViewName("commonList");
		*/
		
		return result;

	}// commonInsert

	
	
	@RequestMapping(value="commCodeCheck.do")
	public @ResponseBody HashMap<String, String> commCodeCheck(@RequestParam(value = "commCode") String commCode) {

		String checkValue = commonCodeService.commCodeCheck(commCode);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("commCode", checkValue);

		return map;

	}// commCodeCheck

	
	
	@RequestMapping(value="commonList.do")
	public ModelAndView commonList(HttpServletRequest request, @RequestParam HashMap<String, Object> paramMap) {

		String selectPageNum = request.getParameter("selectPageNum");

		if (selectPageNum == null || selectPageNum == "") {
			selectPageNum = "1";
		}

		paramMap.put("selectPageNum", selectPageNum);
		
		String commonSelect = request.getParameter("commonSelect");
		String commonSearch = request.getParameter("commonSearch");
		
		paramMap.put("commonSelect",commonSelect);
		paramMap.put("commonSearch",commonSearch);
		

		List<HashMap<String, Object>> list = commonCodeService.commonList(paramMap);
		//List<HashMap<String, Integer>> pagingList = commonCodeService.paging(paramMap);

		
		ModelAndView mv = new ModelAndView();

		mv.addObject("list", list);
		//mv.addObject("pagingList", pagingList);
		mv.setViewName("commonList");
		
		
		return mv;

	}// commonList
	
	
	
	@RequestMapping(value="commonSearchList.do")
	public @ResponseBody List<HashMap<String,Object>> commonSearchList(HttpServletRequest request,
																	@RequestParam(value="commonSelect") String commonSelect,
																	@RequestParam(value="commonSearch") String commonSearch){
		
		String selectPageNum = request.getParameter("selectPageNum");

		if (selectPageNum == null || selectPageNum == "") {
			selectPageNum = "1";
		}//if
		
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("selectPageNum",selectPageNum);
		paramMap.put("commonSelect",commonSelect);
		paramMap.put("commonSearch",commonSearch);
		
		List<HashMap<String,Object>> list = commonCodeService.commonList(paramMap);
		
		return list;
		
	}//commonSearchList
	

	@RequestMapping(value="commonUpdate.do")
	public @ResponseBody int commonUpdate(@RequestParam HashMap<String,Object> paramMap) {
		
		int result = commonCodeService.commonUpdate(paramMap);
		
		return result;
		
	}//commonUpdate
	
	

	@RequestMapping(value="commonDeleteCheck.do")
	public @ResponseBody HashMap<String, Integer> commonDeleteCheck(@RequestParam(value = "commCode") String commCode) {

		int listSize = commonCodeService.commonDeleteCheck(commCode);
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("listSize", listSize);
		
		return map;

	}// commonDeleteCheck

	
	
	@RequestMapping(value="commonDelete.do")
	public @ResponseBody int commonDelete(@RequestParam(value="commCode") String commCode,
			@RequestParam HashMap<String, Object> paramMap) {

		int result = commonCodeService.commonDelete(commCode);

		return result;

	}// commonDelete

	
	
/* ====================================== 공통코드 상세보기 관련 ======================================================== */
	
	@RequestMapping(value="commonInfoInsert.do")
	public @ResponseBody int commonInfoInsert(@RequestParam HashMap<String, Object> paramMap) {

		int result = commonCodeService.commonInfoInsert(paramMap);

		return result;

	}// commonInfoInsert

	
	
	@RequestMapping(value="commonInfoList.do")
	public @ResponseBody List<HashMap<String, Object>> commonInfoList(@RequestParam(value="commPrntCode") String commPrntCode) {

		List<HashMap<String, Object>> list = commonCodeService.commonInfoList(commPrntCode);

		return list;

	}// commonInfoList

	
	
	@RequestMapping(value="commonPaging.do")
	public @ResponseBody HashMap<String,Integer> paging(HttpServletRequest request) {

		HashMap<String,Integer> map = new HashMap<String,Integer>();

		String selectPageNum = request.getParameter("selectPageNum");

		if (selectPageNum == null || selectPageNum == "") {
			selectPageNum = "1";
		}

		int allPostNum = commonCodeService.commAllPostNum();

		map.put("selectPageNum", Integer.parseInt(selectPageNum));
		map.put("allPostNum",allPostNum);

		return map;

	}// paging
	

	
}// class
