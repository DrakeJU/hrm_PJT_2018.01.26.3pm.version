package com.example.spring.personnel.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("certificateDao")
public class CertificateDao {
	
	@Autowired
	private SqlSession sql; 
	private String namespace = "certificate.";
	
	//증명서전체정보가져오기
	public List<String> certificateIssue(){
		
		List<String> list = this.sql.selectList(namespace+"certificateIssue");
		
		return list;
	}
	
	//신청시 사원정보가져오기
	public HashMap<String, Object> insertData(String emno){
			
		HashMap<String, Object> map = this.sql.selectOne(namespace+"insertData",emno);
		
		return map;
	}
	
	
	
}
