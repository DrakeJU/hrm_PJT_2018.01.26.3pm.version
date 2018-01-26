package com.example.spring.management.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CommonCodeDao")
public class CommonCodeDao {

	private static Logger logger = LoggerFactory.getLogger(CommonCodeDao.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	private String nameSpaceName = "commonCode.";
	
	
	public int commonInsert(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.insert(nameSpaceName + "commonInsert", paramMap);

		
		return result;
		
	}//commonInsert
	
	
	public List<String> commCodeCheck(String data) {
		
		int commCode = Integer.parseInt(data);
		
		List<String> list = this.sqlSession.selectList(nameSpaceName + "commCodeCheck", commCode);
		
		
		return list;
		
	}//getDeptName
	
	
	public List<HashMap<String,Object>> commonList(HashMap<String,Object> paramMap){
		
		/*for(int i=0; i<list.size(); i++) {
			logger.debug("~~~~~~~~~~~~~~~~~deptCode~~~~~~~~~~~~~~~~~~~~~~~~~" + String.valueOf(list.get(i).get("deptCode")));
		}//for*/
		
		List<HashMap<String,Object>> list = this.sqlSession.selectList(nameSpaceName + "commonList", paramMap);

		return list;
		
	}//commonList
	
	
	
	public int commonUpdate(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.update(nameSpaceName + "commonUpdate",paramMap);
		
		return result;
		
	}//commonUpdate
	
	
	
	public List<HashMap<String,Integer>> commonDeleteCheck(int commCode){		
		
		List<HashMap<String,Integer>> list = this.sqlSession.selectList(nameSpaceName + "commonDeleteCheck", commCode);
		
		return list;
		
	}//commonDeleteCheck
	
	
	
	public int commonDelete(int commCode) {
		
		int result = this.sqlSession.update(nameSpaceName + "commonDelete", commCode);
		
		return result;
		
	}//commonDelete
	
	
	public int commonInfoInsert(HashMap<String,Object> paramMap) {
		
		int result = this.sqlSession.insert(nameSpaceName + "commonInfoInsert", paramMap);
		
		return result;
		
	}//commonInfoInsert
	

	public List<HashMap<String,Object>> commonInfoList(int commPrntCode) {
		
		List<HashMap<String,Object>> list = this.sqlSession.selectList(nameSpaceName + "commonInfoList", commPrntCode);
		
		
		return list;
		
	}//commonInfoList
	
	
	
	public int commAllPostNum() {
		
		int allPostNum = this.sqlSession.selectOne(nameSpaceName + "commAllPostNum");
		
		return allPostNum;
		
	}
	
	
}//class

