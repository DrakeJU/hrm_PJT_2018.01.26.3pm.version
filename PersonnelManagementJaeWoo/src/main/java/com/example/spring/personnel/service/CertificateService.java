package com.example.spring.personnel.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.personnel.dao.CertificateDao;

@Service
public class CertificateService {
	
	@Resource(name="certificateDao")
	private CertificateDao certificateDao;
	
	//증명서 전체 정보가져오기
	public List<String> certificateIssue(){
		
		List<String> list = certificateDao.certificateIssue();
		
		return list;
	}
	
	//신청시 사원정보가져오기
	public HashMap<String, Object> insertData(String emno){
		
		HashMap<String, Object> map = certificateDao.insertData(emno);
		
		return map;
	}
	
	
	
}
