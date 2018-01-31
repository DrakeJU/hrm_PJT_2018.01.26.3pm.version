package com.example.spring.salmanager.dao;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("paycMenuDao")
public class PaycMenuDao {

	@Autowired
    private SqlSession sqlSession;
    private String nameSpaceName = "payc.";

    public List<HashMap<String, Object>> paycList(HashMap<String,String> map){
    	List<HashMap<String, Object>> list = this.sqlSession.selectList(nameSpaceName + "paycList", map);

        return list;
    }
    
    public void makePaycInsert(HashMap<String, String> map) {
    	
        this.sqlSession.insert(nameSpaceName+"makePaycInsert", map);
    }
    //---------------------------- 전체 계산 -------------------------
    public void acalPayc(HashMap<String, String> map) {   
    	
    	HashMap<String, Object> m1 = new HashMap<String, Object>();
    	List<HashMap<String, Object>> getEmpemno = this.sqlSession.selectList(nameSpaceName + "getEmpemno",map);
    	
    	
    	m1.put("list", getEmpemno);
    	m1.put("yymm",map.get("yymm"));
    	//System.out.println("getempemno : "+m1);
    	//HashMap<String, Object> m1 = new HashMap<String, Object>();
    	
    	for(int i=0; i<getEmpemno.size(); i++) {
    		String emym = map.get("yymm")+getEmpemno.get(i).get("EMP_EMNO").toString(); // ex)201811 + emp_emno
    		
    		m1.put("emym",emym);
    		m1.put("emp_emno",getEmpemno.get(i).get("EMP_EMNO").toString());
    		List<HashMap<String, Object>> searchEmym = this.sqlSession.selectList(nameSpaceName + "searchEmym",m1);
    		
    		if(searchEmym.size() == 0) { //insert
    			
    			//System.out.println("m1 : " +m1);
    			System.out.println("acalInsert m1 : "+m1);
    			this.sqlSession.insert(nameSpaceName+"acalInsert", m1);
    		}
    		else { //update
    			
    			System.out.println("acalUpdate m1 : "+m1);
    			
    			this.sqlSession.update(nameSpaceName+"acalUpdate", m1);
    		}
    	}
        //this.sqlSession.insert(nameSpaceName+"makePaycInsert", map);
    }
    
    public List<HashMap<String, Object>> selectPayc(HashMap<String, String> map) {
    	
    	List<HashMap<String, Object>> list = this.sqlSession.selectList(nameSpaceName + "select_payc",map);
    	
    	return list;
    }
}
