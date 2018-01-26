package com.example.spring.management.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("authorityDao")
public class AuthorityDao {
	
	@Autowired
	private SqlSession sql;
	private String namespace = "authority.";
	
	
	public int empMaxNum(HashMap<String,Object> map) {
		return ((Integer)this.sql.selectOne(namespace+"empMaxNum",map));
	}
	
	public List<HashMap<String,Object>> empList(HashMap<String,Object> map){
		
		List<HashMap<String,Object>> empList = this.sql.selectList(namespace+"empList", map);
	
		return empList;
	}
	
	public HashMap<String,Object> authorityDetail(HashMap<String,Object> map){
		HashMap<String,Object> empMap = this.sql.selectOne(namespace+"authorityDetail", map);
		
		return empMap;
	}
	
	public int empClassUpdate(HashMap<String,Object> map) {
		int result = (int)this.sql.update(namespace+"empClassUpdate",map);
		return result;
	}

	public HashMap<String,Object> authorityMenu(HashMap<String,Object> map){
		HashMap<String,Object> authorityMap = this.sql.selectOne(namespace+"authorityMenu", map);
		return authorityMap;
	}
	
	public HashMap<String,Object> menuAttrList(HashMap<String,Object> map){
		HashMap<String,Object> menuAttrMap = this.sql.selectOne(namespace+"menuAttrList", map);
		
		return menuAttrMap;
	}
	
}
