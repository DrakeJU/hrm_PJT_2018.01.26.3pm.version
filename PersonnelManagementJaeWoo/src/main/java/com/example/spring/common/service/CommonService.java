package com.example.spring.common.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.common.dao.CommonDao;

@Service
public class CommonService {
	
	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<HashMap<String,Object>> navList(){
		
		List<HashMap<String,Object>> list =commonDao.navList();
		
		return list;
	}
	
}
