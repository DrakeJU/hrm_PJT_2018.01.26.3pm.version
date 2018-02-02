<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var emno = "0905000211";
	var deptCode = 2;
	var crtfCode = 3;
	
	//검색 날짜선택시
	$("[name='startDate'],[name='endDate']").datetimepicker({ 
		viewMode : 'days',
		format : 'YYYY-MM-DD'
	});
	
	//증명서신청 
	var insertData = function(){
		
		//신청시 오늘날짜 세팅
		var d = new Date();
		var year = d.getFullYear();
		var month = d.getMonth()+1;
		var day = d.getDate();
		
		//월, 일이 1자리수이면 0을붙인다
		if(("" + month).length == 1) {month = "0" + month;} 
		if(("" + day).length   == 1) {day = "0" + day;}

		$("[name='application']").val(year+'-'+month+'-'+day);
		
		//신청시 사원정보, 발행번호 가져오기
		var obj = {};
		obj.emno = emno;
		
		paging.ajaxSubmit("insertData.do",obj,function(rslt){
			 $("#insertModal #insertForm input[name='empEmno']").val(rslt.empEmno);
			 $("#insertModal #insertForm input[name='deptName']").val(rslt.deptName);
			 $("#insertModal #insertForm input[name='empName']").val(rslt.empName);
			 $("#insertModal #insertForm input[name='rankName']").val(rslt.rankName);
		});
		
	}
	
	
	
</script>