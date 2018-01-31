package com.example.spring.attendance.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("holidaySetDao")
public class HolidaySetDao {

	private static final Logger logger = LoggerFactory.getLogger(HolidaySetDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	private String nameSpaceName = "holidaySet.";
	
	public int holidaySetDBInsert(HashMap<String,String> paramMap) {
		int result = this.sqlSession.insert(nameSpaceName + "holidaySetDBInsert", paramMap);
		
		return result;
	}
}
