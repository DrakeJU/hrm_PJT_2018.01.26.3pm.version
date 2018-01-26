<!-- 
	휴가조회(관리자) - 유성실,신지연
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>휴가조회(관리자)</title>
<link type="text/css" rel="stylesheet" href="/spring/resources/common/css/vacation.css" />
<!-- <link type="text/css" rel="stylesheet" href="/spring/resources/common/css/theme.default.css" /> -->
<!-- <script src="/spring/resources/common/js/jquery-latest.min.js"></script> -->
<!-- <script src="/spring/resources/common/js/jquery.tablesorter.widgets.js"></script> -->

<script>
	//테이블 내용 가운데 정렬
	$(document).ready(function() {
	    $('.table tr').children().addClass('text-center');
	    console.log('hg');
	});
	
	
	//테이블 마우스오버시 (행을 지날 때), 색 바뀜
	$(document).ready(function(){
		$('table tbody tr').mouseover(function(){ 
			$(this).css("backgroundColor","#f2f2f2"); 
		}); 
		$('table tr').mouseout(function(){ 
			$(this).css("backgroundColor","#fff"); 
		});
	});
		
	
	//달력
	$(function () {
		$('#startDate').datetimepicker({ //휴가시작일 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
	    
		$('#endDate').datetimepicker({ //휴가종료일 달력
			viewMode: 'days',
			format: 'YYYY-MM-DD'
		});
		
		//휴가종료날짜가 시작날짜 이전인 날짜는 선택 불가능하도록 제한
		$('#startDate').on("dp.change", function(e) {
			$('#endDate').data("DateTimePicker").minDate(e.date);
		});
	});	

	
	//테이블 정렬
	$(function(){
		$("#vacationTable").tablesorter();
	});
	
	$(function(){ 
		$("#vacationTable").tablesorter({sortList: [[0,0], [1,0]]}); 
	});
	
	
	/* 휴가신청현황 페이지로 이동 */
	function vacationProgressList(){
		window.location.href = "${pageContext.request.contextPath}/vacationProgressList";
	}

	//컨트롤러에서 받은 값을 화면에 나타내는 것
	 $(function(){
		paging.ajaxSubmit("vacationProgCntNum.ajax", "", function(rslt){
	         console.log("ajaxFormSubmit -> callback");
	         console.log("결과데이터:"+JSON.stringify(rslt));
	         $("#countNum").html(rslt);
   		 });
	 });
	

</script>
</head>
<body>
	<div class="main" style="min-height: 867px;">
		<div class="main-content">
			<div class="container-fluid">
			<h3 class="page-title">휴가조회(관리자)</h3>
				<div class="panel panel-headline">
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">휴가항목 선택</h3> -->
<!-- 							<p class="subtitle">설명이 필요할 경우 추가 예정</p> -->
<!-- 					</div> -->
					<div class="panel-body">
						<form class="form-inline">
<!-- 							<i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->
							휴가항목 선택
							<select name="vastC" class="form-control" name="vastC" id="vastC" value="vastC" onchange="halfSelect(this.vacReqFrm)">
								<option value="yearlyVac" selected="selected">선택</option>			
								<option id="V1" name="vastC" value="V1">연차</option>										
								<option id="V2" name="vastC" value="V2">반차</option>
								<option id="V3" name="vastC" value="V3">생리휴가</option>
								<option id="V4" name="vastC" value="V4">경조휴가</option>
								<option id="V5" name="vastC" value="V5">출산휴가</option>
								<option id="V6" name="vastC" value="V6">병가</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 							<i class="fa fa-asterisk-red" aria-hidden="true" ></i> -->
							휴가 조회기간
							<!-- 달력 -->
							<div class="input-group date" id="startDate">
								<input type="text" class="form-control" id="vastStartDate" name="vastStartDate"/>
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
								</span>
							</div>
							~
							<!-- 달력 -->
							<div class="input-group date" id="endDate">
						  	<input type="text" class="form-control" id="vastEndDate" name="vastEndDate"/>
						    <span class="input-group-addon">
							    <span class="glyphicon glyphicon-calendar"></span> <!-- 달력 아이콘 -->
						    </span>
						  </div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" class="form-control" value="">
							<input type="button" class="btn btn-primary" name="search" value="검색">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
							<!-- 정렬 조건 -->
							<select name="" value="상태별" class="form-control">
								<option value="">재직</option>
								<option value="">퇴직</option>
							</select>
							
							<select name="" value="부서별" class="form-control">
								<option value="">기획부</option>
								<option value="">인사부</option>
								<option value="">개발부</option>
								<option value="">디자인부</option>
								<option value="">영업부</option>
							</select>
							
							<select name="" value="직급별" class="form-control">
								<option value="">임원진</option>
								<option value="">부장</option>
								<option value="">과장</option>
								<option value="">대리</option>
								<option value="">주임</option>
								<option value="">사원</option>
							</select>
							<button class="btn btn-danger" type="button" name="prog" style="float:right;" onclick="vacationProgressList()" >
								휴가신청현황
								<span class="badge" id="countNum"></span>
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
							<table class="table tablesorter table-bordered" id="vacationTable">
								<thead>
									<tr>
										<th>구분</th>
										<th>사원번호</th>
										<th>성명</th>
										<th>부서</th>
										<th>직위</th>
										<th>휴가항목</th>
										<th>전체</th>
										<th>사용일수</th>
										<th>잔여일수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>재직</td>
										<td>123456</td>
										<td>개츠비</td>
										<td>개발팀</td>
										<td>팀장</td>
										<td>연차</td>
										<td>25</td>
										<td>25</td>
										<td>0</td>
									</tr>
									<tr>
										<td>재직</td>
										<td>123456</td>
										<td>데이지</td>
										<td>기획팀</td>
										<td>팀장</td>
										<td>연차</td>
										<td>25</td>
										<td>25</td>
										<td>0</td>
									</tr>
									<tr>
										<td>퇴직</td>
										<td>123456</td>
										<td>윌슨</td>
										<td>디자인</td>
										<td>대리</td>
										<td>연차</td>
										<td>20</td>
										<td>10</td>
										<td>10</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
						
						<!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog">
						  <div class="modal-dialog">
						
						    <!-- Modal content-->
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal">&times;</button>
						        <p class="modal-title">사원별 휴가현황</p>
						      </div>
						      <div class="modal-body">
						        <h4 class="page-title" align="center">[관리팀] 함서운 부장 휴가현황</h4> <!-- 클릭한 사원에 따라 바뀌게 -->
						        <div class="list_wrapper">
											<table class="table table-bordered">
												<tbody>
													<thead>
														<tr>
															<th>번호</th>
															<th>신청일자</th>
															<th>휴가항목</th>
															<th>휴가기간</th>
															<th>일수</th>
															<th>기타</th>
														</tr>
													</thead>
													<tr>
														<td>1</td>
														<td>2017-01-02</td>
														<td>연차</td>
														<td>2017-01-02~2017-01-04</td>
														<td>3.0</td>
														<td></td>
													</tr>
													<tr>
														<td>2</td>
														<td>2017-02-24</td>
														<td>반차</td>
														<td>2017-02-24</td>
														<td>0.5</td>
														<td></td>
													</tr>
													<tr>
														<td>3</td>
														<td>2017-04-10</td>
														<td>연차</td>
														<td>2017-04-17~2017-04-19</td>
														<td>3.0</td>
														<td></td>
													</tr>
													<tr>
														<th colspan="2" class="text-center">합계</th>
														<th colspan="5">
															·총 휴가일수:19.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															·사용일수:18.0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															·잔여일수:1.0
														</th>
													</tr>
												</tbody>
											</table>
										</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						
						  </div>
						</div>
								
						<!-- paging 영역 -->
						<div align="center">
							<ul class="pagination">
								<li>
									<a title="이전페이지" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
								</li>
								<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
							  <li><a href="#">4</a></li>
							  <li><a href="#">5</a></li>
							  <li>
									<a href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</div>
						<!-- END list table 영역 -->
						    
						<!-- 버튼영역 -->
						<div class="text-center"> 
							<button type="button" class="btn btn-info">인쇄하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-success">엑셀다운</button>
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