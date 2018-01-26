<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가개수설정</title>
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<style>
.table > tbody > tr > td { 
	vertical-align: middle;
}
</style>
<script type="text/javascript">

var formId = "vacCntSelectFrm"; //초기, 검색할 때 id를 기본값으로 세팅

//document.ready
$(function(){
// 	vacCntEmpList(); //사원정보 리스트 ajax
	Calender(); //년도달력
	vacCntEmpSignUpCntNum(); //사원등록 개수
}); 

//검색
function vacCntEmpListSearch(){
	vacCntEmpList(); //사원정보 리스트 ajax
}

//휴가일수 자동계산을 눌렀을때
function vacCntCalculation(){
	formId = "vacCntEmpFrm";
	vacCntEmpList(); //사원정보 리스트 ajax
}

//저장을 눌렀을 때
function vacCntSave(){
	formId = "vacCntEmpFrm";
	vacCntEmpList(); //사원정보 리스트 ajax
}

//퇴직자 포함 체크여부
function retrCheck(){
	if(($('#retrChk').prop("checked")) == true ){
		$('#retrDelYn').val('on');
	}else{
		$('#retrDelYn').val('off');
	}
}

//사원정보 리스트 ajax
function vacCntEmpList(){
	retrCheck(); //퇴직자 포함 체크여부

	paging.ajaxFormSubmit("vacationCountEmpList.ajax", formId, function(rslt){
		console.log("ajaxFormSubmit -> callback");
		console.log("결과데이터:"+JSON.stringify(rslt));

 		$('#vacCntEmpListTbody').empty(); //이전 리스트 삭제
		$('#vacCntEmpListTable').children('thead').css('width','calc(100% - 1.1em)'); //테이블 스크롤 css

		if(rslt == null){
			$('#vacCntEmpListTbody').append( //리스트가 없을 경우 : 조회된 데이터가 없습니다
 				"<div class='text-center'><br><br><br><br>조회할 데이터가 없습니다.</div>"
 			);
		}else if(rslt.success == "Y"){
 			$.each(rslt.vacationCountEmpList, function(k, v) {
				$('#vacCntEmpListTbody').append(
 					"<tr style='display:table;width:100%;table-layout:fixed;'>"+
						"<td style='width:6%;'>"+
							"<label class='fancy-checkbox-inline'>"+
								"<input type='checkbox' id='emnoChk'>"+ //checkbox
								"<span></span>"+
							"</label>"+
						"</td>"+
						"<td style='width:12%;' class='align-middle'>"+ v.retrDelYn +"</td>"+ //사원번호
						"<td style='width:12%;' class='align-middle'>"+ v.empEmno +"</td>"+ //사원번호
						"<td style='width:12%;'>"+ v.empName +"</td>"+ //사원명
						"<td style='width:12%;'>"+ v.deptName +"</td>"+ //부서명
						"<td style='width:12%;'>"+ v.rankName +"</td>"+ //직급명
						"<td style='width:12%;'>"+ v.retrIncoDate +"</td>"+ //입사일자
						"<td><input type='text' class='form-control' id='empIncoDate'>일</td>"+
					"</tr>"
				);
 			});

 			$('.table tr').children().addClass('text-center'); //테이블 내용 가운데정렬
			//테이블 정렬
			$(function(){
				$("#vacCntEmpListTable").tablesorter();
			});
			$(function(){ 
				$("#vacCntEmpListTable").tablesorter({sortList: [[0,0], [1,0]]});
			});
		}
	});
}

/* 체크박스 전체선택 */
function checkAllFunc(){ //최상단 체크박스를 click하면
	if($('#retrChkAll').is(":checked")){
		$("input[type=checkbox][id=emnoChk]").prop('checked', true);
	}else{
		$("input[type=checkbox][id=emnoChk]").prop('checked', false);
	}
}

//년도 달력
function Calender(){
	$('#baseYear').val(moment().format('YYYY'));
  $('#yearDateTimePicker').datetimepicker({
		viewMode: 'years', //올해 년도 보여줌
	format: 'YYYY'
	});
}

