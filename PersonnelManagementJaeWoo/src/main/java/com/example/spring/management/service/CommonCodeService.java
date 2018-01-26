package com.example.spring.management.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.management.dao.CommonCodeDao;

@Service
public class CommonCodeService {

	private static Logger logger = LoggerFactory.getLogger(CommonCodeService.class);
	
	@Resource(name="CommonCodeDao")
	private CommonCodeDao commonCodeDao;
	
	int postNum;
	int pageNum;
	
	public CommonCodeService() {
		this.postNum = 5;
		this.pageNum = 5;
	}

	
	public int commonInsert(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String commCodeCrt = sdf.format(calendar.getTime());
		
		paramMap.put("commPrntCode", 0);
		paramMap.put("commCodeCrt", commCodeCrt);
		paramMap.put("commCodeUpdt", "--------------");
		paramMap.put("commDelYn", "N");
		
		int result = commonCodeDao.commonInsert(paramMap);
		
		
		return result;
		
	}//commonInsert
	
	
	public String commCodeCheck(String commCode) {

		List<String> list = commonCodeDao.commCodeCheck(commCode);
		
		String checkValue = "";
		
		if(list.size() > 0) {
			checkValue = "이미 사용 중인 코드입니다.";
		}else {
			checkValue = "사용 가능한 코드입니다.";
		}//if
		
		
		return checkValue;
		
	}//getDeptName
	
	
	public List<HashMap<String,Object>> commonList(HashMap<String,Object> paramMap){
		
		int allPostNum = commonCodeDao.commAllPostNum();
		int postNum = this.postNum;
		int pageNum = this.pageNum;
		int selectPageNum = Integer.parseInt((String)paramMap.get("selectPageNum"));
		
		int endPost = selectPageNum*postNum;
			
		if(endPost<1) {
			endPost = 1;
		}
		
		int startPost = (endPost-(postNum-1))-1;
		
		
		paramMap.put("startPost", startPost);
		paramMap.put("postNum", postNum);
		
		
		List<HashMap<String,Object>> list = commonCodeDao.commonList(paramMap);
		
		
		return list;
		
	}//commonList
	
	
	
	public int commonUpdate(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String commCodeUpdt = sdf.format(calendar.getTime());
		
		int commCode = Integer.parseInt((String)paramMap.get("commCode"));
		
		paramMap.put("commCode",commCode);
		paramMap.put("commCodeUpdt",commCodeUpdt);
		
		int result = commonCodeDao.commonUpdate(paramMap);
		
		return result;
		
	}//commonUpdate
	
	
	
	public int commonDeleteCheck(String param) {
		
		int commCode = Integer.parseInt(param);
		
		List<HashMap<String,Integer>> list = commonCodeDao.commonDeleteCheck(commCode);
		
		int listSize = list.size();
		
		return listSize;
		
	}//commonDeleteCheck
	
	
	
	public int commonDelete(String param) {
		
		int commCode = Integer.parseInt(param);
		
		int result = commonCodeDao.commonDelete(commCode);
		
		return result;
		
	}//commonDelete
	
	
	public int commonInfoInsert(HashMap<String,Object> paramMap) {
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmdd");
		String commCodeCrt = sdf.format(calendar.getTime());
		
		paramMap.put("commCodeCrt", commCodeCrt);
		paramMap.put("commCodeUpdt", "--------------");
		paramMap.put("commDelYn", "N");
		
		int result = commonCodeDao.commonInfoInsert(paramMap);
		
		return result;
		
	}
	
	
	public List<HashMap<String,Object>> commonInfoList(String param){
		
		int commPrntCode = Integer.parseInt(param);
		
		List<HashMap<String,Object>> list = commonCodeDao.commonInfoList(commPrntCode);
		
		return list;
		
	}//commonInfoList
	
	
	
	public int commAllPostNum() {
		
		int allPostNum = commonCodeDao.commAllPostNum();
		
		return allPostNum;
		
	}//commAllPostNum
	
	
	/*
	public List<HashMap<String,Integer>> paging(HashMap<String,Object> paramMap){
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		List<HashMap<String,Integer>> list = new ArrayList<HashMap<String,Integer>>(); 
		
		
		int allPostNum = commonCodeDao.commAllPostNum(paramMap);
		int postNum = this.postNum;
		int pageNum = this.pageNum;
		int selectPageNum = Integer.parseInt((String)paramMap.get("selectPageNum"));
		
		int allPageNum = 0;
		
		if(allPostNum%postNum == 0) {
			allPageNum = allPostNum/postNum;
		}else {
			allPageNum = (allPostNum/postNum)+1;
		}//if
		
		
		int startPage = ((selectPageNum/pageNum)*pageNum)+1;
		
		if(selectPageNum%pageNum == 0) {
			startPage = (((selectPageNum/pageNum)-1)*pageNum)+1;
		}//if
		
		
		int endPage = (startPage+pageNum)-1;
		
		if(endPage > allPageNum) {
			endPage = allPageNum;
		}//if
		
		
		int prevPage = startPage-1;
		
		if(startPage == 1) {
			prevPage = 1;
		}//if
		
		
		int nextPage = startPage+pageNum;
		
		if(nextPage > allPageNum) {
			nextPage = allPageNum;
		}//if
		
		map.put("allPageNum", allPageNum);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		
		list.add(map);
		
		return list;
		
	}//paging
	*/
	
	
	
	
	
}//class
