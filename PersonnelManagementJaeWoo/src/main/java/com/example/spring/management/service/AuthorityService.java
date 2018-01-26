package com.example.spring.management.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spring.management.dao.AuthorityDao;

@Service
public class AuthorityService {
	
	@Resource(name="authorityDao")
	private AuthorityDao authorityDao;
	
	public int empMaxNum(HashMap<String,Object> map) {	
		return authorityDao.empMaxNum(map);
	}
	
	public List<HashMap<String,Object>> empList(HashMap<String,Object> map) {
		
		int totalNoticeNum = (Integer)map.get("totalNoticeNum");
		int choicePage = Integer.parseInt((String)map.get("choicePage"));
		int viewNoticeMaxNum = 10;
		int noticeCount= 0; //게시물 시작 순번
		
		noticeCount = (choicePage-1)*viewNoticeMaxNum;
		
		map.put("noticeCount", noticeCount);
		map.put("viewNoticeMaxNum", viewNoticeMaxNum);

		List<HashMap<String,Object>>empList = authorityDao.empList(map);
		
		System.out.print("empLsit---->>>>"+empList);
		
		return empList;
	}
	
	public HashMap<String,Object> authorityDetail(HashMap<String,Object> map){
		
		HashMap<String,Object> empMap = authorityDao.authorityDetail(map);
		
		return empMap;
	}
	
	public int empClassUpdate(HashMap<String,Object> map) {

		int result = (int)authorityDao.empClassUpdate(map);

		return result;
	}

	public HashMap<String,Object> authorityMenu(HashMap<String,Object> map){

		HashMap<String,Object> authorityMap = authorityDao.authorityMenu(map);

		return authorityMap;
	}
	
	public HashMap<String,Object> menuAttrList(HashMap<String,Object> map){
		
		List<String> menuAttrList  = new ArrayList<String>();
		
		HashMap<String,Object> menuAttrMap = authorityDao.menuAttrList(map);
		
		String menuAttrStr = (String)menuAttrMap.get("mnAttr");
		
		int startNum; // string 시작 index 저장 변수 
		
		startNum = 0;
		
		for(int i=0; i<menuAttrStr.length(); i++) {
			if(menuAttrStr.substring(i,i+1).equals("/")) {
				
				menuAttrList.add(menuAttrStr.substring(startNum, menuAttrStr.indexOf("/", startNum)));
				
				startNum = menuAttrStr.indexOf("/", startNum)+1;
				i = startNum;
			}
		}
		
		menuAttrMap.put("menuAttrList", menuAttrList);
		
		return menuAttrMap;
	}
	
}