// 휴가신청현황 페이지로 이동 
function vacCntEmpSignUp(){
	window.location.href = "${pageContext.request.contextPath}/vacationCountEmpSignUp";
}

//휴가일수설정 사원등록 필요 사원 개수
function vacCntEmpSignUpCntNum(){
	paging.ajaxSubmit("vacationCountEmpSignUpCntNum.ajax", "", function(rslt){
		console.log("ajaxFormSubmit -> callback");
		console.log("결과데이터:"+JSON.stringify(rslt));
		$("#empSignUpCntNum").html(rslt);
	});	
}



</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가개수설정</h3>
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">휴가항목 선택</h3> -->
<!-- 							<p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
<!-- 					</div> -->
					<div class="panel-body">
						<form class="form-inline" id="vacCntSelectFrm">
<!-- 							<i class="fa fa-asterisk-red" aria-hidden="true" ></i>							 -->
							기준년도
							<!-- 달력 -->
							<div class="input-group date" id="yearDateTimePicker">
						  	<input type="text" class="form-control" id="baseYear"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>&nbsp;&nbsp;&nbsp;
							검색어
							<select name="" value="seacrchOption" class="form-control">
								<option value="name">성명</option>
								<option value="number">사번</option>
								<option value="">부서</option>
							</select>
							<input type="text" class="form-control">
							&nbsp;&nbsp;&nbsp;
							<label class="fancy-checkbox-inline">
								<input type="checkbox" id="retrChk">
								<span>퇴직자 포함</span>
							</label>
							<input type="hidden" name="retrDelYn" id="retrDelYn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-primary" id="searchBtn" onclick="vacCntEmpListSearch()" value="검색">
							<button class="btn btn-danger" type="button" name="prog" style="float:right;" onclick="vacCntEmpSignUp()" >
								사원등록&nbsp;
								<span class="badge" id="empSignUpCntNum"></span>
							</button>
						</form>
					</div>
				</div>
				
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">제목</h3> -->
<!-- 					</div> -->
					<div class="panel-body"> 
						<div class="list_wrapper">
							<form class="form-inline" id="vacCntEmpFrm">
								<table class="table" id="vacCntEmpListTable">
									<thead style="display:table;width:100%;table-layout:fixed;">
										<tr>
											<th style="width:6%;">
												<label class="fancy-checkbox-inline">
													<input type="checkbox" id="retrChkAll" onclick="checkAllFunc()">
													<span></span>
												</label>
												<input type="hidden" name="retrDelYn" id="retrDelYn">
											</th>
											<th style='width:12%;'>구분</th>
											<th style='width:12%;'>사원번호</th>
											<th style='width:12%;'>성명</th>
											<th style='width:12%;'>부서</th>
											<th style='width:12%;'>직위</th>
											<th style='width:12%;'>입사일</th>
											<th>휴가일수</th>
										</tr>
									</thead>
									<tbody id="vacCntEmpListTbody" style="display:block;height:400px;overflow:auto;">
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<label class="fancy-checkbox-inline"> -->
<!-- 													<input type="checkbox" name=""> -->
<!-- 													<span></span> -->
<!-- 												</label> -->
<!-- 											</td> -->
<!-- 											<td>123456</td> -->
<!-- 											<td>개츠비</td> -->
<!-- 											<td>개발팀</td> -->
<!-- 											<td>팀장</td> -->
<!-- 											<td>2007-10-15</td> -->
<!-- 											<td><input type="text" name="" value="" class="form-control">일</td> -->
<!-- 										</tr> -->
									</tbody>
								</table>
							</form>
						</div>
						<!-- END list table 영역 -->
						    
						<!-- 버튼영역 -->
						<div class="text-center"><br>
							<button type="button" class="btn btn-info" id="vacCntCalculationBtn" onclick="vacCntCalculation()">휴가일수 자동계산</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-danger" id="vacCntSaveBtn" onclick="vacCntSave()">저장하기</button>
						</div>
						<!-- END 버튼영역 -->
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT -->
	</div>
	<!-- END MAIN -->
</body>
</html>