package com.example.spring.attendance.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.spring.attendance.entity.JsonData;
import com.example.spring.attendance.entity.JsonDataVac;


@Repository("holidaySetDao")
public class HolidaySetDao {

	private static final Logger logger = LoggerFactory.getLogger(HolidaySetDao.class);

	@Autowired
	private SqlSession sqlSession;
	private String nameSpaceName = "holidaySet.";
	public int holidaySetDBInsert(ArrayList<JsonData> jsonArrayList) {
		//int result = this.sqlSession.insert(nameSpaceName + "holidaySetDBInsert", jsonArrayList);
				
		//return result;
		int result = -1;

		for(int i = 0 ; i < jsonArrayList.size(); i++) {
			JsonData tmp = (JsonData)jsonArrayList.get(i);

			result = this.sqlSession.insert(nameSpaceName + "holidaySetDBInsert", tmp);
		}

		return result;
	}
	
	//2018.01.30 주용하 - 근속년수에따른 휴가설정 디비 insert
	public int conWorkVacSetDBInsert(ArrayList<JsonDataVac> jsonArrayList) {

		int result = -1;

		for(int i = 0 ; i < jsonArrayList.size(); i++) {
			JsonDataVac tmp = (JsonDataVac)jsonArrayList.get(i);

			result = this.sqlSession.insert(nameSpaceName + "conWorkVacSetDBInsert", tmp);
		}

		return result;
	}
}
