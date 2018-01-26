<!-- 
	휴가신청(사원) - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가신청</title>
<link type="text/css" rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<script>

	/* ajax-INSERT */
	function check_onclick(url, formId){
		paging.ajaxFormSubmit(url, formId, function(rslt){
			console.log("ajaxFormSubmit -> callback");
			console.log("결과데이타" + JSON.stringify(rslt));
			
// 			insert 성공여부에 따른 alert창 띄우기
			if(rslt.success == "Y"){
				alert("휴가가 신청되었습니다.");
			}else{
				alert("휴가 신청실패");
			}
		});
	}
	

	
	/* 달력  */
	$(function() {
		
		//오늘 날짜로 보여주기
		$('#vastCrtDate').val(moment().format('YYYY-MM-DD'));	//휴가 신청일
		$('#vastStartDate').val(moment().format('YYYY-MM-DD'));		//휴가 시작일
		$('#vastEndDate').val(moment().format('YYYY-MM-DD'));		//휴가 종료일
		$('#vastVacUd').val(moment().format('1'));
		
		
		$('#crtDate').datetimepicker({ //휴가신청일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});
		
		$('#startDate').datetimepicker({ //휴가시작일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});

		$('#endDate').datetimepicker({ //휴가종료일 달력
			viewMode : 'days',
			format : 'YYYY-MM-DD'
		});

		//휴가종료날짜가 시작날짜 이전인 날짜는 선택 불가능하도록 제한
		$('#startDate').on("dp.change", function(e) {
			$('#endDate').data("DateTimePicker").minDate(e.date);
		});

		//일수 자동 계산 - startDate 변경시
		$('#startDate').on("dp.change", function() { //시작날짜를 변경할 때마다
			var startDate = moment($('#vastStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#vastEndDate').val(), "YYYYMMDD");

			$('#vastVacUd').val(endDate.diff(startDate, "days")+1 //endDate-startDate를 일수로 출력
			);
		});
		
		
		//일수 자동 계산 - endDate 변경시
		$('#endDate').on("dp.change", function() {
			var startDate = moment($('#vastStartDate').val(), "YYYYMMDD");
			var endDate = moment($('#vastEndDate').val(), "YYYYMMDD");

			$('#vastVacUd').val(endDate.diff(startDate, "days")+1 //endDate-startDate를 일수로 출력
			);
		});
		
	});//달력


	/* 휴가 중 반차 선택시 일수가 0.5로 변경 */
	function halfSelect(){
		if($("#vastC option:selected").text() == "반차"){
			console.log("0.5");	
			$('#vastVacUd').val('0.5');//일수 입력창이 0.5로 바뀜
// 			$('#vastVacUd').attr("disabled",true);
		} else{
			$('#vastVacUd').val(moment().format('1'));
		}
	}//halfSelect
	
	
 	/* 사원 선택 모달창 */
	// 체크박스 선택 1개로 제한(라디오버튼처럼)
	$(function(){
		$("input[type='checkbox'][name=emnoChk]").click(function(){
			if($(this).prop('checked')){ //check 이벤트가 발생했는지
				//체크박스 전체를 checked 해제후 click한 요소만 true로 지정
				$("input[type='checkbox'][name=emnoChk]").prop("checked", false);
				$(this).prop('checked',true);
			}
		});
	});
	
	//선택한 사원정보를 출장신청 폼에 자동 입력하기
 	function emnoClick(){
 		var chkTr = $('input[name=emnoChk]:checked').closest('tr'); //체크된 체크박스와 가장 가까운 tr
 		var empEmnoVal = chkTr.children().eq(1).text(); //tr 하부 2번째 td의 텍스트(사번)
 		var empNameVal = chkTr.children().eq(2).text(); //tr 하부 3번째 td의 텍스트(이름)
 		var deptNameVal = chkTr.children().eq(3).text(); //tr 하부 4번째 td의 텍스트(부서)
 		var rankNameVal = chkTr.children().eq(4).text(); //tr 하부 5번째 td의 텍스트(직급)
 		
//  		console.log(emnoVal, nameVal, departmentVal, positionVal);
 		
 		$('#empEmno').val(empEmnoVal);
 		$('#empName').val(empNameVal);
 		$('#deptName').val(deptNameVal);
 		$('#rankName').val(rankNameVal);
 	}
	/* 사원선택 모달 END */
 	

</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
				<h3 class="page-title">휴가신청</h3>
				<div class="panel">
					<div class="panel-body">
						<form class="form-inline" id="vacReqFrm" name="vacReqFrm" method="post">
							<input type="hidden" name=""><!-- 권한 -->
<!-- 							<input type="hidden" name="empEmno" value="575657036">사원번호 -->
							
							<table class="table table-bordered">
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴가신청일</td>
									<td>
										<!-- 사원 권한: 오늘 날짜 고정 -->
<!-- 									  <input type="text" class="form-control" name="vastCrtDate" id="tDate" readonly> -->
										
										<!-- 관리자 권한: 달력 -->
										<div class="input-group date" id="crtDate">
									  	<input type="text" class="form-control" id="vastCrtDate" name="vastCrtDate"/>
									    <span class="input-group-addon">
										    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
									    </span>
									  </div>

									</td>
									<td><i class="fa fa-asterisk-red" aria-hidden="true"></i>휴가구분</td>
									<td>
										<select name="vastC" class="form-control" name="vastC" id="vastC" value="vastC" onchange="halfSelect(this.vacReqFrm)">
											<option value="yearlyVac" selected="selected">선택</option>			
											<option id="V1" name="vastC" value="V1">연차</option>										
											<option id="V2" name="vastC" value="V2">반차</option>
											<option id="V3" name="vastC" value="V3">생리휴가</option>
											<option id="V4" name="vastC" value="V4">경조휴가</option>
											<option id="V5" name="vastC" value="V5">출산휴가</option>
											<option id="V6" name="vastC" value="V6">병가</option>
<!-- 											<option value="rewardVac">포상휴가</option> -->
										</select>
									</td>
									<td>전자결재상태</td>
									<td><input type="text" class="form-control" name="vastProgressSituation" id="vastProgressSituation" value="승인대기" readonly></td>
<!-- 									<td><i class="fa fa-asterisk-red" aria-hidden="true" ></i>전일/반일</td> -->
<!-- 									<td> -->
<!-- 										<label class="fancy-radio-inline"> -->
<!-- 											<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> -->
<!-- 											<span><i></i>전일</span> -->
<!-- 										</label> -->
<!-- 	 									<label class="fancy-radio-inline"> -->
<!-- 	 										<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> -->
<!-- 	 										<span><i></i>반일</span> -->
<!-- 										</label> -->
<!-- 									</td> -->
								</tr>
								
								<tr><!-- 신청자도 관리자와 사원 기능 따로 만들기 -->
									<td><!-- <i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->신청자</td>
									<td colspan="5">
										<div class="input-group">	
											<input type="text" class="form-control" id="empEmno" name="empEmno" placeholder="사번">
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-search" aria-hidden="true" data-toggle="modal" data-target="#emnoModal"></span> <!-- 검색 아이콘 -->
											</span>
										</div>
											<input type="text" class="form-control" id="empName" placeholder="이름">
											<input type="text" class="form-control" id="deptName" placeholder="부서">
											<input type="text" class="form-control" id="rankName" placeholder="직급">
									</td>									
								</tr>
								
								
								<tr>
									<td><i class="fa fa-asterisk-red" aria-hidden="true" ></i>휴가기간</td>
									<td colspan="5">
										<!-- 달력 start-->
										<div class="input-group date" id="startDate">
									  		<input type="text" class="form-control" id="vastStartDate" name="vastStartDate"/>
										    <span class="input-group-addon">
											    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
										    </span>
										</div>
										~
										<!-- 달력 end-->
										<div class="input-group date" id="endDate">
									  		<input type="text" class="form-control" id="vastEndDate" name="vastEndDate"/>
										    <span class="input-group-addon">
											    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
										    </span>
									  </div>
										(일수: <input type="text" class="form-control" id="vastVacUd" name="vastVacUd" readonly>)
									</td>

								</tr>
								<tr>
									<td>휴가사유</td>
									<td colspan="7"><input type="text" class="form-control" name="vastCont" id="vastCont"></td>
								</tr>
							</table>
							<div class="text-right">
								<button type="button" class="btn btn-primary" onclick="check_onclick('${pageContext.request.contextPath}/vacationRequest.ajax', 'vacReqFrm')">신청하기</button>
							</div>
						</form>
					</div>
				</div>
				
				<div class="panel">
					<div class="panel-body">
						※ 경조사 발생 시 관련 증빙 제출(사망진단서, 청첩장, 출생증명서)
					</div>
				</div>
				
				<!-- 사원번호 Modal -->
				<div id="emnoModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				  
				  <!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<p class="modal-title">사번 정보 조회</p>
						</div>
						<div class="modal-body">
							<div class="search_wrap" style="padding: 0px 10px 20px 15px; ">
								<form class="form-inline">
									검색어&nbsp;<input type="text" class="form-control">&nbsp;&nbsp;&nbsp;
									<label class="fancy-checkbox-inline">
										<input type="checkbox" name="">
										<span>퇴직자 포함</span>
									</label>
									<input type="button" class="btn btn-primary" style="float:right;" name="search" onclick="emnoSearch()" value="검색">
								</form>
							</div>
				
							<div class="list_wrap">
								<table class="table tablesorter table-bordered">
									<tbody>
										<thead>
											<tr>
												<th></th>
												<th>사원번호</th>
												<th>성명</th>
												<th>부서</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<label class="fancy-checkbox-inline">
														<input type="checkbox" name="emnoChk">
														<span></span>
													</label>
												</td>
												<td>0905000211</td>
												<td>강병욱</td>
												<td>개발팀</td>
												<td>사원</td>
											</tr>
											<tr>
												<td>
													<label class="fancy-checkbox-inline">
														<input type="checkbox" name="emnoChk">
														<span></span>
													</label>
												</td>
												<td>2345</td>
												<td>유성실</td>
												<td>개발팀</td>
												<td>사원</td>
											</tr>
											<tr>
												<td>
													<label class="fancy-checkbox-inline">
														<input type="checkbox" name="emnoChk">
														<span></span>
													</label>
												</td>
												<td>17895</td>
												<td>유성실</td>
												<td>개발팀</td>
												<td>사원</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal" onclick="emnoClick()">선택</button>
						</div>
					</div>
				</div>
			</div>
			<!-- END MODAL -->
			</div>
		<!-- END MAIN CONTENT -->
		</div>
	</div>
	<!-- END MAIN -->
</body>
</html>