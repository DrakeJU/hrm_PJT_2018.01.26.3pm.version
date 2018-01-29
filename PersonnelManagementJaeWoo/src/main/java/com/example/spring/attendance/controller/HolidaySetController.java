package com.example.spring.attendance.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.attendance.entity.JsonData;
import com.example.spring.attendance.service.HolidaySetService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class HolidaySetController {


	private static final Logger logger = LoggerFactory.getLogger(HolidaySetController.class);

	@Autowired
	private HolidaySetService holidaySetService;

	//관리자 - 휴가리스트 조회하기
	@RequestMapping(value = "/holidaySet")
	public String vatacionListAdminPage() {
		return "holidaySet";
	}

	//관리자 - 휴가리스트 조회하기
	@RequestMapping(value = "/holiDyMng")
	public String vatacionListAdminPage2() {
		return "holiDyMng";
	}

	//requestParam으로 받아오면 지금 ajax로 데이터를 보낼때 {jArray : "(json형태)"}로 보냈기 때문에 맵으로 받음.
	//맵 형태로 보내야함(key 값이 꼭있어야 보낼수있음)
	@RequestMapping(value = "/holidaySetDBInset.ajax")
	public @ResponseBody HashMap<String, String> holidaySetDBInsert(@RequestParam HashMap<String,Object> jsonMap) {
		logger.debug("-----------------------------------------holidaySetDBInsert 들어왔다"+jsonMap);

		//success 다시 되돌려줄 맵
		HashMap<String, String> map = new HashMap<String, String>();
		Gson gson = new Gson();
		//List<JsonData>로 타입을 만들어주겠다 선언.
		Type type = new TypeToken<List<JsonData>>() {}.getType();

		String result = (String) jsonMap.get("jArray");

		//gson.fromJson : Json 형식으로된 String을 ArrayList로 바꿔주는 역할을 함.
		//지금 result에는 json형식으로 되어있음.
		ArrayList<JsonData> list = gson.fromJson(result, type);

		for(int i = 0 ; i < list.size() ; i++) {
			JsonData tmp = (JsonData)list.get(i);
			System.out.println(tmp.getDivide() + " " + tmp.getCode() + " " + tmp.getAnnualLeaveReflection() + " " + tmp.getTitle() + " " + tmp.getUseOrFailure() + " " + tmp.getNote());
		}

		map.put("success", "true");

		return map;
	}
	//관리자 - 휴가리스트 조회하기
	@RequestMapping(value = "/conWorkVacSet")
	public String vatacionListAdminPage3() {
		return "conWorkVacSet";
	}
	
	//출장신청 사원정보조회 실바나스 소스 참조할것
	@RequestMapping(value="/conWorkVacSet")
	public @ResponseBody HashMap<String, Object> businessRequestEmpList(
			@RequestParam HashMap<String,Object> map) {
		
	

		return map;
	}
}
