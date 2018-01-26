package com.example.spring.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDao {
	@Autowired
	private SqlSession sql;
	private String namespace="common.";
	
	public List<HashMap<String,Object>> navList(){
		
		List<HashMap<String,Object>> list = this.sql.selectList(namespace+"navList");
		
		return list;
	}
	
	
	
}
