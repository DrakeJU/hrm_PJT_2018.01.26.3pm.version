package com.example.spring.attendance.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.attendance.dao.VacationDao;

/* 휴가 관련  SERVICE 
 * 유성실, 신지연 */

@Service
public class VacationService {

	private static final Logger logger = LoggerFactory.getLogger(VacationService.class);
	
	@Resource(name="vacationDao")
	private VacationDao vacationDao;
	private String PRE_VIEW_PATH = "/vacation/";
	
	
	/* 휴가일수설정  사원 리스트 출력 */
	public List<HashMap<String,Object>> vacationCountEmpList(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = vacationDao.vacationCountEmpList(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 휴가일수설정 - 사원등록 필요 개수 */
	public int vacationCountEmpSignUpCntNum() {
		
		int empSignUpCntNum = vacationDao.vacationCountEmpSignUpCntNum();
			logger.info("vacationProg 휴가승인대기 개수 service >>>> " + empSignUpCntNum);
		
		return empSignUpCntNum;
	}
	
	
	/* 휴가일수설정  사원등록 리스트 출력 (사원정보 테이블 != 사원별 잔여휴가 테이블)*/
	public List<HashMap<String,Object>> vacationCountEmpSignUpList(HashMap<String,Object> map) {
		
		List<HashMap<String,Object>> list = vacationDao.vacationCountEmpSignUpList(map);
		
		logger.debug("service>>> " + list);
		
		return list;
	}
	
	/* 휴가 신청하기 */
	public int vacationRequest(HashMap<String,String> map) {
		
		logger.info("vacationREQ SERVICE 진입>>>>" + map);
		
		int list = vacationDao.vacationRequest(map); 
			logger.info("vacationREQ SERVICE LIST>>>>" + list);
		
		return list;
	}
	
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
		logger.info("vacation 휴가승인 개수 SERVICE///////");
		
		int countNum = vacationDao.vacationProgCntNum();
			logger.info("vacationProg 휴가승인대기 개수 service >>>> " + countNum);
		
		return countNum;
	}
	
	/* 휴가 신청현황 리스트 */
	public List<HashMap<String,Object>> vacationProgressList(){
		logger.info("vacation 휴가승인 리스트 SERVICE///////");
		
		List<HashMap<String,Object>> list= vacationDao.vacationProgressList();
		logger.info("vacationREQ service LIST>> " + list);
		return list;
	}
	
	
	/* 휴가 신청현황 승인완료 */
	public List<HashMap<String,Object>> vacationProgToggle(){
		logger.info("휴간신청 승인대기 SERVICE 진입 --->>>>");
		
		List<HashMap<String,Object>> map = vacationDao.vacationProgToggle();
			logger.info("승인대기 SERVICE 맵::" + map);
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
	
	
}
