package com.example.spring.attendance.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.attendance.dao.AttendDao;

@Service
public class AttendService {

	private static final Logger logger = LoggerFactory.getLogger(AttendService.class);

	@Autowired
	AttendDao attendDao;
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [일일근태등록]
	 * 개요    : 
	 * @Author : 이용선
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	

	/**
	 * 츨근 정보 입력 함수 
	 * @param params
	 */
	public void insertDailAttReg(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		attendDao.insertDailAttReg(params);
	}
	
	
	/**
	 * 출근 정보 출력 조회
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> selectDailAttReg(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return attendDao.selectDailAttReg(params);
	}
	
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [월간 근태 생성/마감]
	 * 개요    : 
	 * @Author : 제영호
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	
	public List<HashMap<String, Object>> readMnthngAttdCrtCls(HashMap<String, String> paramMap) {
		// TODO Auto-generated method stub
		return attendDao.readMnthngAttdCrtCls(paramMap);
	}
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [월근태현황]
	 * 개요    : 
	 * @Author : 이용선
	 * @Date   : 2018.01.??
	 ***************************************************************************************/

	// 코드 영역
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [휴일 /연장 /야간근무 조회]
	 * 개요    : 
	 * @Author : 제영호
	 * @Date   : 2018.01.??
	 ***************************************************************************************/

	public List<HashMap<String, Object>> readHdayExtnNightWorkInqr(HashMap<String, String> paramMap) {
		// TODO Auto-generated method stub
		return attendDao.readHdayExtnNightWorkInqr(paramMap);
	}
	
	
	
}
