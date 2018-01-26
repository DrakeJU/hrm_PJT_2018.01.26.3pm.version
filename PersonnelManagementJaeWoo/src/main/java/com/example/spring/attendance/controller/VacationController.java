package com.example.spring.attendance.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.attendance.service.VacationService;


/* 휴가관련 CONTROLLER
 * 유성실, 신지연 */

//@ReponseBody는 파라미터 값을 뷰에 보내주는 역할

@Controller
public class VacationController {
	
	private static final Logger logger = LoggerFactory.getLogger(VacationController.class);

	@Autowired
	private VacationService vacationService;
	private String PRE_VIEW_PATH = "/vacation/";
	
	
	/* 휴가일수설정 */
	@RequestMapping(value="/vacationCount")
	public String vacationCount() {
		return "vacationCount";
	}
	
	
	/* 휴가일수설정 사원 리스트 출력 */
	@RequestMapping(value="/vacationCountEmpList.ajax")
	public @ResponseBody HashMap<String, Object> vacationCountEmpList(
			@RequestParam HashMap<String,Object> map) {
		
		logger.info("휴가개수설정 파라미터: " + map);
		
		List<HashMap<String,Object>> list = vacationService.vacationCountEmpList(map);
		

		if(list == null) {
			map.put("success", "N");
		}else {
			map.put("vacationCountEmpList", list);
			map.put("success", "Y");
		}

		return map;
	}
	
	/* 휴가일수설정 -사원등록 */
	@RequestMapping(value="/vacationCountEmpSignUp")
	public String vacationCountEmployeeSignUp() {
		return "vacationCountEmpSignUp";
	}
	
	/* 휴가일수설정 - 사원등록 필요 개수 */
	@RequestMapping(value="/vacationCountEmpSignUpCntNum.ajax")
	public @ResponseBody int vacationCountEmpSignUpCntNum() {
		
		int empSignUpCntNum = vacationService.vacationCountEmpSignUpCntNum();
			logger.info("휴가일수설정 사원등록 대기 개수: "+empSignUpCntNum);
		
		return empSignUpCntNum;
	} 
	
	/* 휴가일수설정 사원 리스트 출력 (사원정보 테이블 != 사원별 잔여휴가 테이블)*/
	@RequestMapping(value="/vacationCountEmpSignUpList.ajax")
	public @ResponseBody HashMap<String, Object> vacationCountEmpSignUpList(
			@RequestParam HashMap<String,Object> map) {
		
		logger.info("휴가일수설정 사원등록 파라미터: " + map);
		
		List<HashMap<String,Object>> list = vacationService.vacationCountEmpSignUpList(map);
		

		if(list == null) {
			map.put("success", "N");
		}else {
			map.put("vacationCountEmpSignUpList", list);
			map.put("success", "Y");
		}

		return map;
	}
	
	/* 휴가 신청하기 */
	@RequestMapping(value="vacationRequest")
	public String vacationRequest() {
		return "vacationRequest";
	}
	
	/* 휴가 신청 insert */
	@RequestMapping(value = "/vacationRequest.ajax")
	public @ResponseBody HashMap<String,String> vatacionRequestInsert(
			@RequestParam HashMap<String,String> map){ 
		
		logger.info("vacationRequest CONTROLL>>>" + map);
		
		
		int list = vacationService.vacationRequest(map);
			if(list == 0) {
				map.put("success", "N");
			} else{
				map.put("success", "Y");
			}//if

			logger.info("vacationREQ CONTROLLER LIST>>>>" + list);
		return map;
	}
	
	
	/* 휴가 조회하기 - 직원 */
	@RequestMapping(value="vacationList")
	public String vacationList() {
		return "vacationList";
	}
	
	
	/* 휴가 조회하기 - 관리자 */
	@RequestMapping(value="/vacationListAdmin")
	public String vacationListAdmin() {
		return "vacationListAdmin";
	}
	
	
	/* 휴가 조회 - 승인대기 개수 */
	@RequestMapping(value="/vacationProgCntNum.ajax")
	public @ResponseBody int vacationProgCntNum() {
		logger.info("vacation 휴가승인 개수 CONTROLLER///////");
		
		int countNum = vacationService.vacationProgCntNum();
			logger.info("vacation 휴가승인 개수 controller::::"+countNum);
		
		return countNum;
	} 
	
	/* 휴가 신청현황 리스트 */
	@RequestMapping(value="/vacationProgressList")
	public String vacationProgressList() {
		return "vacationProgressList";
	}
	
	
	/* 휴가 신청현황 리스트 결과 페이지 */
	@RequestMapping(value="/vacationProgressList.ajax")
	public @ResponseBody HashMap<String,Object> vacationProgressListPage() {
		logger.info("vacation 휴가 신청현황 리스 CONTROLLER 진입////");
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		List<HashMap<String,Object>> list = vacationService.vacationProgressList();
		map.put("vacationProgressList", list);
			logger.info(PRE_VIEW_PATH + map);
			
		if(list == null) {
			map.put("success", "N");
		} else {
			map.put("vacationProgressList", list);
			map.put("success", "Y");
		}//if
			
		return map;
	}
	
	
	/* 휴가 신청현황 승인완료 */
	@RequestMapping(value="/vacationProgressToggle.ajax", method = RequestMethod.GET)
	public String vacationProgToggle(HttpServletRequest request, Model model)throws Exception {
		logger.info("휴간신청 승인대기 controller 진입 --->>>>");
		
		model.addAttribute("vastProgressSituation", request.getParameter("vastProgressSituation"));
		
		return "vacationProgressList";
	}	
	
	
	
	/* 휴가 월마감 */
	@RequestMapping(value="/vacationMonthlyReport")
	public String vacationMonthlyReport() {
		return "vacationMonthlyReport";
	}
	
	
	
	
	/*	
	@RequestMapping(value="ajaxFormSubmit.ajax")
	public @ResponseBody HashMap<String,String> ajaxFormSubmit(
			@RequestParam HashMap<String,String> map){
		
		logger.debug(map.get("vastCrtData") + map.get("vastC") + map.get("vastStartDate") + map.get("vastEndDate") + map.get("vastCont"));
		
		return map;
	}
*/	
}
