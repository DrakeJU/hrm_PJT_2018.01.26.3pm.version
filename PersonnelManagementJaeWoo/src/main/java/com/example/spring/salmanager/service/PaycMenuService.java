package com.example.spring.salmanager.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.spring.salmanager.dao.PaycMenuDao;

@Service
public class PaycMenuService {
	Calendar cal = Calendar.getInstance();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
	String stryearmm = formatter.format(new java.util.Date()); 
	
	
	@Resource(name="paycMenuDao")
	private PaycMenuDao paycMenuDao;
	
	
	private String PRE_VIEW_PATH = "/salmanage/payc/";
	
	public List paycList(HashMap<String, String> map) {
        List<HashMap<String,Object>> list = paycMenuDao.paycList(map);
        
        //System.out.println(list);
        return list;
    }
	
	public void makePaycInsert(HashMap<String, String> map) {
	    paycMenuDao.makePaycInsert(map);
	}
	
	public void acalPayc(HashMap<String, String> map) {
		paycMenuDao.acalPayc(map);
	}
	
	public List selectPayc(HashMap<String, String> map) {
		List<HashMap<String, Object>> list =paycMenuDao.selectPayc(map);
		return list;
	}
	
	public int getYear() {
		int year = Integer.parseInt(stryearmm.substring(0,4));
		
		return year;
	}
	
	public int getMonth() {
		int month = Integer.parseInt(stryearmm.substring(5,6));
		return month;
	}
	
	public int getLastDay() {
		
		int lastday =cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		return lastday;
	}
	
	public int getToday() {
		int day = Integer.parseInt(stryearmm.substring(6,8));
		return day;
	}

}
