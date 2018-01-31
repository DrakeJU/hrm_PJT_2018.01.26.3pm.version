package com.example.spring.personnel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertificateController {
	
	//증명서발급
	@RequestMapping(value="certificateIssue.do")
	public String certificateIssue() {
		
		return "certificateIssue";
	}
	
}
