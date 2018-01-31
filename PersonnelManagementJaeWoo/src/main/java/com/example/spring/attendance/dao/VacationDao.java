package com.example.spring.attendance.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/* 휴가 관련 DAO 
 * 유성실, 신지연 */

@Repository("vacationDao")
public class VacationDao {
	
	private static final Logger logger = LoggerFactory.getLogger(VacationDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	private String nameSpaceName = "vacation.";
	
	
	/*  휴가일수설정  사원 리스트 출력   */
	public List<HashMap<String,Object>> vacationCountEmpList(HashMap<String,Object> map) {
//		logger.debug("dao >>> "+map);
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "vacationCountEmpList", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 휴가일수설정 - 사원등록 필요 개수 */
	public int vacationCountEmpSignUpCntNum() {	
		
		int empSignUpCntNum = this.sqlSession.selectOne(nameSpaceName + "vacationCountEmpSignUpCntNum");
				logger.info("dao List: " + empSignUpCntNum);	

		return empSignUpCntNum;
	}
	
	/*  휴가일수설정  사원등록 리스트 출력   */
	public List<HashMap<String,Object>> vacationCountEmpSignUpList(HashMap<String,Object> map) {
//		logger.debug("dao >>> "+map);
		
		List<HashMap<String,Object>> list
			= this.sqlSession.selectList(nameSpaceName + "vacationCountEmpSignUpList", map);
		
		logger.debug("dao List: "+list);
		
		return list;
	}
	
	/* 휴가 신청하기 */
	public int vacationRequest(HashMap<String,String> map) {
		
		logger.info("vacationREQ DAO 진입>>>>" + map);
		
		int list = this.sqlSession.insert(nameSpaceName + "vacationRequest", map); 
			logger.info("vacationREQ DAO LIST>> " + list);
		return list;
	}//휴가 신청하기

	
	/* 휴가 조회하기 - 직원 */
	public String vacationList() {
		return "";
	}
		
	
	/* 휴가 조회하기 - 관리자 */
	public String vacationListAdmin() {
		return "";
	}
	
	
	/* 휴가 신청현황 - 승인대기 개수 */
	public int vacationProgCntNum() {	
		logger.info("vacation 휴가승인 개수 DAO///////");
		
		int countNum = this.sqlSession.selectOne(nameSpaceName + "vacationProgCntNum");
				logger.info("vacationProg 휴가승인대기 개수 dao>>>> " + countNum);	

		return countNum;
	}
	
	
	/* 휴가 신청현황 리스트 */
	public List<HashMap<String, Object>> vacationProgressList() {
		logger.info("vacation 휴가승인 리스트 DAO///////");
		
		List<HashMap<String, Object>> list = this.sqlSession.selectList(nameSpaceName + "vacationProgressList");
			logger.info("휴가신청현황리스트 dao----" + list);
		return list;
	}
	
	
	/* 휴가 신청현황 승인완료 */
	public List<HashMap<String,Object>> vacationProgToggle(){
		logger.info("휴간신청 승인대기 DAO 진입 --->>>>");
		
		List<HashMap<String,Object>> map = this.sqlSession.selectList(nameSpaceName + "vacationProgToggle");
			logger.info("승인대기 DAO 맵::" + map);
		return map;
	}
	
	
	
	/* 휴가 개수 계산하기 */
	public String vacationCount() {
		return "";
	}
	
	
	/* 휴가 월마감 */
	public String vacationMonthlyReport() {
		return "";
	}
	
	
} //main
