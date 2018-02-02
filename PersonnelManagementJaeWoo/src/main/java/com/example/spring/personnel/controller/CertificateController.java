package com.example.spring.personnel.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.personnel.service.CertificateService;

@Controller
public class CertificateController {
	
	@Autowired
	private CertificateService certificateService;
	
	//증명서발급메인화면 
	@RequestMapping(value="certificateIssue.do")
	public ModelAndView certificateIssue() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",certificateService.certificateIssue());
		mv.setViewName("certificateIssue");
		
		return mv;
	}
	
	//신청시 사원정보가져오기
	@RequestMapping(value="insertData.do")
	public @ResponseBody HashMap<String, Object> insertData(@RequestParam String emno){
		
		//사원정보
		HashMap<String, Object> map = certificateService.insertData(emno);
		
		return map;
	}
	
	
}
