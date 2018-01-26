package com.example.spring.management.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.management.dao.MenuTreeDao;

@Service
public class MenuTreeService {
	
	@Resource(name="menuTreeDao")
	private MenuTreeDao menuTreeDao;
	
	static final Logger logger = LoggerFactory.getLogger(MenuTreeService.class);
	
	//메뉴리스트
	public List<HashMap<String,Object>> menuList(){
	
		List<HashMap<String,Object>> list = menuTreeDao.menuList();
		return list;		
	}//menuList
	
	//메뉴등록
	public int menuInsert(HashMap<String,Object> map, List<String> list) {
		
		String mnAttr = ""; //메뉴속성 str 저장변수
		
		//check 된 값 mnAttr 에 string으로 저장하는 for
		for(String item : list) {
			mnAttr+=("/"+item); 
		}//for
		
		map.put("mnAttr", mnAttr); //메뉴속성 map에 저장
		
		//결과 값 저장 변수
		int result = (int)menuTreeDao.menuInsert(map);
		
		return result;
	}//menuInsert
	
	public HashMap<String,Object> menuDetail(int mnNo){
		
		HashMap<String,Object> map = menuTreeDao.menuDetail(mnNo);
		return map;
		
	}//menuDetail
	
	public int menuUpdate(HashMap<String,Object>map,List<String> list) {
		
		String mnAttr = ""; //메뉴속성 str 저장변수
		
		//check 된 값 mnAttr 에 string으로 저장하는 for
		for(String item : list) {
			mnAttr+=(item+"/");
		}//for
		
		map.put("mnAttr", mnAttr);
		
		String mnIdxStr = (String)map.get("mnIdxStr"); //메뉴 순번 저장 string 저장
		
		List<HashMap<String,String>> idxList = new ArrayList<HashMap<String,String>>(); //{메뉴코드 : 메뉴 순번} 저장 리스트
		
		HashMap<String,String> idxMap; //{메뉴코드 : 메뉴순번} 저장 해쉬맵
		
		int startNum; // string 시작 index 저장 변수 
		
		startNum = 0;
		
		//업데이트 해야할 메뉴코드와 메뉴 순번이 담긴 string을 해쉬맵에 담아서 리스트에 저장 하는 for
		for(int i=0; i<mnIdxStr.length(); i++) {
			//^ 단위 스트링 자르는 if
			if(mnIdxStr.substring(i,i+1).equals("^")) {
				idxMap = new HashMap<String,String>(); //해쉬맵 생성 
				
				idxMap.put("mnNo",mnIdxStr.substring(startNum, mnIdxStr.indexOf(":", startNum))); //메뉴 코드 저장		
				idxMap.put("mnIdx",mnIdxStr.substring(mnIdxStr.indexOf(":", startNum)+1,mnIdxStr.indexOf("^",startNum))); //메뉴 순번 저장
				
				idxList.add(idxMap); //리스트에 저장
				
				startNum = mnIdxStr.indexOf("^", startNum)+1;
				i = startNum;
			}//if

		}//for
		
		//결과값 저장 변수
		int result = (int)(menuTreeDao.menuUpdate(map,idxList));
		
		return result;
	}//menuUpdate
	
	public int menuDelete(int mnNo) {
		int result  = (int)menuTreeDao.menuDelete(mnNo); 
		return result;
	}//menuDelete
	
	//test data insert 
	public void testMenu() {
		
		List<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> map;
	
		Random ran  = new Random();
		
		int ranNum =0;
		
		for(int i=102; i<=300; i++) {
			
			ranNum = ran.nextInt(100)+21;
			
			map = new HashMap<String,Object>();
			map.put("mnUrl", "test.do");
			map.put("mnPrntNo",ranNum);
			map.put("mnName", "test"+i);
			
			list.add(map);
		}//for
		
		menuTreeDao.testMenu(list);	
	}//testMdenu
}
