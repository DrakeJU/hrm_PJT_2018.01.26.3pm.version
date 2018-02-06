package com.example.spring.salmanager.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PayImfController {
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(PayImfController.class);
	
	@RequestMapping(value = "/payimf_main")
	public String goEmpImf(HttpServletRequest request, Model model) throws Exception {
		
		return "SalManager/payimf/payimf_main";
	}
}
