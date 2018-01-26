package com.example.spring.attendance.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendDao {
	
	private static final Logger logger = LoggerFactory.getLogger(AttendDao.class);

	@Autowired
	private SqlSession sqlSession;
	
	private String nameSpaceName = "attend.";
	
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
		sqlSession.insert(nameSpaceName +"insertDailAttReg", params);
	}
	
	
	/**
	 * 출근 정보 출력 조회
	 * @param params
	 * @return
	 */
	public List<HashMap<String, Object>> selectDailAttReg (HashMap<String, String> params) {
		
		List<HashMap<String, Object>> resultList
			=this.sqlSession.selectList(nameSpaceName +"selectDailAttReg", params);
		
		return resultList;
	}
	
	
	
	/***************************************************************************************
	 * 메뉴명 : [출결관리] - [월간 근태 생성/마감]
	 * 개요    : 
	 * @Author : 제영호
	 * @Date   : 2018.01.??
	 ***************************************************************************************/
	
	public List<HashMap<String, Object>> readMnthngAttdCrtCls(HashMap<String, String> paramMap) {
		// TODO Auto-generated method stub
		List<HashMap<String, Object>> resultList 
			= this.sqlSession.selectList(nameSpaceName + "readMnthngAttdCrtCls", paramMap);
		
		return resultList;
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
		
		List<HashMap<String, Object>> resultList
			= this.sqlSession.selectList(nameSpaceName + "readHdayExtnNightWorkInqr", paramMap);
		
		return resultList;
	}	
}
